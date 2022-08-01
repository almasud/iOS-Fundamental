//
//  ContactViewController.swift
//  iOSFundamental
//
//  Created by Almasud on 29/12/20.
//

import UIKit

class ContactViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var address: UITextField!
    
    @IBOutlet weak var tableContacts: UITableView!
    
    private var contacts = [Contact]()
    private var selectedContact: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableContacts.dataSource = self
        self.tableContacts.delegate = self
//        self.tableContacts.register(ContactViewCell.self, forCellReuseIdentifier: "contactCell")
        
        contacts = ContactDB.instance.getContacts()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func addBtnClick(_ sender: Any) {
        let name = self.name.text ?? ""
        let phone = self.phone.text ?? ""
        let address = self.address.text ?? ""
        
        if let id = ContactDB.instance.addContact(cname: name, cphone: phone, caddress: address) {
            let contact = Contact(id: id, name: name, phone: phone, address: address)
            self.contacts.append(contact)
            self.tableContacts.insertRows(at: [NSIndexPath(row: self.contacts.count-1, section: 0) as IndexPath], with: .fade)
        }
    }
    
    @IBAction func updateBtnClick(_ sender: Any) {
        if selectedContact != nil {
            let id = contacts[selectedContact!].id!
            let contact = Contact(
                id: id,
                name: self.name.text ?? "",
                phone: self.phone.text ?? "",
                address: self.address.text ?? "")
            
            ContactDB.instance.updateContact(cid: id, newContact: contact)
            
            self.contacts.remove(at: selectedContact!)
            self.contacts.insert(contact, at: selectedContact!)
            
            self.tableContacts.reloadData()
        } else {
            print("No item selected")
        }
    }
    
    @IBAction func deleteBtnClick(_ sender: Any) {
        if selectedContact != nil {
            ContactDB.instance.deleteContact(cid: contacts[self.selectedContact!].id!)
            self.contacts.remove(at: selectedContact!)
            self.tableContacts.deleteRows(at: [NSIndexPath(row: self.selectedContact!, section: 0) as IndexPath], with: .fade)
        } else {
            print("No item selected")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.name.text = self.contacts[indexPath.row].name
        self.phone.text = self.contacts[indexPath.row].phone
        self.address.text = self.contacts[indexPath.row].address
        
        selectedContact = indexPath.row
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactViewCell
        
//        print("Contact size: \(self.contacts.count)")
        cell.name.text = self.contacts[indexPath.row].name
        cell.phone.text = self.contacts[indexPath.row].phone
        cell.address.text = self.contacts[indexPath.row].address
        
        return cell
    }

}
