//
//  User.swift
//  Appetizers
//
//  Created by Martin Stofko on 8/22/22.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthday = Date()
    var extraNapkins = false
    var boosterChair = false
}
