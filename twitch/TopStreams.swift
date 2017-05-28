//
//  TopStreams.swift
//  twitch
//
//  Created by Антон Сапунов on 26.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import Foundation
import ObjectMapper

class TopStreams {
    
    weak var view: TopStreamsViewController!
    
    var stream = StreamInformation()
    func getStreams(){
        let info = TwitchInfo()
        info.getTopStreams(){ responseObject, error in
            if let topGameStreams = responseObject?.streams {
                for topStream in topGameStreams {
                    let streamImage = topStream.preview?.large
                    if let streamImageUrl = URL(string: streamImage!) {
                        do {
                            let imageData = try Data(contentsOf: streamImageUrl as URL)
                            self.stream.imageData.append(imageData)
                        } catch {
                            print("Unable to load data: \(error)")
                        }
                    }
                    if let streamDisplayName = topStream.channel?.display_name,
                        let streamName = topStream.channel?.name,
                        let streamStatus = topStream.channel?.status,
                        let streamViewers = topStream.viewers,
                        let streamUrl = topStream.channel?.url,
                        let streamGame = topStream.game {
                            self.stream.displayName.append(streamDisplayName)
                            self.stream.name.append(streamName)
                            self.stream.status.append(streamStatus)
                            self.stream.viewers.append(streamViewers)
                            self.stream.url.append(streamUrl)
                            self.stream.game.append(streamGame)
                    }
                }
                self.view.streams = self.stream
            }
        }
    }
}
