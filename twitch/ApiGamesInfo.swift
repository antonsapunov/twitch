//
//  GamesInfo.swift
//  twitch
//
//  Created by Антон Сапунов on 25.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import Foundation
import ObjectMapper

class ApiGamesInfo: Mappable {
    var top:[Game]?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        top <- map["top"]
    }
}

class Game: Mappable {
    var game: GameInfo?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        game <- map["game"]
    }
}

class GameInfo: Mappable {
    var name: String?
    var id: Int?
    var box: BoxVariables?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        id <- map["_id"]
        box <- map["box"]
    }
}

class BoxVariables: Mappable {
    var large: String?
    var medium: String?
    var small: String?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        large <- map["large"]
        medium <- map["medium"]
        small <- map["small"]
    }
}
