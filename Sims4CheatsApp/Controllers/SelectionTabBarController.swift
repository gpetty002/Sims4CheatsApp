//
//  SelectionBarController.swift
//  Sims4CheatsApp
//
//  Created by Gisselle Petty on 1/10/21.
//

import UIKit

// add SendBookmarksToTabController to SelctionTabBarController class
// IGNORE ^^

class SelectionTabBarController: UITabBarController {
    
    
    var favorites: [Cheat] = []

    
// IGNORE THESE DELEGATES
    
//    var featuredVC: FeaturedViewController? {
//        return self.viewControllers?.first as? FeaturedViewController
//    }
//    var bookmarksController: BookmarksTableViewController? {
//        return (self.viewControllers?[2] as? UINavigationController)?.viewControllers.first as? BookmarksTableViewController
//    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        featuredVC?.transferBookmarksDelegate = self
    }
    
    
//    func shareBookmarks(bookmarks: [Cheat]) {
//        favorites = bookmarks
//
//        bookmarksController?.bookmarks = favorites
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
