//
//  MarvelAPI.swift
//  Marvel
//
//  Created by João Igor de Andrade Oliveira on 30/06/21.
//

import Foundation
import SwiftHash
import Alamofire

class MarvelAPI {
    static private let basePath = "https://gateway.marvel.com/v1/public/characters?"
    static private let privateKey = "73061a3a37555961208bb8c6e42bd4065e70b476"
    static private let publicKey = "165565370af448f763037979cd660e93"
    static private let limit = 50
    
    static func loadHeros(name:String?,page: Int = 0, onComplete: @escaping (MarvelInfo?)-> Void){
        let offset = page * limit
        let startsWith: String
        if let name = name, !name.isEmpty{
            startsWith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))&"
        } else {
            startsWith = ""
        }
        let url = basePath+"offset=\(offset)&limit=\(limit)&" + startsWith + getCredentials()
        AF.request(url).responseJSON { response in
            guard let data = response.data else {
                onComplete(nil)
                return
            }
            do{
                let marvelInfo = try JSONDecoder().decode(MarvelInfo.self, from: data)
                onComplete(marvelInfo)
            } catch {
                print(error.localizedDescription)
                onComplete(nil)
            }
            
        }
    }
    
    private class func getCredentials() -> String{
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
}
