//
//  ViewController.swift
//  myHood
//
//  Created by Alex Berezovsky on 6/6/16.
//  Copyright © 2016 PatataMatata. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblView: UITableView!
    
//    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //these two line following ARE ESSENTIALLY REQUIRED, or esle you'll have problems setting your delegate
        tblView.delegate = self
        tblView.dataSource = self
//        the following row would give an estimated height for a row
        //        tblView.estimatedRowHeight = 97
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "onPostsLoaded:", name: "onPostsLoaded", object: nil)
//        var post1 = Post(imagePath: "tumblr_static_portal_cake_icon", title: "The Pie", description: "The Pie is a lie! Pie is a lie! Pie is a lie! Pie is a lie! Pie is a lie! Pie is a lie! ")
//        var post2 = Post(imagePath: "pie_128", title: "the Cake", description: "The Cake is a lie! The Cake is a lie! The Cake is a lie! The Cake is a lie! The Cake is a lie! ")
//        var post3 = Post(imagePath: "companion_cube_p2", title: "The Box", description: "The box is a friend! The box is a friend! The box is a friend!")
//        
//        
//        posts.append(post1)
//        posts.append(post2)
//        posts.append(post3)
//        
//        tblView.reloadData()
        
        
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post = DataService.instance.loadedPosts[indexPath.row]
        if let cell = tblView.dequeueReusableCellWithIdentifier("PostCell") as? PostsCell {
//            as? PostCell
            cell.configueCell(post)
            return cell
        } else {
            let cell = PostsCell()
            cell.configueCell(post)
            return cell
        }
    }
    
    
    //the followign func sets a cell height
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 94.0
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.loadedPosts.count
    }
    
    // this is what you add if you wanna chose a row. but now we'll skip it
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        code
//    }
    func onPostsLoaded(notif: AnyObject) {
        tblView.reloadData()
    }

}

