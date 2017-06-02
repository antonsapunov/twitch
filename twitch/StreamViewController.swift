//
//  StreamViewController.swift
//  twitch
//
//  Created by Антон Сапунов on 26.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import UIKit

class StreamViewController: UIViewController, UIWebViewDelegate {

    //Outlets
    
    @IBOutlet weak var streamWebView: UIWebView!
    
    //Fields
    
    var streamUrl: String? = nil
    var streamName: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        streamWebView.delegate = self;
        self.navigationItem.title = streamName
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let url = URL(string: streamUrl!)!
        streamWebView.loadRequest(URLRequest(url: url))
    }
}
