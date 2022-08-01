//
//  TableViewDetailViewController.swift
//  iOSFundamental
//
//  Created by Almasud on 24/12/20.
//

import UIKit

class TableViewDetailViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    var name = ""
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.text = "You selected \(name) for vote"
        img.image = image
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onClickVote(_ sender: Any) {
    }
}
