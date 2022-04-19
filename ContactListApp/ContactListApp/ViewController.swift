//
//  ViewController.swift
//  ContactListApp
//
//  Created by Naramsetty,Jayanth on 4/19/22.
//

import UIKit
import FirebaseDatabase
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create a cell
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
               
               //populate the data
               cell.textLabel?.text = contactNames[indexPath.row]
               
               //return cell
               return cell
    }
    
    var contactNames : [String ] = []
    var contacts = NSDictionary()
    
    
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        fetchData()
    }

    func fetchData(){
        // Create a database reference
        
        let databaseRef = Database.database().reference()
        
        databaseRef.observeSingleEvent(of: .value) { snapshot in
                    self.contacts = snapshot.value as! NSDictionary
            
            self.contactNames = self.contacts.allKeys as! [String]
            
            //reload the data
            self.tableViewOutlet.reloadData();
          
    
    }

}

}
