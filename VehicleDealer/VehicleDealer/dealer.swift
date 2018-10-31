//
//  dealer.swift
//  EmptyApp
//
//  Created by Shreyas Kalyanaraman on 10/27/18.
//  Copyright © 2018 rab. All rights reserved.
//

import Foundation

class dealer{
    private var city:String
    private var name:String
    private var phone:Int
    private var zip:Int
    private var departments:[department]
    
    init(_ newCity:String, _ newName:String, _ newPhone:Int!, _ newZip:Int!) throws{
        city = newCity
        name = newName
        
        //using enum from exceptionHandler class
        let error = exceptionHandler().throwError()
        
        phone = try{
            guard let phone:Int = newPhone else{
                throw error
            }
            return phone
            }()
        
        zip = try{
            guard let zip:Int = newZip else{
                throw error
            }
            return zip
            }()
        departments = [department]()
    }
    
    func getName() ->String {
        return name;
    }
    
    func getCity() ->String {
        return city
    }
    
    func getPhone() -> Int{
        return phone
    }
    
    func getZip() -> Int{
        return zip
    }
    
    func addDepartment(_ newDepartment:department) -> [department] {
        departments.append(newDepartment)
        return departments
    }
    
}
