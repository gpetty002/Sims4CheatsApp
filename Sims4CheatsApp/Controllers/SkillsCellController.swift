//
//  SkillsCellController.swift
//  Sims4CheatsApp
//
//  Created by Gisselle Petty on 1/7/21.
//

import UIKit

class SkillsCellController: UITableViewCell {

    var link: SkillsTableViewController?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        
        let bookmarkImage = UIImage(systemName: "bookmark.fill")
        let bookmarkButton = UIButton(type: .system)
        bookmarkButton.setImage(bookmarkImage, for: .normal)
        bookmarkButton.tintColor = .white
        bookmarkButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        accessoryView = bookmarkButton
        
        bookmarkButton.addTarget(self, action: #selector(handleMarkAsFavorite), for: .touchUpInside)
    }
    
    @objc private func handleMarkAsFavorite() {
        link?.methodForSkills(cell: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
