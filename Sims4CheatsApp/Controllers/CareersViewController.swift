//
//  CareersViewController.swift
//  Sims4CheatsApp
//
//  Created by Gisselle Petty on 1/6/21.
//

import UIKit

protocol CareersViewDelegate: class {
    func saveBookmark(_ bookmarks: [Cheat])
}

class CareersViewController: UITableViewController {
     
    let cellId = "cellId"
    let mainBlueColor = UIColor(red: 0.21, green: 0.32, blue: 0.47, alpha: 1.00)
    weak var careersDelegate: CareersViewDelegate?
    var bookmarks: [Cheat] = []
    
    
    // you should use Custom Delegation properly instead
    func someMethodIWantToCall(cell: UITableViewCell) {
        
        // we're going to figure out which name we're clicking on
        
        let indexPathTapped = tableView.indexPath(for: cell)
        
        let cheat = careerCheats2D[indexPathTapped!.section].names[indexPathTapped!.row]
        
        let hasFavorited = cheat.hasFavorited
        
        careerCheats2D[indexPathTapped!.section].names[indexPathTapped!.row].hasFavorited = !hasFavorited
    
        cell.accessoryView?.tintColor = hasFavorited ? .white : UIColor(red: 0.52, green: 0.07, blue: 0.07, alpha: 1.00)
        
        
        if !hasFavorited {
            bookmarks.append(cheat)
        }
        
    }
    
    
    var careerCheats2D = [
        ExpandableCheats(isExpanded: true, names: ["careers.promote actor", "careers.promote astronaut", "careers.promote athletic", "careers.promote activist"].map{ Cheat(name: $0, hasFavorited: false) }),
        ExpandableCheats(isExpanded: true, names: ["careers.promote business"].map{ Cheat(name: $0, hasFavorited: false) }),
        ExpandableCheats(isExpanded: true, names: ["careers.promote adult_critic", "careers.promote culinary", "careers.promote corporateworker"].map{ Cheat(name: $0, hasFavorited: false) }),
        ExpandableCheats(isExpanded: true, names: ["careers.promote detective", "careers.promote doctor"].map{ Cheat(name: $0, hasFavorited: false) }),
        ExpandableCheats(isExpanded: true, names: ["careers.promote education", "careers.promote engineer", "careers.promote entertainer"].map{ Cheat(name: $0, hasFavorited: false) }),
        ExpandableCheats(isExpanded: true, names: ["adult_freelancer_agency_maker","adult_freelancer_agency_programmer", "adult_freelancer_agency_writer"].map{ Cheat(name: $0, hasFavorited: false) }),
        ExpandableCheats(isExpanded: true, names: ["careers.promote adult_gardener"].map{ Cheat(name: $0, hasFavorited: false) }),
        ExpandableCheats(isExpanded: true, names: ["careers.promote law"].map{ Cheat(name: $0, hasFavorited: false) }),
        ExpandableCheats(isExpanded: true, names: ["careers.promote military"].map{ Cheat(name: $0, hasFavorited: false) }),
        ExpandableCheats(isExpanded: true, names: ["careers.promote painter"].map{ Cheat(name: $0, hasFavorited: false) }),
        ExpandableCheats(isExpanded: true, names: ["careers.promote adult_active_scientist", "careers.promote scout", "careers.promote secretagent", "careers.promote socialmedia","careers.promote styleinfluencer"].map{ Cheat(name: $0, hasFavorited: false) }),
        ExpandableCheats(isExpanded: true, names: ["careers.promote techguru"].map{ Cheat(name: $0, hasFavorited: false) }),
        ExpandableCheats(isExpanded: true, names: ["careers.promote adult_writer"].map{ Cheat(name: $0, hasFavorited: false) })
    ]
    
    let sectionLetters = [
        "    A", "    B", "    C", "    D", "    E", "    F",
        "    G", "    L", "   M", "   P", "    S",
        "    T", "    W"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Career Cheats"
        
        
        tableView.backgroundColor = mainBlueColor
        
        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 25.0)!, NSAttributedString.Key.foregroundColor: UIColor.white]
        
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = mainBlueColor
        
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.setTitle("", for: .normal)
        backButton.tintColor = UIColor.white
        backButton.addTarget(self, action: #selector(self.closeCareers(_:)), for: .touchUpInside)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationController?.popViewController(animated: true)
       
        
        tableView.register(CareerCellController.self, forCellReuseIdentifier: cellId)
        
    }
    
    @IBAction func closeCareers (_ sender: UIButton) {
        careersDelegate?.saveBookmark(bookmarks)
        
        print("\(careersDelegate?.saveBookmark(bookmarks))")
        dismiss(animated: true, completion: nil)
    }
    


    override func tableView (_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let button = UIButton(type: .system)
        
        button.setTitleColor(mainBlueColor, for: .normal)
        button.setTitle(sectionLetters[section], for: .normal)
        
        
        button.titleLabel?.font = UIFont(name: "Helvetica-bold", size: 24)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        
        
        button.backgroundColor = UIColor.white
        button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
        
        button.tag = section
        
        return button
    }
    
    
    @objc func handleExpandClose(button: UIButton){
        
        // we'll trying to close the section first by deleting the rows
        
        let section = button.tag
        
        var indexPaths = [IndexPath]()
        
        for row in careerCheats2D[section].names.indices {
            
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
            
        }
        
        
        let isExpanded = careerCheats2D[section].isExpanded
        careerCheats2D[section].isExpanded = !isExpanded
        
        button.setTitle(sectionLetters[section], for: .normal)
        
        if isExpanded {
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            tableView.insertRows(at: indexPaths, with: .fade)
        }
        
    }
    
    
    override func tableView (_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return careerCheats2D.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !careerCheats2D[section].isExpanded {
            return 0
        }
        return careerCheats2D[section].names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CareerCellController
        
        cell.backgroundColor = mainBlueColor
        
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont(name: "Helvetica", size: 18)
        
        cell.link = self
        
        let cheat = careerCheats2D[indexPath.section].names[indexPath.row]
        
        cell.textLabel?.text = cheat.name
        
        // Bookmark Color Set
        cell.accessoryView?.tintColor = cheat.hasFavorited ? UIColor(red: 0.52, green: 0.07, blue: 0.07, alpha: 1.00) : .white
        
        
        return cell
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
//    }
    
    
}
