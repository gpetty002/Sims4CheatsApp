//
//  BookmarksCellController.swift
//  Sims4CheatsApp
//
//  Created by Gisselle Petty on 1/8/21.
//

import UIKit

class BookmarksCellController: UITableViewCell {

    var link: BookmarksTableViewController?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let bookmarkImage = UIImage(systemName: "bookmark.fill")
        let bookmarkButton = UIButton(type: .system)
        bookmarkButton.setImage(bookmarkImage, for: .normal)
        bookmarkButton.tintColor = UIColor(red: 0.52, green: 0.07, blue: 0.07, alpha: 1.00)
        bookmarkButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        accessoryView = bookmarkButton
        
        bookmarkButton.addTarget(self, action: #selector(handleMarkAsFavorite), for: .touchUpInside)
        
    }
    
    @objc private func handleMarkAsFavorite() {
        link?.methodForBookmarks(cell: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
