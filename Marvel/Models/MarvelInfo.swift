//
//  MarvelInfo.swift
//  Marvel
//
//  Created by João Igor de Andrade Oliveira on 30/06/21.
//

import Foundation

struct MarvelInfo : Codable{
    let code: Int
    let status: String
    let data: MarvelData
}

struct MarvelData : Codable{
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Hero]
}

struct Hero: Codable{
    let id: Int
    let name: String
    let description:String
    let thumbnail: Thumbnail
    let urls: [HeroUrl]
}

struct Thumbnail: Codable{
    let path: String
    //let ext: String
    
    var url: String {
        return path + ".jpg"
    }
}

struct HeroUrl: Codable{
    let type: String
    let url: String
}

