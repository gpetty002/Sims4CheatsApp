//
//  SelectionBarController.swift
//  Sims4CheatsApp
//
//  Created by Gisselle Petty on 1/10/21.
//

import UIKit

class SelectionTabBarController: UITabBarController, SendBookmarksToTabController {
    
    
    var favorites: [Cheat] = []
    let featuredVC = FeaturedViewController()
    let bookmarksController = BookmarksTableViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    func shareBookmarks(bookmarks: [Cheat]) {
        favorites = bookmarks
        print("\(favorites)")
        bookmarksController.bookmarks = favorites
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
