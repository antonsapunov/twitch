//
//  SearchStreamDataSourse.swift
//  twitch
//
//  Created by Антон Сапунов on 02.06.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import Foundation
import UIKit

class SearchStreamsDataSourse: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var streams: StreamInformation?
    var topDelegate: OpenViewDelegate?
    
    func setStreams(_ streams: StreamInformation) {
        self.streams = streams
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = streams?.name.count {
            print(count)
            return count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchTableViewCell
        cell.searchName.text = streams?.name[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return NSLocalizedString("Streams", comment: "")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let Stream = storyboard.instantiateViewController(withIdentifier: "StreamViewController") as! StreamViewController
        Stream.streamUrl = streams?.url[indexPath.row]
        Stream.streamName = streams?.name[indexPath.row]
        if let delegate = topDelegate {
            delegate.openView(Stream)
        }
    }
}
