//
//  RepositoryService.swift
//  GithubRepoSearcher
//
//  Created by Stuart Thomas on 30/08/2018.
//  Copyright © 2018 Stuart Thomas. All rights reserved.
//

import Foundation
import Alamofire
import CodableAlamofire

class RepositoryService {
    
    enum Result {
        case success([GithubAllReposModel])
        case error(Error)
    }
    
    func getData() {

//        let todoEndpoint: String = "http://api.github.com/search/repositories?q=degree"
//        Alamofire.request(todoEndpoint)
//        .responseJSON { response in
//        // check for errors
//        guard response.result.error == nil else {
//        // error in getting the data - handle it
//        print("error calling GET")
//        print(response.result.error!)
//        return
//        }






    //}
        Alamofire.request("http://api.github.com/search/repositories?q=degree").responseJSON { (resData) -> Void in
            //print(resData.result.value!)
            //let strOutput = String(data : resData.result.value! as! Data, encoding : String.Encoding.utf8)
            //print(strOutput)
            if let json = resData.result.value as? [String: AnyObject] {
                //print("JSON: \(json)") // serialized json response
                print(json["items"] ?? "nil")
//                var jdfkn = json["items"]
//                print(jdfkn?["items"] ?? "snope")
                
//                //let anotherPerson = try JSONDecoder().decode(GithubAllReposModel.self, from: json)
//
//                guard let user = json["items"] as? [String: Any],
//                    let apiKey = user["api_key"] as? String else {
//
//                        print("Failed to parse JSON")
//                        return
//                }
//
//                print(apiKey)
            }
            
            
        }
    }
}
