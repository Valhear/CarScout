//
//  NetworkHandler.swift
//  CarScout
//
//  Created by Valentina Henao on 9/11/19.
//  Copyright © 2019 Valentina Henao. All rights reserved.
//

import Foundation

class NetworkHandler {
    let serverURL = "https://cdn.sixt.io/codingtask/cars"
    
    //TODO Handle/return failure block in case of errors
    func getCarList(success: @escaping ([Car]) -> Void) {
        
        //TODO: Network Request
        let session = URLSession.shared
        guard let url = URL(string: serverURL) else { return }

        let task = session.dataTask(with: url) { (data, response, error) in
            //TODO: Implement Error Handling below cases
            
            //Check for errors in response
            if error != nil || data == nil {
                //Throw an error with throw
                //use promises to deal with any thrown or passed errors in the chain’s .catch clause
                print("Client error!")
                //self.handleClientError(error)
                return
            }
            
            //Check for HTTP response code if errors
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Server error!")
                //self.handleServerError(response)
                return
            }
            
            guard let mime = response?.mimeType, mime == "application/json" else {
                //TODO: Recover from the error
                print("Wrong MIME type!")
                return
            }
            
            guard let dataResponse = data, let carList = self.decode(dataResponse: dataResponse) else {
                return
            }
            success(carList)
        }
        
        task.resume()
        
        return
    }
    
    //TODO: Handle Error in case of failure decode
    func decode(dataResponse: Data) -> [Car]? {
        //Decode JSON Response Data
        do {
            let decoder = JSONDecoder()
            let carList = try decoder.decode([Car].self, from: dataResponse)
            
            return carList
        } catch let parsingError {
            //Throw
            print("Error", parsingError)
        }
        
        return nil
    }
}
