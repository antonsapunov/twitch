//
//  SearchViewController.swift
//  twitch
//
//  Created by Антон Сапунов on 01.06.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating, OpenViewDelegate {
    
    //Outlets
    
    @IBOutlet weak var searchGamesTableView: UITableView!
    @IBOutlet weak var searchStreamsTableView: UITableView!
    
    //Fields
    
    let gamesDatasourse = SearchGamesDataSourse()
    let streamsDataSourse = SearchStreamsDataSourse()
    let presenter = SearchStreamsPresenter()
    var searchController: UISearchController!
    var streams: StreamInformation? {
        didSet {
            gamesDatasourse.setStreams(streams!)
            streamsDataSourse.setStreams(streams!)
            self.searchGamesTableView.reloadData()
            self.searchStreamsTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.view = self
        self.searchGamesTableView.delegate = gamesDatasourse
        self.searchGamesTableView.dataSource = gamesDatasourse
        self.searchStreamsTableView.delegate = streamsDataSourse
        self.searchStreamsTableView.dataSource = streamsDataSourse
        self.gamesDatasourse.topDelegate = self
        self.streamsDataSourse.topDelegate = self
        
        searchControllerSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        delay(0.1) { self.searchController.searchBar.becomeFirstResponder() }
    }
    
    func openView(_ controller: UIViewController) {
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        print("sad")
        if searchController.searchBar.text!.characters.count > 0 {
            presenter.getSearhResult(searchController.searchBar.text!)
        }
    }

    func delay(_ delay: Double, closure: @escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
    
    func searchControllerSetup() {
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        self.searchController.searchResultsUpdater = self
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        self.navigationItem.titleView = searchController.searchBar
        self.definesPresentationContext = true
    }
}
