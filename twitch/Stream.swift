//
//  Stream.swift
//  twitch
//
//  Created by Антон Сапунов on 30.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import Foundation
import ObjectMapper

class Stream: Mappable {
    var id: Int?
    var game: String?
    var viewers: Int?
    var preview: Preview?
    var channel: Channel?
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        id <- map["_id"]
        game <- map["game"]
        viewers <- map["viewers"]
        preview <- map["preview"]
        channel <- map["channel"]
    }
}
