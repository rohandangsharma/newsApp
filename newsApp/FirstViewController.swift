//
//  FirstViewController.swift
//  newsApp
//
//  Created by Rohan Sharma on 8/27/18.
//  Copyright © 2018 Rohan Sharma. All rights reserved.
//

import UIKit
import FirebaseFirestore

class FirstViewController: UIViewController {
    
    var db: Firestore!
    
    var docIDs = [String]();
    
    
    //Dictionaries for all categories
    var studentLife = [String: String]();
    var sports = [String: String]();
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let categories = ["studentLife": self.studentLife, "sports": self.sports];
        
        let db = Firestore.firestore();
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
        
        
        
        for (name, var dict) in categories {
            db.collection(name).getDocuments { (snapshot, error) in
                if error != nil {
                    //print(error)
                } else {
                    for document in (snapshot?.documents)! {
                        if let title = document.data()["title"] as? String, let body = document.data()["body"] as? String {
                            dict[title] = body;
                        }
                    }
                }
//                print(dict);
            }
        }
        
    }
    
    
    
    @IBOutlet var story: UIView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

