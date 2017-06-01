//
//  BoxVariables.swift
//  twitch
//
//  Created by Антон Сапунов on 30.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import Foundation
import ObjectMapper

class BoxVariables: Mappable {
    var large: String?
    var medium: String?
    var small: String?
    
    required init?(map: Map){}
    
    func mapping(map: Map) {
        large <- map["large"]
        medium <- map["medium"]
        small <- map["small"]
    }
}
