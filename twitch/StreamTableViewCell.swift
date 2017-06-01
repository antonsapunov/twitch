//
//  TopGamesStreamTableViewCell.swift
//  twitch
//
//  Created by Антон Сапунов on 25.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import UIKit

class StreamTableViewCell: UITableViewCell {

    //Outlets
    
    @IBOutlet weak var streamImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userStatus: UILabel!
    @IBOutlet weak var audienceNumber: UILabel!
    
    func setInfo(_ streams: StreamInformation, _ indexPath: IndexPath) {
        let imageHeight = self.streamImage.frame.size.height
        self.streamImage.image = UIImage(data: streams.imageData[indexPath.row])
        let overlayTop: UIView = UIView(frame: CGRect(x: 0, y: 0, width: self.streamImage.frame.size.width, height: imageHeight/5.5))
        overlayTop.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.4)
        let overlayBottom: UIView = UIView(frame: CGRect(x: 0, y: imageHeight - imageHeight/2.5, width: self.streamImage.frame.size.width, height: imageHeight/2.5))
        overlayBottom.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.4)
        overlayBottom.layer.cornerRadius = 15
        self.streamImage.addSubview(overlayTop)
        self.streamImage.addSubview(overlayBottom)
        self.userName.text = "\(streams.name[indexPath.row]) (\(streams.game[indexPath.row]))"
        self.userStatus.text = streams.status[indexPath.row]
        self.audienceNumber.text = "\(streams.viewers[indexPath.row]) " + NSLocalizedString("users are watching now", comment: "")
    }
}
