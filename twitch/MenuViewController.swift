//
//  MenuTableViewController.swift
//  twitch
//
//  Created by Антон Сапунов on 25.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import UIKit
import SideMenu

class MenuViewController: UIViewController, UISearchBarDelegate, OpenViewDelegate{
    
    //Outlets
    
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var loginButton: UIButton!
    
    //
    
    var searchController: UISearchController!
    var datasourse = MenuTableDataSourse()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.datasourse.setView(menuTableView)
        self.menuTableView.delegate = datasourse
        self.menuTableView.dataSource = datasourse
        self.datasourse.topDelegate = self
        self.navigationItem.title = NSLocalizedString("Menu", comment: "")
        self.loginButton.setTitle(NSLocalizedString("Login", comment: ""), for: .normal)
        self.searchBar.delegate = self
    }
    
    func openView(_ controller: UIViewController) {
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let TopGames = storyboard.instantiateViewController(withIdentifier: "TopGamesViewController") as! TopGamesViewController
//        TopGames.navigationItem.titleView = TopGames.searchController.searchBar
//        TopGames.searchController.searchBar.becomeFirstResponder()
        openView(TopGames)
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let Authentication = storyboard.instantiateViewController(withIdentifier: "Authentication") as! Authentication
        openView(Authentication)
    }

}
