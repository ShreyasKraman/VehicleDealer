//
//  department.swift
//  EmptyApp
//
//  Created by Shreyas Kalyanaraman on 10/27/18.
//  Copyright © 2018 rab. All rights reserved.
//

import Foundation

class department{
    var name:String
    var phone:Int
    var parent:dealer
    var employees:[employee]
    var vehicles:[vehicle]
    
    init(_ newName:String, _ newPhone:Int!, _ newParent:dealer) throws{
        name = newName
        
        let error = exceptionHandler().throwError()
        
        phone = try{
            guard let phone:Int = newPhone else{
                throw error
            }
            return phone
            }()
        parent = newParent
        employees = [employee]()
        vehicles = [vehicle]()
    }
    
    
    func getName() -> String{
        return name
    }
    
    func getPhone() -> Int {
        return phone
    }
    
    func addEmployees(_ newEmployee:employee) -> [employee]{
        employees.append(newEmployee)
        return employees
    }
    
    func addVehicles (_ newVehicles:vehicle){
        vehicles.append(newVehicles)
    }
    
    func listVehicles () -> [vehicle] {
        return vehicles
    }
    
    func searchVehicleByMake(_ searchMake:String) -> [vehicle]  {
        
        var vehicleList:[vehicle] = []
        
        for car in vehicles{
            if car.make == searchMake || car.make.hasSuffix(searchMake) || car.make.hasPrefix(searchMake){
                vehicleList.append(car)
            }
        }
        
        return vehicleList
    }
    
    func searchVehicleByName(_ searchModel:String) -> [vehicle] {
        var vehicleList:[vehicle] = []
        
        for car in vehicles{
            if car.model == searchModel || car.model.hasSuffix(searchModel) || car.model.hasPrefix(searchModel){
                vehicleList.append(car)
            }
        }
        return vehicleList
    }
    
}
