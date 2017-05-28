//
//  StreamViewController.swift
//  twitch
//
//  Created by Антон Сапунов on 26.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import UIKit

class StreamViewController: UIViewController, UIWebViewDelegate {

    
    @IBOutlet weak var streamWebView: UIWebView!
    var streamUrl: String? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        streamWebView.delegate = self;
    }
    override func viewWillAppear(_ animated: Bool) {
        let url = URL(string: streamUrl!)!
        
        streamWebView.loadRequest(URLRequest(url: url))
    }


}
