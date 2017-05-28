//
//  MenuTableViewController.swift
//  twitch
//
//  Created by Антон Сапунов on 25.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import UIKit
import SideMenu

class MenuTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let menuItems = ["Games", "Streams"]
    @IBOutlet weak var menuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuTableView.delegate = self
        self.menuTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItem", for: indexPath) 
        as! MenuTableViewCell
        cell.menuButton.setTitle(menuItems[indexPath.row], for: .normal)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(openView(sender:)))
        cell.menuButton.addGestureRecognizer(gesture)
        return cell
    }
    
    func openView(sender: UITapGestureRecognizer) {
        let tapLocation = sender.location(in: self.menuTableView)
        let indexPath : NSIndexPath = self.menuTableView.indexPathForRow(at: tapLocation)! as NSIndexPath
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        switch indexPath.row {
        case 0:
            let TopGames = storyboard.instantiateViewController(withIdentifier: "TopGamesViewController") as! TopGamesViewController
            self.navigationController?.pushViewController(TopGames, animated: true)
        case 1:
            let TopStreams = storyboard.instantiateViewController(withIdentifier: "TopStreamsViewController") as! TopStreamsViewController
            self.navigationController?.pushViewController(TopStreams, animated: true)
        default:
            let TopGames = storyboard.instantiateViewController(withIdentifier: "TopGamesViewController") as! TopGamesViewController
            self.navigationController?.pushViewController(TopGames, animated: true)
        }
    }
    @IBAction func loginButton(_ sender: UIButton) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let Authentication = storyboard.instantiateViewController(withIdentifier: "Authentication") as! Authentication
        self.navigationController?.pushViewController(Authentication, animated: true)
    }

}
