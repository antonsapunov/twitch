//
//  Game.swift
//  twitch
//
//  Created by Антон Сапунов on 30.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import Foundation
import ObjectMapper

class Game: Mappable {
    var game: GameInfo?
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        game <- map["game"]
    }
}
