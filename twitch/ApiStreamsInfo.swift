//
//  ApiStreamsInfo.swift
//  twitch
//
//  Created by Антон Сапунов on 25.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import Foundation
import ObjectMapper

class ApiStreamsInfo: Mappable {
    var streams:[Stream]?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        streams <- map["streams"]
    }
}

class Stream: Mappable {
    var id: Int?
    var game: String?
    var viewers: Int?
    var preview: Preview?
    var channel: Chennel?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        id <- map["_id"]
        game <- map["game"]
        viewers <- map["viewers"]
        preview <- map["preview"]
        channel <- map["channel"]
    }
}

class Preview: Mappable {
    var small: String?
    var medium: String?
    var large: String?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        small <- map["small"]
        medium <- map["medium"]
        large <- map["large"]
    }
}
class Chennel: Mappable {
    var status: String?
    var display_name: String?
    var name: String?
    var id: Int?
    var url: String?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        display_name <- map["display_name"]
        name <- map["name"]
        id <- map["_id"]
        url <- map["url"]
    }
}
