//
//  GameStreamsViewController.swift
//  twitch
//
//  Created by Антон Сапунов on 25.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import UIKit

class GameStreamsViewController: UIViewController, OpenViewDelegate {
    
    //Outlets
    
    @IBOutlet weak var streamsTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //Fields
    
    let datasourse = StreamDataSourse()
    let presenter = GameStreamsPresenter()
    var gameValue: String? = nil
    var streams: StreamInformation? {
        didSet {
            datasourse.setStreams(streams!)
            self.streamsTableView.reloadData()
            self.activityIndicator.stopAnimating()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        self.streamsTableView.delegate = datasourse
        self.streamsTableView.dataSource = datasourse
        self.datasourse.topDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(gameValue!)
        presenter.getGameStreams(gameValue!)
        self.navigationItem.title = gameValue!
    }
    
    func openView(_ controller: UIViewController) {
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
