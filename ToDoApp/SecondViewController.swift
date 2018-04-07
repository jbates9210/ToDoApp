//
//  SecondViewController.swift
//  ToDoApp
//
//  Created by Jared Bates on 4/6/18.
//  Copyright © 2018 jared. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var itemTextField: UITextField!
    
    @IBAction func Add(_ sender: Any) {
        
        //Create object to hold perm storage
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        // Initialize string array
        var items:[String]
        
        // if statement to take any storage and store it in tempItems as a String, reassign to items, append the item, else just itemTextField = items
        if let tempItems = itemsObject as? [String] {
            items = tempItems
            items.append(itemTextField.text!)
            print(items)
        } else {
            items = [itemTextField.text!]
        }
        
        // Set the perm storage and make Text Field blank
        UserDefaults.standard.set(items, forKey: "items")
        itemTextField.text = ""
    }
    
    // Keyboard disappear when touchs outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

