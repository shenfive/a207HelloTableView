//
//  InputViewController.swift
//  a207HelloTableView
//
//  Created by 申潤五 on 2020/8/8.
//  Copyright © 2020 申潤五. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var telTF: UITextField!
    
    var addbook:[[String:String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userdefault = UserDefaults.standard
        if let theAddBook = userdefault.value(forKey: "addbook") as? [[String:String]]{
            addbook = theAddBook
            print(addbook)
        }
   
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func newContent(_ sender: Any) {
 
        // 檢查名字至少三碼
        guard let name = nameTF.text else{
            return
        }
        if name.count < 3 {
            let alertView = UIAlertController.init(title: "告訴你", message: "名字至少三個", preferredStyle: .alert)
             let action = UIAlertAction.init(title: "我知道了", style: .default, handler: nil)
             alertView.addAction(action)
             self.present(alertView, animated: true, completion: nil)
             return
        }
        
        guard let tel = telTF.text else{
            return
        }
        if tel.count < 8 {
            let alertView = UIAlertController.init(title: "告訴你", message: "電話至少九碼", preferredStyle: .alert)
             let action = UIAlertAction.init(title: "我知道了", style: .default, handler: nil)
             alertView.addAction(action)
             self.present(alertView, animated: true, completion: nil)
             return
        }
        
        let content = ["name":name,"tel":tel]
        addbook.append(content)
        
        let userdefault = UserDefaults.standard
        userdefault.set(addbook, forKey: "addbook")
        userdefault.synchronize()
        
        nameTF.text = ""
        telTF.text = ""
        let alertView = UIAlertController.init(title: "告訴你", message: "己存進去了", preferredStyle: .alert)
         let action = UIAlertAction.init(title: "我知道了", style: .default, handler: nil)
         alertView.addAction(action)
         self.present(alertView, animated: true, completion: nil)
         return
        
        
    }
    
}
