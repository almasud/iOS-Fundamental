//
//  ObserverViewController.swift
//  iOSFundamental
//
//  Created by XORGEEK3 on 31/12/20.
//  Copyright © 2020 XORGEEK. All rights reserved.
//

import UIKit

let lightNotification = "lightNotification"
let darkNotification = "darkNotification"

class ObserverViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelView: UILabel!
    
    let light = Notification.Name(rawValue: lightNotification)
    let dark = Notification.Name(rawValue: darkNotification)
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createObservers()
    }
    
    func createObservers() {
        // Light
        NotificationCenter.default.addObserver(self, selector: #selector(ObserverViewController.updateImage(notification:)), name: light, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ObserverViewController.updateLabel(notification:)), name: light, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ObserverViewController.updateBackground(notification:)), name: light, object: nil)
        
        // Dark
        NotificationCenter.default.addObserver(self, selector: #selector(ObserverViewController.updateImage(notification:)), name: dark, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ObserverViewController.updateLabel(notification:)), name: dark, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ObserverViewController.updateBackground(notification:)), name: dark, object: nil)
    }
    
    @objc func updateImage(notification: Notification) {
        let isLight = notification.name == light
        let image = isLight ? UIImage(named: "A")! : UIImage(named: "B")
        imageView.image = image
    }
    
    @objc func updateLabel(notification: Notification) {
        let isLight = notification.name == light
        let name = isLight ? "Car" : "Byke"
        labelView.text = name
    }
    
    @objc func updateBackground(notification: Notification) {
        let isLight = notification.name == light
        let color = isLight ? UIColor.cyan : UIColor.red
        view.backgroundColor = color
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func onClickChooseBtn(_ sender: Any) {
        let notifyVC = storyboard?.instantiateViewController(withIdentifier: "notifyVC") as! NotifyViewController
        
        present(notifyVC, animated: true, completion: nil)
    }
    
}
