//
//  MenuDataSourse.swift
//  twitch
//
//  Created by Антон Сапунов on 31.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import Foundation
import UIKit

class MenuTableDataSourse: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    let menuItems = [NSLocalizedString("Games", comment: ""),  NSLocalizedString("Streams", comment: "")]
    var topDelegate: OpenViewDelegate?
    var tableView = UITableView()
    
    func setView(_ tableView: UITableView) {
        self.tableView = tableView
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
        let tapLocation = sender.location(in: self.tableView)
        let indexPath : NSIndexPath = self.tableView.indexPathForRow(at: tapLocation)! as NSIndexPath
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var nextView = UIViewController()
        switch indexPath.row {
        case 0:
            nextView = storyboard.instantiateViewController(withIdentifier: "TopGamesViewController") as! TopGamesViewController
        case 1:
            nextView = storyboard.instantiateViewController(withIdentifier: "TopStreamsViewController") as! TopStreamsViewController
        default:
            nextView = storyboard.instantiateViewController(withIdentifier: "TopGamesViewController") as! TopGamesViewController
        }
        if let delegate = topDelegate {
            delegate.openView(nextView)
        }
    }
}
