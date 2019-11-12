//
//  NetworkHandler.swift
//  CarScout
//
//  Created by Valentina Henao on 9/11/19.
//  Copyright © 2019 Valentina Henao. All rights reserved.
//

import Foundation

class NetworkHandler {
    var cars = [Car]()
    
    func getCarList() -> [Car] {
        
        //TODO: Network Request
        let session = URLSession.shared
        guard let url = URL(string: "https://cdn.sixt.io/codingtask/cars") else { return cars }

        let task = session.dataTask(with: url) { (data, response, error) in
            print(data)
            print(response)
            print(error)
            
            
            //TODO: Implement Error Handling for all this cases
            
            //Check for errors in response
            if error != nil {
                //Throw an error with throw and use promises to deal with any thrown or passed errors in the chain’s .catch clause
                //self.handleClientError(error)
                return
            }
            
            //Check for HTTP response code if errors
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                //self.handleServerError(response)
                return
            }
            
            guard let mime = response?.mimeType, mime == "application/json" else {
                //TODO: Recover from the error
                print("Wrong MIME type!")
                return
            }
            
            if let json = try? JSONSerialization.jsonObject(with: data!, options: []) {
                print(json)
            }
        }
        
        task.resume()
        
        
        //Get json from Local json file
        guard let filePath = Bundle.main.url(forResource: "carList", withExtension: "json") else { return cars }
        guard let dataResponse = try? Data(contentsOf: filePath) else { return cars }
        
        decode(dataResponse: dataResponse)
        
        
        //serverUrl: https://cdn.sixt.io/codingtask/cars
        
        
        
        return cars
    }
    
    func decode(dataResponse: Data) {
        //Decode JSON Response Data
        do {
            let decoder = JSONDecoder()
            let carList = try decoder.decode([Car].self, from: dataResponse)
            cars = carList
        } catch let parsingError {
            print("Error", parsingError)
        }
    }
}
