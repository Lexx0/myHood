//
//  PostsCell.swift
//  myHood
//
//  Created by Alex Berezovsky on 6/6/16.
//  Copyright © 2016 PatataMatata. All rights reserved.
//

import UIKit

class PostsCell: UITableViewCell {
    
    @IBOutlet weak var postImg: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var descrLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        postImg.layer.cornerRadius = postImg.frame.size.width / 2
        postImg.clipsToBounds = true
     
    }
    
    func configueCell(post: Post) {
        titleLbl.text = post.title
        descrLbl.text = post.postDescr
    }

}
