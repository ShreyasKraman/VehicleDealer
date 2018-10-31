//
//  employee.swift
//  EmptyApp
//
//  Created by Shreyas Kalyanaraman on 10/27/18.
//  Copyright © 2018 rab. All rights reserved.
//

import Foundation

class employee{
    var address:String
    var city:String
    var firstName:String
    var lastName:String
    var phone:Int
    var ssn:Int
    var zip:Int
    var office:department
    
    init(_ newAddress:String, _ newCity:String, _ newFirstName:String, _ newLastName:String, _ newPhone:Int, _ newSsn:Int, newZip:Int, _ newOffice:department){
        address = newAddress
        city = newCity
        firstName = newFirstName
        lastName = newLastName
        phone = newPhone
        ssn = newSsn
        zip = newZip
        office = newOffice
    }
}
