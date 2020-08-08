//
//  ViewController.swift
//  a207HelloTableView
//
//  Created by 申潤五 on 2020/8/8.
//  Copyright © 2020 申潤五. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {


    @IBOutlet weak var myTableView: UITableView!
    var addbook:[[String:String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        let userdefault = UserDefaults.standard
        if let theAddBook = userdefault.value(forKey: "addbook") as? [[String:String]]{
            addbook = theAddBook
            print(addbook)
        }
        
        
    }

    //MARK: TableView Delegate && DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addbook.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! MyTableViewCell
        cell.name.text = addbook[indexPath.row]["name"]
        cell.tel.text = addbook[indexPath.row]["tel"]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    

}

