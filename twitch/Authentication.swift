//
//  ViewController2.swift
//  twitch
//
//  Created by Антон Сапунов on 10.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class Authentication: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self;
    }
    override func viewWillAppear(_ animated: Bool) {
        let url = URL(string: "https://api.twitch.tv/kraken/oauth2/authorize?response_type=token&client_id=ui9tucuaxqy3arxbm47ewewtqiknop&redirect_uri=http://localhost")!
        
        webView.loadRequest(URLRequest(url: url))
        
    }

    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let req = request.url?.absoluteString
        print("Redirecting to URL: \(req!)");
        if(req?.contains("http://localhost/#access_token"))!{
            if let match = req?.range(of: "(?<=ken=)[^&]+",
                                      options: .regularExpression) {
                print("token = " + (req?.substring(with: match))!)
            }
            self.navigationController?.popViewController(animated: true)
        }
        
        return true;
    }
}
