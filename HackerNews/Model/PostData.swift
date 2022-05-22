//
//  PostData.swift
//  HackerNews
//
//  Created by TEJVEER SINGH on 2022-05-19.
//

import Foundation

struct Result: Decodable {
    let hits:  [Post]
}

struct Post: Decodable, Identifiable {
    var id: String{
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
