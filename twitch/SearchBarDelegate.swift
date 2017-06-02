//
//  SearchBarDelegte.swift
//  twitch
//
//  Created by Антон Сапунов on 01.06.17.
//  Copyright © 2017 Антон Сапунов. All rights reserved.
//

import Foundation
import UIKit

class SearchBarDelegate: NSObject, UISearchBarDelegate {
    
    var searchDelegate: OpenViewDelegate?
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let SearchView = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        if let delegate = searchDelegate {
            delegate.openView(SearchView)
        }
    }
}
