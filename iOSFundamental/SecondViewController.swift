//
//  SecondViewController.swift
//  iOSFundamental
//
//  Created by XORGEEK3 on 23/12/20.
//  Copyright © 2020 XORGEEK. All rights reserved.
//

import UIKit

// protocol used for sending data back
protocol DataEnteredDelegate: AnyObject {
    func userDidEnterInformation(info: String)
}

class SecondViewController: UIViewController {
    // making this a weak variable so that it won't create a strong reference cycle
    weak var delegate: DataEnteredDelegate? = nil

    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    // Hold the data that passed from the FirstViewController
    var receivedString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Assaign the value of labelText
        labelText.text = self.receivedString
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func sendTextBackBtn(_ sender: Any) {
        // call this method on whichever class implements our delegate protocol
        self.delegate?.userDidEnterInformation(info: self.textField.text!)
        
        // go back to the previous view controller
        _ = self.navigationController?.popViewController(animated: true)
    }
}
