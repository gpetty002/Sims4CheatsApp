//
//  ExpandableNames.swift
//  Sims4CheatsApp
//
//  Created by Gisselle Petty on 1/6/21.
//

import Foundation

struct ExpandableCheats {
    
    var isExpanded: Bool
    var names: [Cheat]
    
    
    func getFavorites() -> [Cheat] {
        return names
    }
    
}



struct Cheat {
    let name: String
    var hasFavorited: Bool
    
    func match(string: String) -> Bool {
        return name.contains(string)
    }
}
