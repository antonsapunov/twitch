//
//  SearchDataSourse.swift
//  twitch
//
//  Created by Антон Сапунов on 02.06.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import Foundation
import UIKit

class SearchGamesDataSourse: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var streams: StreamInformation?
    var topDelegate: OpenViewDelegate?
    
    func setStreams(_ streams: StreamInformation) {
        self.streams = streams
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = streams?.game.count {
            print(count)
            return count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchTableViewCell
        cell.searchName.text = streams?.game[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return NSLocalizedString("Games", comment: "")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let GameStreams = storyboard.instantiateViewController(withIdentifier: "GameStreamsViewController") as! GameStreamsViewController
        GameStreams.gameValue = streams?.game[indexPath.row]
        if let delegate = topDelegate {
            delegate.openView(GameStreams)
        }
    }
}
