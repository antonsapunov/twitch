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

class ApiRequest {
    
    let constans = StringConstants()
    
    func getTopGames(completionHandler: @escaping (ApiGames?, Error?) -> ()) {
        Alamofire.request(constans.topGamesUrl, parameters: [ constans.clientKey : constans.clientValue]).responseObject {
            (response: DataResponse<ApiGames>) in
            switch response.result{
            case .success(let value):
                completionHandler(value, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }
    }
    
    func getTopGameStreams(_ gameValue: String, completionHandler: @escaping (ApiStreams?, Error?) -> ()) {
        Alamofire.request(constans.topStreamsUrl, parameters:
            [   constans.gameKey : gameValue,
                constans.clientKey : constans.clientValue]).responseObject {
            (response: DataResponse<ApiStreams>) in
            switch response.result{
            case .success(let value):
                completionHandler(value, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
            
        }
    }
    
    func getTopStreams(completionHandler: @escaping (ApiStreams?, Error?) -> ()) {
        Alamofire.request(constans.topStreamsUrl, parameters:
            [ constans.clientKey : constans.clientValue]).responseObject {
                    (response: DataResponse<ApiStreams>) in
                    switch response.result{
                    case .success(let value):
                        completionHandler(value, nil)
                    case .failure(let error):
                        completionHandler(nil, error)
                    }
                    
        }
    }
    
    func getStreamSearchResult(_ searchValue: String, completionHandler: @escaping (ApiStreams?, Error?) -> ()) {
        Alamofire.request(constans.topStreamsUrl, parameters:
            [   constans.searchKey : searchValue,
                constans.clientKey : constans.clientValue]).responseObject {
                    (response: DataResponse<ApiStreams>) in
                    switch response.result{
                    case .success(let value):
                        completionHandler(value, nil)
                    case .failure(let error):
                        completionHandler(nil, error)
                    }
                    
        }
    }
}
