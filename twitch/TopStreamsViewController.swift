//
//  TopStreamsViewController.swift
//  twitch
//
//  Created by Антон Сапунов on 26.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import UIKit

class TopStreamsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var topStreamsTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var streams: StreamInformation? {
        didSet {
            self.topStreamsTableView.reloadData()
            self.activityIndicator.stopAnimating()
        }
    }
    let presenter = TopStreams()
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        self.topStreamsTableView.delegate = self
        self.topStreamsTableView.dataSource = self
        self.navigationItem.title = NSLocalizedString("Top Streams", comment: "")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.getStreams()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = streams?.imageData.count {
            print(count)
            return count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height / 3.3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StreamCell", for: indexPath) as! TopGamesStreamTableViewCell
        cell.streamImage.image = UIImage(data: (streams?.imageData[indexPath.row])!)
        cell.userName.text = "\((streams?.name[indexPath.row])!) (\((streams?.game[indexPath.row])!))"
        cell.userStatus.text = streams?.status[indexPath.row]
        cell.audienceNumber.text = "\((streams?.viewers[indexPath.row])!)" + NSLocalizedString("users are watching now", comment: "")
        cell.streamImage.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(openStream(sender:)))
        cell.streamImage.addGestureRecognizer(gesture)
        return cell
    }
    func openStream(sender: UITapGestureRecognizer) {
        let tapLocation = sender.location(in: self.topStreamsTableView)
        let indexPath : NSIndexPath = self.topStreamsTableView.indexPathForRow(at: tapLocation)! as NSIndexPath
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let Stream = storyboard.instantiateViewController(withIdentifier: "StreamViewController") as! StreamViewController
        Stream.streamUrl = streams?.url[indexPath.row]
        Stream.streamName = streams?.name[indexPath.row]
        self.navigationController?.pushViewController(Stream, animated: true)
    }

}
