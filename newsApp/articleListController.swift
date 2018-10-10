//
//  articleListController.swift
//  newsApp
//
//  Created by Rohan Sharma on 10/3/18.
//  Copyright © 2018 Rohan Sharma. All rights reserved.
//

import UIKit
import FirebaseFirestore

class articleListController: UITableViewController {
    
//    var db: Firestore!
    
    //var array = ["one", "two", "three", "four", "five", "six"];
    
//    var studentLife: [String: String] = getData();
    
    var studKeys = ["one", "TWO"]
    
//    = [String](studentLife.keys);
    
//    override init(style: UITableViewStyle) {
//        print("hi")
//    }
    
//    self.getData();
    
    
        private let dataModel = DataModel()
    
    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
//        dataModel.requestData { [weak self] (data: String) in
//            self?.useData(data: data)
//        }
        
        
        
    
        
        
//        print("2")
//        print(self.studentLife);
        
        
        
        let db = Firestore.firestore();
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
        
//        let studentLife = db.collection("studentLife");
        
//
        db.collection("studentLife").getDocuments { (snapshot, error) in
            if error != nil {
                //print(error)
            } else {
                for document in (snapshot?.documents)! {
                    if let title = document.data()["title"] as? String, let body = document.data()["body"] as? String {
                        self.studentLife[title] = body;
//                        print(self.studentLife);

                    }
                }
            }
            print("hello3");
            self.studKeys = [String](self.studentLife.keys);

        }
        
        
//        print(studentLife);
//        print(self.studentLife.keys);
//        print(studentLife.values);
        
//        self.studKeys = [String](studentLife.values);
//        print (self.studKeys);
    }

//    private func useData(data: String) {
//        print(data)
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        print("hello");
        return self.studKeys.count;
    }
        
        
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("hello2");
        
        let cell = UITableViewCell()
        cell.textLabel?.text = studKeys[indexPath.row];
//        print (self.studKeys);

        return cell
    }
    
//    func getData() -> Dictionary<String,String>{
//        var data = [String: String]();
//
//        let db = Firestore.firestore();
//        let settings = db.settings
//        settings.areTimestampsInSnapshotsEnabled = true
//        db.settings = settings
//
//        db.collection("studentLife").getDocuments { (snapshot, error) in
//            if error != nil {
//                //print(error)
//            } else {
//                for document in (snapshot?.documents)! {
//                    if let title = document.data()["title"] as? String, let body = document.data()["body"] as? String {
//                        data[title] = body;
//                        //                        print(self.studentLife);
//
//                    }
//                }
//
////                print(data);
////                return (data);
//            }
////            print(data);
////            print("1")
//
//        }
////        print("2")
////        print(data);
//        return data;
//
//
//    }
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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


