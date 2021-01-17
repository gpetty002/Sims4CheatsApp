//
//  ViewController.swift
//  Sims4CheatsApp
//
//  Created by Gisselle Petty on 12/23/20.
//

import UIKit

protocol SendBookmarksToTabController: class {
    func shareBookmarks(bookmarks: [Cheat])
}



class FeaturedViewController: UIViewController {

    @IBOutlet weak var featuredLabel: UILabel!
    
//    weak var transferBookmarksDelegate: SendBookmarksToTabController?
//    weak var careerDelegate: CareersViewDelegate?
    
    
    var favorites: [Cheat]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
//    func saveBookmark(_ bookmarks: [Cheat]) {
//        transferBookmarksDelegate?.shareBookmarks(bookmarks: bookmarks)
//    }
    
    
    @IBAction func skillCheatsButton(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToSkills", sender: self)
        
    }
    
    @IBAction func careerCheatsButton(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToCareers", sender: self)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSkills" {
            if (sender as? UITableViewController) != nil {
                _ = segue.destination as! SkillsTableViewController
            }
        } else if segue.identifier == "goToCareers" {
            
            if let navController = segue.destination as? UINavigationController {
                if (navController.viewControllers.first as? CareersViewController) != nil {
//                    careersViewController.careersDelegate = self
                }
            }
            
        } 
        
    }
}

