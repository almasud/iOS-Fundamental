//
//  TableViewViewController.swift
//  iOSFundamental
//
//  Created by Almasud on 24/12/20.
//

import UIKit

class TableViewViewController: UIViewController {
    var names = ["A", "B", "C", "D"]
    @IBOutlet weak var tableView: UITableView!
    
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

}

extension TableViewViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellTableViewCell
        cell?.label.text = self.names[indexPath.row]
        cell?.img.image = UIImage(named: self.names[indexPath.row])
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "tvDetailViewController") as! TableViewDetailViewController
        vc.name = self.names[indexPath.row]
        vc.image = UIImage(named: self.names[indexPath.row])!
        
        // Nagigate to the detail view
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
