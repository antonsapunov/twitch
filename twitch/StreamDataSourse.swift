//
//  StreamDataSourse.swift
//  twitch
//
//  Created by Антон Сапунов on 31.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import Foundation
import UIKit

class StreamDataSourse: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var streams: StreamInformation?
    var topDelegate: OpenViewDelegate?
    
    func setStreams(_ streams: StreamInformation) {
        self.streams = streams
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = streams?.imageData.count {
            print(count)
            return count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StreamCell", for: indexPath) as! StreamTableViewCell
        cell.setInfo(streams!, indexPath)
        return cell
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
