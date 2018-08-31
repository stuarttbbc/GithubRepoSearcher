//
//  GithubAllReposModel.swift
//  GithubRepoSearcher
//
//  Created by Stuart Thomas on 31/08/2018.
//  Copyright © 2018 Stuart Thomas. All rights reserved.
//

import Foundation

struct GithubAllReposModel: Codable {
    
    let totalCount: String
    var incompleteResults: String
    var items: [RepoModel]
    
    private enum CodingKeys: String, CodingKey {
        case totalCount
        case incompleteResults
        case items
}

}
