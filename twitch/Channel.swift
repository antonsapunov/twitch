//
//  Channel.swift
//  twitch
//
//  Created by Антон Сапунов on 30.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import Foundation
import ObjectMapper

class Channel: Mappable {
    var status: String?
    var display_name: String?
    var name: String?
    var id: Int?
    var url: String?
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        status <- map["status"]
        display_name <- map["display_name"]
        name <- map["name"]
        id <- map["_id"]
        url <- map["url"]
    }
}
