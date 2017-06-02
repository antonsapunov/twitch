//
//  ViewController.swift
//  twitch
//
//  Created by Антон Сапунов on 10.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import UIKit
import SideMenu

class TopGamesViewController: UIViewController, OpenViewDelegate {

    //Outlets
    
    @IBOutlet weak var gamesCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //Fields
    
    let presenter = TopGamesPresenter()
    let datasourse = TopGamesDataSourse()
    var games: GameInformation? {
        didSet {
            datasourse.setGames(games!, self.view)
            activityIndicator.stopAnimating()
            self.gamesCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.view = self
        self.gamesCollectionView.delegate = datasourse
        self.gamesCollectionView.dataSource = datasourse
        self.datasourse.topDelegate = self
        self.navigationItem.title = NSLocalizedString("Top Games", comment: "")
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 88/255, green: 69/255, blue: 156/255, alpha: 1.0)
        
        sideMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.presenter.getGamesInfo()
    }
    
    func openView(_ controller: UIViewController) {
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func sideMenu() {
        let menuRightNavigationController = storyboard!.instantiateViewController(withIdentifier: "UISideMenuNavigationController") as! UISideMenuNavigationController
        SideMenuManager.menuRightNavigationController = menuRightNavigationController
        SideMenuManager.menuWidth = 250
        SideMenuManager.menuPushStyle = .popWhenPossible
        SideMenuManager.menuPresentMode = .menuSlideIn
    }
}

