//
//  NotifyViewController.swift
//  iOSFundamental
//
//  Created by Almasud on 31/12/20.
//

import UIKit

class NotifyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func onClickCarBtn(_ sender: Any) {
        let name = Notification.Name(rawValue: lightNotification)
        NotificationCenter.default.post(name: name, object: nil)
        
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func onClickBykeBtn(_ sender: Any) {
        let name = Notification.Name(rawValue: darkNotification)
        NotificationCenter.default.post(name: name, object: nil)
        
        dismiss(animated: true, completion: nil)
    }
    
}
