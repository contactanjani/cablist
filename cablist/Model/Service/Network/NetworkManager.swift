//
//  NetworkManager.swift
//  cablist
//
//  Created by Anjani on 9/30/17.
//  Copyright © 2017 Landmark Group. All rights reserved.
//

import Foundation

class NetworkManager {
    
    private init() {}
    static let shared = NetworkManager()  //swift style of singleton
    
    func fireRequest(_ request : URLRequest, completion : @escaping ((_ responseDictionary : [String:Any]?) -> Void)) {
        
        let session = URLSession.shared
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30.0
        configuration.timeoutIntervalForResource = 30.0
        
        session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if let err = error as? URLError, err.code  == URLError.Code.notConnectedToInternet {
                let responseDictionary = ["error":"No network"]
                completion(responseDictionary)
                return
            }
            
            guard data != nil else {
                let responseDictionary = ["error":"No data received"]
                completion(responseDictionary)
                return
            }
            do {
                let responseDictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as? [String:Any]
                completion(responseDictionary)
            }
            catch {
                completion(nil)
            }
        }) .resume()
    }
}
