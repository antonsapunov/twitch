//
//  GamesInfo.swift
//  twitch
//
//  Created by Антон Сапунов on 25.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import Foundation
import ObjectMapper

class ApiGames: Mappable {
    var top:[Game]?
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        top <- map["top"]
    }
}
