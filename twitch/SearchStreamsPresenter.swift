//
//  SearchStreams.swift
//  twitch
//
//  Created by Антон Сапунов on 29.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import Foundation
import ObjectMapper

class SearchStreamsPresenter {
    
    weak var view: SearchViewController!
    var stream = StreamInformation()
    
    func getSearhResult(_ searchValue: String){
        let info = ApiRequest()
        var set = Set(stream.game)
        info.getSearchResult(searchValue){ [weak self] responseObject, error in
            self?.stream.name.removeAll()
            self?.stream.game.removeAll()
            set.removeAll()
            if let topGameStreams = responseObject?.streams {
                for topStream in topGameStreams {
                    if let streamName = topStream.channel?.name,
                        let streamGame = topStream.game,
                        let streamUrl = topStream.channel?.url {
                            self?.stream.name.append(streamName)
                            self?.stream.url.append(streamUrl)
                            if !set.contains(streamGame){
                                set.insert(streamGame)
                                self?.stream.game.append(streamGame)
                            }
                        
                    }
                }
                self?.view.streams = self?.stream
            }
        }
    }
}
