//
//  Preview.swift
//  twitch
//
//  Created by Антон Сапунов on 30.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import Foundation
import ObjectMapper

class Preview: Mappable {
    var small: String?
    var medium: String?
    var large: String?
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        small <- map["small"]
        medium <- map["medium"]
        large <- map["large"]
    }
}
