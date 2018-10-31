//
//  vehicle.swift
//  EmptyApp
//
//  Created by Shreyas Kalyanaraman on 10/27/18.
//  Copyright © 2018 rab. All rights reserved.
//

import Foundation

class vehicle{
    var make:String!
    var model:String!
    var miles:Float!
    var photo:String!
    var price:Float!
    var rating:Float!
    var type:String!
    var year:Int!
    var store:department!
    var error:exceptionHandler.ThrowError
    
    init(_ newMake:String, _ newModel:String, _ newMiles:Float!, _ newPhoto:String, _ newPrice:Float!, _ newRating:Float!, _ newType:String, _ newYear:Int!, _ newStore:department) throws{
        make = newMake
        model = newModel
        error = exceptionHandler().throwError()
        miles = try {
            guard let miles:Float = newMiles else{
                throw error
            }
            return Float(miles)
        }()
        
        photo = newPhoto
        
        price = try {
            guard let price:Float = newPrice else{
                throw error
            }
            return price
        }()
        
        rating = try {
            guard let rating:Float = newRating else{
                throw error
            }
            return rating
        }()
        
        type = newType
        
        year = try {
            guard let year:Int = newYear else{
                throw error
            }
            return year
        }()
        store = newStore
        
    }
    
    func getMake() -> String {
        return make
    }
    
    func getModel() -> String {
        return model
    }
    
    func getPrice() -> String {
        return String(price)
    }
    
    func getRating() -> String {
        return String(rating)
    }
    
    func getYear() -> String {
        return String(year)
    }
    
    func getPhoto() -> String {
        return photo
    }
    
    func getMiles() -> String {
        return String(miles)
    }
    
    func getType() -> String {
        return type
    }
    
    
    func addVehicle(_ store:department,_ newCar:vehicle) throws{
        
        do{
            store.addVehicles(newCar)
        }catch exceptionHandler.ThrowError.IllegalArgumentException{
            print("Fatal error !!!!! Make sure that you have entered numeric values for vehicle make, price, rating and year")
        }
        
    }

}
