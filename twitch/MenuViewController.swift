//
//  MenuTableViewController.swift
//  twitch
//
//  Created by Антон Сапунов on 25.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import UIKit
import SideMenu

class MenuViewController: UIViewController, OpenViewDelegate {
    
    //Outlets
    
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var loginButton: UIButton!
    
    //Fields
    
    let datasourse = MenuTableDataSourse()
    var searchBarDelegate = SearchBarDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.datasourse.setView(menuTableView)
        self.menuTableView.delegate = datasourse
        self.menuTableView.dataSource = datasourse
        self.datasourse.topDelegate = self
        self.searchBarDelegate.searchDelegate = self
        self.navigationItem.title = NSLocalizedString("Menu", comment: "")
        self.loginButton.setTitle(NSLocalizedString("Login", comment: ""), for: .normal)
        self.searchBar.delegate = searchBarDelegate
    }
    
    func openView(_ controller: UIViewController) {
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let Authentication = storyboard.instantiateViewController(withIdentifier: "Authentication") as! Authentication
        openView(Authentication)
    }

}
