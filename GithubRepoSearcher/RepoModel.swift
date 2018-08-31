//
//  RepoModel.swift
//  GithubRepoSearcher
//
//  Created by Stuart Thomas on 31/08/2018.
//  Copyright © 2018 Stuart Thomas. All rights reserved.
//

import Foundation

struct RepoModel: Codable {
    
    let id: String
    var name: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    
}
