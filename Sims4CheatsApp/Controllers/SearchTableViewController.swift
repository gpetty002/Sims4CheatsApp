//
//  SearchTableViewController.swift
//  Sims4CheatsApp
//
//  Created by Gisselle Petty on 1/17/21.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate {

    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var allCheats: [Cheat] = []
    var filteredData: [Cheat]!
    
    let mainBlueColor = UIColor(red: 0.21, green: 0.32, blue: 0.47, alpha: 1.00)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.backgroundColor = mainBlueColor
        

        allCheats.append(contentsOf: ["careers.promote actor", "careers.promote astronaut", "careers.promote athletic", "careers.promote activist", "careers.promote business", "careers.promote adult_critic", "careers.promote culinary", "careers.promote corporateworker", "careers.promote detective", "careers.promote doctor", "careers.promote education", "careers.promote engineer", "careers.promote entertainer", "adult_freelancer_agency_maker","adult_freelancer_agency_programmer", "adult_freelancer_agency_writer", "careers.promote adult_gardener", "careers.promote law", "careers.promote military", "careers.promote painter", "careers.promote adult_active_scientist", "careers.promote scout", "careers.promote secretagent", "careers.promote socialmedia","careers.promote styleinfluencer", "careers.promote techguru", "careers.promote adult_writer"
        ].map{ Cheat(name: $0, hasFavorited: false) })
        
        allCheats.append(contentsOf: [
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
            "stats.set_skill_level major_homestylecooking x",
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
        ].map{ Cheat(name: $0, hasFavorited: false)})
        
        allCheats.append(contentsOf: [
            "statistic_skill_toddler_communication x",
            "statistic_skill_toddler_imagination x",
            "statistic_skill_toddler_movement x",
            "statistic_skill_toddler_potty x",
            "statistic_skill_toddler_thinking x"
        ].map{ Cheat(name: $0, hasFavorited: false)})
        
        allCheats.append(contentsOf: [
            "stats.set_skill_level skill_child_creativity x",
            "stats.set_skill_level skill_child_mental x",
            "stats.set_skill_level skill_child_motor x",
            "stats.set_skill_level skill_child_social x"
        ].map{ Cheat(name: $0, hasFavorited: false)})
        
        
        searchBar.delegate = self
        filteredData = allCheats
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        cell.textLabel?.text = filteredData[indexPath.row].name
        
        cell.backgroundColor = mainBlueColor
        
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        
        return cell
    }
    
    
    // MARK Search Bar Config
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        
        searchBar.placeholder = "play with life..."
        searchBar.tintColor = .white
        self.tableView.keyboardDismissMode = .onDrag
        
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField

        textFieldInsideSearchBar?.textColor = .white
        
        filteredData = []
        
        if searchText == "" {
            filteredData = allCheats
        } else {
            for cheat in allCheats {
                if cheat.name.lowercased().contains(searchText.lowercased()) {
                    filteredData.append(cheat)
                }
            }
        }
        
        self.tableView.reloadData()
    }


}
