//
//  GameInfo.swift
//  twitch
//
//  Created by Антон Сапунов on 30.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import Foundation
import ObjectMapper

class GameInfo: Mappable {
    var name: String?
    var id: Int?
    var box: BoxVariables?
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        name <- map["name"]
        id <- map["_id"]
        box <- map["box"]
    }
}
