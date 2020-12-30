//
//  Contact.swift
//  iOSFundamental
//
//  Created by XORGEEK3 on 30/12/20.
//  Copyright © 2020 XORGEEK. All rights reserved.
//

import Foundation

class Contact {
    let id: Int64?
    var name: String
    var phone: String
    var address: String
    
    init(id: Int64) {
        self.id = id
        name = ""
        phone = ""
        address = ""
    }
    
    init(id: Int64, name: String, phone: String, address: String) {
        self.id = id
        self.name = name
        self.phone = phone
        self.address = address
    }
    
}
