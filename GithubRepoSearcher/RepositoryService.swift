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
import SwiftyJSON

class RepositoryService {
    
    var allRepos: [RepoModel] = []
    
    enum Result {
        case success([GithubAllReposModel])
        case error(Error)
    }
    
    func getData() -> [RepoModel] {
        var newAllRepos = [RepoModel]()
        Alamofire.request("http://api.github.com/search/repositories?q=degree").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                //print(swiftyJsonVar)
                var jsonArrayOfRepos = swiftyJsonVar["items"]
                var oneItem = jsonArrayOfRepos[1]
                print(oneItem["name"])
                let aRepo = RepoModel(id: "", name: oneItem["name"].string!)
                newAllRepos.append(aRepo)
                for items in self.allRepos {
                    print(items.name)
                }
            }
        }
        return newAllRepos
    }
}
