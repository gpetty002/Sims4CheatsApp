//
//  SkillsTableViewController.swift
//  Sims4CheatsApp
//
//  Created by Gisselle Petty on 1/7/21.
//

import UIKit

class SkillsTableViewController: UITableViewController {
    
    let skillFavorites = BookmarksTableViewController()
    
    let cellId = "Cell"
    let mainBlueColor = UIColor(red: 0.21, green: 0.32, blue: 0.47, alpha: 1.00)
    
    func methodForSkills(cell: UITableViewCell) {
        
        // figures out what name we're clicking on
        
        let indexPathTapped = tableView.indexPath(for: cell)
        let cheatName = skillCheats[indexPathTapped!.section].names[indexPathTapped!.row]
        let hasFavorited = cheatName.hasFavorited
        
        skillCheats[indexPathTapped!.section].names[indexPathTapped!.row].hasFavorited = !hasFavorited
        
        cell.accessoryView?.tintColor = hasFavorited ? .white : UIColor(red: 0.52, green: 0.07, blue: 0.07, alpha: 1.00)
        
        
        if !hasFavorited {
            skillFavorites.bookmarks?.append(cheatName)
            
        }
        
        
    }
    
    var sectionHeaders = [
        "    Regular Skill Cheats",
        "    Toddler Skill Cheats",
        "    Children Skill Cheats"
    ]
    
    
    var skillCheats = [
    
        ExpandableCheats(isExpanded: true, names: [
            "stats.set_skill_level skill_bowling 5",
            "stats.set_skill_level skill_dogtraining 5",
            "stats.set_skill_level skill_fitness x",
            "stats.set_skill_level major_acting x",
            "stats.set_skill_level major_archaelogy x",
            "stats.set_skill_level major_baking x",
            "stats.set_skill_level major_bartending x",
            "stats.set_skill_level major_charisma x",
            "stats.set_skill_level major_comedy x",
            "stats.set_skill_level major_dancing x",
            "stats.set_skill_level major_djmixing x",
            "stats.set_skill_level major_fabrication x",
            "stats.set_skill_level major_fishing x",
            "stats.set_skill_level major_flowerarranging x",
            "stats.set_skill_level major_gardening x",
            "stats.set_skill_level major_gourmetcooking x", // 43 -> x < 39
            "stats.set_skill_level major_guitar x",
            "stats.set_skill_level major_handiness x",
            "stats.set_skill_level major_herbalism x",
            "stats.set_skill_level major_homestylecooking x (Cooking)",
            "stats.set_skill_level major_juicefizzing x",
            "stats.set_skill_level Adultminor_localculture x",
            "stats.set_skill_level major_logic x",
            "stats.set_skill_level minor_mediaproduction x",
            "stats.set_skill_level major_mischief x",
            "stats.set_skill_level major_painting x",
            "stats.set_skill_level major_parenting x",
            "stats.set_skill_level major_photography x",
            "stats.set_skill_level major_piano x",
            "stats.set_skill_level major_pipeorgan x",
            "stats.set_skill_level major_programming x",
            "stats.set_skill_level major_reaping x",
            "stats.set_skill_level major_resarchdebate x",
            "stats.set_skill_level major_robotics x",
            "stats.set_skill_level major_rockclimbing x",
            "stats.set_skill_level major_rocketscience x",
            "stats.set_skill_level major_singing x",
            "stats.set_skill_level major_skiing x",
            "stats.set_skill_level major_snowboarding x",
            "stats.set_skill_level vampirelore x",
            "stats.set_skill_level major_veterinarian x",
            "stats.set_skill_level major_videogaming x",
            "stats.set_skill_level major_violin x",
            "stats.set_skill_level major_wellness x",
            "stats.set_skill_level major_writing x"
        ].map{ Cheat(name: $0, hasFavorited: false)}),
        ExpandableCheats(isExpanded: true, names: [
            "statistic_skill_toddler_communication x",
            "statistic_skill_toddler_imagination x",
            "statistic_skill_toddler_movement x",
            "statistic_skill_toddler_potty x",
            "statistic_skill_toddler_thinking x"
        ].map{ Cheat(name: $0, hasFavorited: false)}),
        ExpandableCheats(isExpanded: true, names: [
            "stats.set_skill_level skill_child_creativity x",
            "stats.set_skill_level skill_child_mental x",
            "stats.set_skill_level skill_child_motor x",
            "stats.set_skill_level skill_child_social x"
        ].map{ Cheat(name: $0, hasFavorited: false)})
    
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Skill Cheats"
        
        tableView.backgroundColor = mainBlueColor 
        
        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 25.0)!, NSAttributedString.Key.foregroundColor: UIColor.white]
        
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.barTintColor = mainBlueColor
        
        
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.setTitle("", for: .normal)
        backButton.tintColor = UIColor.white
        backButton.addTarget(self, action: #selector(self.close(_:)), for: .touchUpInside)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationController?.popViewController(animated: true)
        
        tableView.register(SkillsCellController.self, forCellReuseIdentifier: cellId)
        
        
    }
    
    @IBAction func close (_ sender: UIButton) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    

    // MARK: - Table view data source

    
    override func tableView (_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return skillCheats.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if !skillCheats[section].isExpanded {
            return 0
        }
        
        return skillCheats[section].names.count
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let button = UIButton(type: .system)
        
        button.setTitleColor(mainBlueColor, for: .normal)
        button.setTitle(sectionHeaders[section], for: .normal)
        
        
        button.titleLabel?.font = UIFont(name: "Helvetica-bold", size: 24)
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        
        
        button.backgroundColor = UIColor.white
        button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
        
        button.tag = section
        
        return button
        
    }
    
    
    @objc func handleExpandClose(button: UIButton) {
        // try to close the section
        
        let section = button.tag
        
        var indexPaths = [IndexPath]()
        
        for row in skillCheats[section].names.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
        let isExpanded = skillCheats[section].isExpanded
        skillCheats[section].isExpanded = !isExpanded
        
        button.setTitle(sectionHeaders[section], for: .normal)
        
        if isExpanded {
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            tableView.insertRows(at: indexPaths, with: .fade)
        }
    }
    
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SkillsCellController
     
         cell.backgroundColor = mainBlueColor
        
         cell.link = self
         
        let cheatSkillName = skillCheats[indexPath.section].names[indexPath.row]
         
         cell.textLabel?.text = cheatSkillName.name
        
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
        
        cell.textLabel?.textColor = .white
       
         // Bookmark Color Set
         cell.accessoryView?.tintColor = cheatSkillName.hasFavorited ? UIColor(red: 0.52, green: 0.07, blue: 0.07, alpha: 1.00) : .white
         
         
         return cell
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
