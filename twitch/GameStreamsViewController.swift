//
//  GameStreamsViewController.swift
//  twitch
//
//  Created by Антон Сапунов on 25.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import UIKit

class GameStreamsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var streamsTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var streams: StreamInformation? {
        didSet {
            self.streamsTableView.reloadData()
            self.activityIndicator.stopAnimating()
        }
    }
    let presenter = GameStreams()
    var gameValue: String? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        self.streamsTableView.delegate = self
        self.streamsTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(gameValue!)
        presenter.getGameStreams(gameValue!)
        self.navigationItem.title = gameValue!
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameStreamCell", for: indexPath) as! TopGamesStreamTableViewCell
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
        let tapLocation = sender.location(in: self.streamsTableView)
        let indexPath : NSIndexPath = self.streamsTableView.indexPathForRow(at: tapLocation)! as NSIndexPath
        
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let Stream = storyboard.instantiateViewController(withIdentifier: "StreamViewController") as! StreamViewController
        Stream.streamUrl = streams?.url[indexPath.row]
        Stream.streamName = streams?.name[indexPath.row]
        self.navigationController?.pushViewController(Stream, animated: true)
    }
}
