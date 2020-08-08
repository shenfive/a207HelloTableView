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
        

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillApper")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidApper")
        let userdefault = UserDefaults.standard
        if let theAddBook = userdefault.value(forKey: "addbook") as? [[String:String]]{
            addbook = theAddBook
            myTableView.reloadData()
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertView = UIAlertController.init(title: "告訴你", message: "我要打電話給\(addbook[indexPath.row]["name"]!) \n號碼\(addbook[indexPath.row]["tel"]!)", preferredStyle: .alert)
        let action = UIAlertAction.init(title: "我知道了", style: .default, handler: nil)
        alertView.addAction(action)
        self.present(alertView, animated: true, completion: nil)
    }
    

}

