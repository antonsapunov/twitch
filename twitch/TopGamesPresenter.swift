//
//  TopGamesPresenter.swift
//  twitch
//
//  Created by Антон Сапунов on 23.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import Foundation
import ObjectMapper

class TopGamesPresenter {
    
    weak var view: TopGamesViewController!
    var game = GameInformation()
    
    func getGamesInfo(){
        let info = ApiRequest()
        info.getTopGames() { [weak self] responseObject, error in
            if let topGames = responseObject?.top {
                self?.game.game.removeAll()
                self?.game.imageData.removeAll()
                for topGame in topGames {
                    let gameImage = topGame.game?.box?.large
                    if let gameImageUrl = URL(string: gameImage!) {
                        do {
                            let imageData = try Data(contentsOf: gameImageUrl as URL)
                            self?.game.imageData.append(imageData)
                        } catch {
                            print("Unable to load data: \(error)")
                        }
                    }
                    if let gameName = topGame.game?.name {
                        self?.game.game.append(gameName)
                    }
                }
                self?.view.games = self?.game
            }
        }
    }
}
