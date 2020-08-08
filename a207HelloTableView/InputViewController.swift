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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

   
    }
    
    @IBAction func newContent(_ sender: Any) {
 
        let alertView = UIAlertController.init(title: "告訴你", message: "這是訊息", preferredStyle: .alert)
        let action = UIAlertAction.init(title: "我知道了", style: .default, handler: nil)
        alertView.addAction(action)
        self.present(alertView, animated: true, completion: nil)
        
    }
    
}
