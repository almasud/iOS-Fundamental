//
//  FirstViewController.swift
//  HelloWorld
//
//  Created by XORGEEK3 on 23/12/20.
//  Copyright © 2020 XORGEEK. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, DataEnteredDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var labelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showSecondViewController" {
            // get a reference to the second view controller
            let secondViewController = segue.destination as! SecondViewController
            // Set this class reference to delegate of second view controller to call back
            secondViewController.delegate = self
            
            // set a variable in the second view controller with the String to pass
            secondViewController.receivedString = textField.text!
        }
    }
    
    // Call back function and call from SecondViewController
    func userDidEnterInformation(info: String) {
        self.labelText.text = info
    }

}
