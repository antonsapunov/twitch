//
//  TopGamesDataSourse.swift
//  twitch
//
//  Created by Антон Сапунов on 30.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import Foundation
import UIKit

class TopGamesDataSourse: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var games: GameInformation?
    var view = UIView()
    var topDelegate: OpenViewDelegate?
    
    func setGames(_ games: GameInformation, _ view: UIView) {
        self.games = games
        self.view = view
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = self.games?.imageData.count {
            print(count)
            return count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as! GamesCollectionViewCell
        cell.gameCellImageView.image = UIImage(data:(self.games?.imageData[indexPath.row])!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let picDimension = self.view.frame.size.width / 2.17
        return CGSize(width: picDimension, height: picDimension*5/4)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let leftRightInset = self.view.frame.size.width / 40.0
        return UIEdgeInsetsMake(0, leftRightInset, 0, leftRightInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let GameStreams = storyboard.instantiateViewController(withIdentifier: "GameStreamsViewController") as! GameStreamsViewController
        GameStreams.gameValue = self.games?.game[indexPath.row]
        if let delegate = self.topDelegate {
            delegate.openView(GameStreams)
        }
    }
}
