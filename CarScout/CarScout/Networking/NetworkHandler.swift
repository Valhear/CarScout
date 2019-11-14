//
//  NetworkHandler.swift
//  CarScout
//
//  Created by Valentina Henao on 9/11/19.
//  Copyright © 2019 Valentina Henao. All rights reserved.
//

import Foundation

public typealias DownloadFailure = (_ error: NetworkError?) -> Void
public typealias DownloadSuccess = (_ success: [Car]?) -> Void

class NetworkHandler {
    private let serverURL = "https://cdn.sixt.io/codingtask/cars"
    
    /// Retrieves a list of cars from the given URL
    /// - Parameter success: Response with an array of Car Items in case the request is succesful
    /// - Parameter failure: Response with an Error Item in case the request is unsuccesful
    func getCarList(success: @escaping DownloadSuccess, failure: @escaping DownloadFailure) {
        let session = URLSession.shared
        guard let url = URL(string: serverURL) else { return }

        let task = session.dataTask(with: url) { (data, response, error) in
            if let clientError = error, data == nil {
                failure(NetworkError(error: clientError))
                
                return
            }
            //Check for HTTP response code if errors
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                failure(NetworkError(response: response))
               
                return
            }
            guard let mime = response?.mimeType, mime == "application/json" else {
                failure(NetworkError.wrongContentType)
                
                return
            }
            guard let dataResponse = data, let carList = self.decode(dataResponse: dataResponse) else { return }
            
            success(carList)
        }
        
        task.resume()
        
        return
    }
    
    /// Decodes a data object into an array of Car Items
    /// - Parameter dataResponse: Object containing the data to be decoded
    func decode(dataResponse: Data) -> [Car]? {
        //Decode JSON Response Data
        do {
            let decoder = JSONDecoder()
            let carList = try decoder.decode([Car].self, from: dataResponse)
            
            return carList
        } catch let parsingError {
            print("Error", parsingError)
        }
        
        return nil
    }
}
