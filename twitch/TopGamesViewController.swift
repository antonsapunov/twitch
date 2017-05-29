//
//  ViewController.swift
//  twitch
//
//  Created by Антон Сапунов on 10.05.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import UIKit
import SideMenu

class TopGamesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var gamesCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var games: GameInformation? {
        didSet {
            self.gamesCollectionView.reloadData()
            activityIndicator.stopAnimating()
        }
    }
    let presenter = TopGames()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.view = self
        self.gamesCollectionView.delegate = self
        self.gamesCollectionView.dataSource = self
        self.navigationItem.title = "Top Games"
        
        let menuRightNavigationController = storyboard!.instantiateViewController(withIdentifier: "UISideMenuNavigationController") as! UISideMenuNavigationController
        SideMenuManager.menuRightNavigationController = menuRightNavigationController
        SideMenuManager.menuWidth = 250
        SideMenuManager.menuPushStyle = .popWhenPossible
        SideMenuManager.menuPresentMode = .menuSlideIn
    }
    override func viewWillAppear(_ animated: Bool) {
        self.presenter.getGamesInfo()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = self.games?.imageData.count {
            print(count)
            return count
        } else {
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as! GamesCollectionViewCell
        cell.gameCellImageView.image = UIImage(data:(self.games?.imageData[indexPath.row])!)
        cell.gameCellImageView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(openGameStreams(sender:)))
        cell.gameCellImageView.addGestureRecognizer(gesture)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let picDimension = self.view.frame.size.width / 2.17
        return CGSize(width: picDimension, height: picDimension*5/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let leftRightInset = self.view.frame.size.width / 40.0
        return UIEdgeInsetsMake(0, leftRightInset, 0, leftRightInset)
    }
    
    func openGameStreams(sender: UITapGestureRecognizer) {
        let tapLocation = sender.location(in: self.gamesCollectionView)
        let indexPath : NSIndexPath = self.gamesCollectionView.indexPathForItem(at: tapLocation)! as NSIndexPath

        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let GameStreams = storyboard.instantiateViewController(withIdentifier: "GameStreams") as! GameStreamsViewController
        GameStreams.gameValue = self.games?.game[indexPath.row]
        self.navigationController?.pushViewController(GameStreams, animated: true)
    }
}

