//
//  TopStreamsViewController.swift
//  twitch
//
//  Created by Антон Сапунов on 26.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import UIKit

class TopStreamsViewController: UIViewController, OpenViewDelegate {

    // Outlets
    
    @IBOutlet weak var topStreamsTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //Fields
    
    let datasourse = StreamDataSourse()
    let presenter = TopStreamsPresenter()
    var streams: StreamInformation? {
        didSet {
            datasourse.setStreams(streams!)
            self.topStreamsTableView.reloadData()
            self.activityIndicator.stopAnimating()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        self.topStreamsTableView.delegate = datasourse
        self.topStreamsTableView.dataSource = datasourse
        self.datasourse.topDelegate = self
        self.navigationItem.title = NSLocalizedString("Top Streams", comment: "")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.getStreams()
    }
    
    func openView(_ controller: UIViewController) {
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
