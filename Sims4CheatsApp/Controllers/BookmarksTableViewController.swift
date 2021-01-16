//
//  BookmarksTableViewTableViewController.swift
//  Sims4CheatsApp
//
//  Created by Gisselle Petty on 1/8/21.
//

import UIKit

class BookmarksTableViewController: UITableViewController {

    let cellId = "Cell"
    
    var bookmarks: [Cheat]? = []
    
    let mainBlueColor =  UIColor(red: 0.21, green: 0.32, blue: 0.47, alpha: 1.00)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Bookmarks"
        
        tableView.backgroundColor = mainBlueColor
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.barTintColor = mainBlueColor
        
        tableView.register(BookmarksCellController.self, forCellReuseIdentifier: cellId)

        
        
    }
    
    func methodForBookmarks(cell: UITableViewCell) {
        
        let indexPathTapped = tableView.indexPath(for: cell)
        let bookmarkName = bookmarks?[indexPathTapped!.section]
        let hasFavorited = bookmarkName?.hasFavorited
        
        bookmarks?[indexPathTapped!.section].hasFavorited = !(hasFavorited ?? true)
        
        cell.accessoryView?.tintColor = hasFavorited! ? .white : UIColor(red: 0.52, green: 0.07, blue: 0.07, alpha: 1.00)
    }

    // MARK: - Table view data source
    
    override func tableView (_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if bookmarks?.count == nil {
            return 0
        }
        
        return bookmarks!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BookmarksCellController
        
        cell.backgroundColor = mainBlueColor
        
        
        cell.link = self
        
        let bookmark = bookmarks?[indexPath.section]
        
        cell.textLabel?.text = bookmark?.name
        
        let checkText = cell.textLabel?.text
        
        if checkText!.count < 39 {
            cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        } else if checkText!.count < 42 {
            cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 17)
        } else if checkText!.count < 44 {
            cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 16)
        } else if checkText!.count < 46 {
            cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 14)
        } else {
            cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 12)
        }
        
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
