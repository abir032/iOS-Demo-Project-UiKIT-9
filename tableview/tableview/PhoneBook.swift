//
//  PhoneBook.swift
//  tableview
//
//  Created by Bjit on 7/12/22.
//

import Foundation
struct  PhoneBook{
    var name: String
    var number: Int
}
extension PhoneBook{
    static var phoneBook = [PhoneBook(name: "Abir", number: 017),
                            PhoneBook(name: "Asem", number: 017),
    ]
}
