//
//  TwitchInfo.swift
//  twitch
//
//  Created by Антон Сапунов on 23.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class TwitchInfo {
    let topGamesUrl: String = "https://api.twitch.tv/kraken/games/top"
    let topStreamsUrl: String = "https://api.twitch.tv/kraken/streams/"
    let clientKey: String = "client_id"
    let clientValue: String = "ui9tucuaxqy3arxbm47ewewtqiknop"
    let gameKey: String = "game"
    
    func getTopGames(completionHandler: @escaping (ApiGamesInfo?, Error?) -> ()) {
        Alamofire.request(topGamesUrl, parameters: [ clientKey : clientValue]).responseObject {
            (response: DataResponse<ApiGamesInfo>) in
            switch response.result{
            case .success(let value):
                completionHandler(value, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }
    }
    func getTopGameStreams(_ gameValue: String, completionHandler: @escaping (ApiStreamsInfo?, Error?) -> ()) {
        Alamofire.request(topStreamsUrl, parameters:
            [   gameKey : gameValue,
                clientKey : clientValue]).responseObject {
            (response: DataResponse<ApiStreamsInfo>) in
            switch response.result{
            case .success(let value):
                completionHandler(value, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }
    }
    
    func getTopStreams(completionHandler: @escaping (ApiStreamsInfo?, Error?) -> ()) {
        Alamofire.request(topStreamsUrl, parameters:
            [ clientKey : clientValue]).responseObject {
                    (response: DataResponse<ApiStreamsInfo>) in
                    switch response.result{
                    case .success(let value):
                        completionHandler(value, nil)
                    case .failure(let error):
                        completionHandler(nil, error)
                    }
                    
        }
    }

}
