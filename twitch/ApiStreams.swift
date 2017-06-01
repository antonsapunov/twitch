//
//  ApiStreamsInfo.swift
//  twitch
//
//  Created by Антон Сапунов on 25.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import Foundation
import ObjectMapper

class ApiStreams: Mappable {
    var streams:[Stream]?
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        streams <- map["streams"]
    }
}
