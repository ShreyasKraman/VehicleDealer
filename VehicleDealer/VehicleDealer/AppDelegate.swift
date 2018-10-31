//
//  AppDelegate.swift
//  EmptyApp
//
//  Created by rab on 10/15/17.
//  Copyright © 2017 rab. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UIAlertViewDelegate, UISearchBarDelegate{

    var window: UIWindow?
    
    var tesla:dealer?
    var bostonDepartment:department?
    var newCar:vehicle?
    var makeTextField:UITextField?
    var modelTextField:UITextField?
    var milesTextField:UITextField?
    var photoTextField:UITextField?
    var priceTextField:UITextField?
    var ratingTextField:UITextField?
    var typeTextField:UITextField?
    var yearTextField:UITextField?
    var searchTextField:UITextField?
    var textView:UITextView?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            window.backgroundColor = UIColor.white
            window.rootViewController = UIViewController()
            window.makeKeyAndVisible()
        }
        
        //Home page
        
        let homePage = UIView(frame:(window?.bounds)!)
        window?.rootViewController?.view.addSubview(homePage)
        
        //Title
        homePage.addSubview(createTitleLable(x: 110, y: 50, width: 250, height: 50,text: "Vehicle Dealer"))
        
        do{
            tesla = try dealer("Boston", "Tesla", 9876543210, 02115)
        
            bostonDepartment = try department("Ramesh Automotive", 9876543210, tesla!)
        
            //Vehicle Name
            homePage.addSubview(createContentLable(x: 30, y: 100, width: 80, height: 80, text: "Name:"))
            homePage.addSubview(createContentLable(x: 95, y: 100, width: 80, height: 80, text: (tesla?.getName())!))
            
            homePage.addSubview(createContentLable(x: 230, y: 100, width: 80, height: 80, text: "City:"))
            homePage.addSubview(createContentLable(x: 280, y: 100, width: 80, height: 80, text: (tesla?.getCity())!))
            
            homePage.addSubview(createContentLable(x: 30, y: 130, width: 80, height: 80, text: "Phone:"))
            homePage.addSubview(createContentLable(x: 95, y: 130, width: 150, height: 80, text: String(tesla!.getPhone())))
            
            homePage.addSubview(createContentLable(x: 230, y: 130, width: 80, height: 80, text: "Zip:"))
            homePage.addSubview(createContentLable(x: 275, y: 130, width: 80, height: 80, text: String(tesla!.getZip())))
            
        
            homePage.addSubview(createTitleLable(x: 30, y: 200, width: 150, height: 80, text: "Department"))
            
            
           homePage.addSubview(createContentLable(x: 30, y: 250, width: 80, height: 80, text: "Name:"))
            homePage.addSubview(createContentLable(x: 90, y: 250, width: 200, height: 80, text:  (bostonDepartment!.getName())))

            homePage.addSubview(createContentLable(x: 30, y: 280, width: 80, height: 80, text: "Phone:"))
            homePage.addSubview(createContentLable(x: 95, y: 280, width: 150, height: 80, text:  String(bostonDepartment!.getPhone())))

        
            let btn:UIButton = createButton(x: 80, y: 350, width: 250, height: 40, text: "Add Vehicle")
            btn.addTarget(self, action:#selector(self.addVehicleView), for: .touchUpInside)
            homePage.addSubview(btn)
            
            let btn1:UIButton = createButton(x: 80, y: 420, width: 250, height: 40, text: "Search Vehicle")
            btn1.addTarget(self, action: #selector(self.searchVehicle(sender:)), for: .touchUpInside)
            btn1.setTitleColor(UIColor.blue, for: UIControlState.normal)
            homePage.addSubview(btn1)
            
            let btn2:UIButton = createButton(x: 80, y:490 , width: 250, height: 40, text: "List all vehicles")
            btn2.addTarget(self, action: #selector(self.listAllVehicles(sender:)), for: .touchUpInside)
            btn2.setTitleColor(UIColor.blue, for: UIControlState.normal)
            homePage.addSubview(btn2)
            
            
        }catch exceptionHandler.ThrowError.IllegalArgumentException{
            print("Error!!")
        }catch{
            
        }
        
        return true
    }
    
    func addVehicleView(sender: UIButton){
        let parentWindow:UIView = sender.superview!
        
        let addVehicleView = UIView(frame:(window?.bounds)!)
        addVehicleView.backgroundColor = UIColor.white
        buildAddVehicleView(addVehicleView)
        parentWindow.addSubview(addVehicleView)
        
        //parentWindow.removeFromSuperview()
    }
    
    func searchVehicle(sender: UIButton){
        let parentWindow:UIView = sender.superview!
        
        let searchVechileView = UIView(frame:(window?.bounds)!)
        searchVechileView.backgroundColor = UIColor.white
        buildSearchVehicleView(searchVechileView)
        parentWindow.addSubview(searchVechileView)
    }
    
    func listAllVehicles(sender: UIButton){
        let parentWindow:UIView = sender.superview!
        
        let listAllVehicles = UIView(frame:(window?.bounds)!)
        listAllVehicles.backgroundColor = UIColor.white
        
        //Title
        listAllVehicles.addSubview(createTitleLable(x: 110, y: 50, width: 200, height: 80, text: "All Vehicles"))
        
        //BackButton
        let backBtn:UIButton = createButton(x: 30, y: 50, width: 50, height: 50, text: "Back")
        backBtn.addTarget(self, action:#selector(goToPreviousPage(sender:)), for: .touchUpInside)
        listAllVehicles.addSubview(backBtn)
        
        textView = UITextView(frame:CGRect(x: 40, y: 130, width: 350, height: 500))
        textView?.textAlignment = NSTextAlignment.justified
        textView?.backgroundColor = UIColor.white
        
        textView?.font = UIFont.boldSystemFont(ofSize: 20)
        textView?.font = UIFont(name: "Verdana", size: 17)
        
        // Enable auto-correction and Spellcheck
        textView?.autocorrectionType = UITextAutocorrectionType.yes
        textView?.spellCheckingType = UITextSpellCheckingType.yes
        // myTextView.autocapitalizationType = UITextAutocapitalizationType.None
        
        textView?.isScrollEnabled = true
        
        // Make UITextView Editable
        textView?.isEditable = false
        listAllVehicles.addSubview(textView!)
        
        let vehicles = bostonDepartment!.listVehicles()
        
        printVehicle(cars: vehicles)
        
        parentWindow.addSubview(listAllVehicles)
    }
    
    func buildAddVehicleView(_ parentWindow:UIView){
        
        //Title
        parentWindow.addSubview(createTitleLable(x: 110, y: 50, width: 200, height: 80, text: "Add a vehicle"))
        
        //BackButton
        let backBtn:UIButton = createButton(x: 30, y: 50, width: 50, height: 50, text: "Back")
        backBtn.addTarget(self, action:#selector(goToPreviousPage(sender:)), for: .touchUpInside)
        parentWindow.addSubview(backBtn)
        
        //Adding text boxes
        
        //Make
        makeTextField = createTextBox(x: 40, y: 150, width:350, height: 50, placeHolder: "Add vehicle make",isNumber:false)
        
        parentWindow.addSubview(makeTextField!)
        
        //Model
       modelTextField = createTextBox(x: 40, y: 220, width:350, height: 50, placeHolder: "Add vehicle model", isNumber: false)
        parentWindow.addSubview(modelTextField!)
        
       //Photo
        photoTextField = createTextBox(x: 40, y: 290, width:350, height: 50, placeHolder: "Add vehicle photo", isNumber: false)
        parentWindow.addSubview(photoTextField!)
        
      //Price
        priceTextField = createTextBox(x: 40, y: 360, width:350, height: 50, placeHolder: "Add price", isNumber: true)
       parentWindow.addSubview(priceTextField!)
        
      //Miles
       milesTextField = createTextBox(x: 40, y: 430, width:170, height: 50, placeHolder: "Add miles",isNumber: true)
       parentWindow.addSubview(milesTextField!)
        
      //Rating
        ratingTextField = createTextBox(x: 220, y: 430, width:170, height: 50, placeHolder: "Rate: 0-5",isNumber: true)
        parentWindow.addSubview(ratingTextField!)
        
      //Type
        typeTextField = createTextBox(x: 40, y: 500, width:170, height: 50, placeHolder: "Add Type",isNumber: false)
        parentWindow.addSubview(typeTextField!)
        
      //Year
        yearTextField = createTextBox(x: 220, y: 500, width:170, height: 50, placeHolder: "Add Year", isNumber: true)
        parentWindow.addSubview(yearTextField!)
        
        let addBtn:UIButton = createButton(x: 40, y: 570, width: 350, height: 50, text: "Add Vehicle")
        addBtn.addTarget(self, action:#selector(addVehicle(sender:)), for: .touchUpInside)
        addBtn.isEnabled = true
        addBtn.backgroundColor = UIColor.white
        addBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        parentWindow.addSubview(addBtn)
       
    }
    
    func buildSearchVehicleView(_ searchView:UIView){
        searchView.addSubview(createTitleLable(x: 110, y: 40, width: 200, height: 80, text: "Search Vehicle"))
        
        searchTextField = createTextBox(x: 40, y: 150, width: 350, height: 80, placeHolder: "Enter make or model to search", isNumber: false)
        searchView.addSubview(searchTextField!)
        
        let btnBack:UIButton = createButton(x: 40, y: 40, width: 50, height: 50, text: "Back")
        btnBack.addTarget(self, action: #selector(goToPreviousPage(sender:)), for: .touchUpInside)
        searchView.addSubview(btnBack)
        
        let btnMake:UIButton = createButton(x: 40, y: 300, width: 170, height: 50, text: "Search by make")
        btnMake.addTarget(self, action: #selector(searchVehicleByMake(sender:)), for: .touchUpInside)
        searchView.addSubview(btnMake)
        
        let btnModel:UIButton = createButton(x: 220, y: 300, width: 170, height: 50, text: "Search by model")
        btnModel.addTarget(self, action: #selector(searchVehicleByModel(sender:)), for: .touchUpInside)
        searchView.addSubview(btnModel)
        
        textView = UITextView(frame:CGRect(x: 40, y: 400, width: 350, height: 300))
        textView?.textAlignment = NSTextAlignment.justified
        textView?.backgroundColor = UIColor.white
        
        textView?.font = UIFont.boldSystemFont(ofSize: 20)
        textView?.font = UIFont(name: "Verdana", size: 17)
        
        // Enable auto-correction and Spellcheck
        textView?.autocorrectionType = UITextAutocorrectionType.yes
        textView?.spellCheckingType = UITextSpellCheckingType.yes
        // myTextView.autocapitalizationType = UITextAutocapitalizationType.None
        
        textView?.isScrollEnabled = true
        
        // Make UITextView Editable
        textView?.isEditable = false
        searchView.addSubview(textView!)
        
    }
    
  
    
    func goToPreviousPage(sender:UIButton){
        let parentWindow:UIView = sender.superview!
        parentWindow.removeFromSuperview()
    }
    
    func addVehicle(sender:UIButton){
        
            do{
                
                if(makeTextField!.text!.isEmpty || modelTextField!.text!.isEmpty || milesTextField!.text!.isEmpty || photoTextField!.text!.isEmpty || priceTextField!.text!.isEmpty || ratingTextField!.text!.isEmpty || typeTextField!.text!.isEmpty || yearTextField!.text!.isEmpty){
                    
                    showErrorAlert(message: "Make sure you entered all fields. ")
                    return
                }
                if let rating = Int(ratingTextField!.text!), rating > 5 {
                    showErrorAlert(message: "Please only rate on a scale of 0-5")
                    return
                }
                
                newCar = try vehicle(makeTextField!.text!, modelTextField!.text!, Float(milesTextField!.text!), photoTextField!.text!, Float(priceTextField!.text!), Float(ratingTextField!.text!), typeTextField!.text!, Int(yearTextField!.text!), bostonDepartment!)
                    
                bostonDepartment?.addVehicles(newCar!)
                    
                let alert = UIAlertController(title: "Success", message: "Successfully addad a vehicle", preferredStyle:UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style:UIAlertActionStyle.default, handler: nil))
                window?.rootViewController?.present(alert, animated: true, completion: nil)
            }catch exceptionHandler.ThrowError.IllegalArgumentException{
                showErrorAlert(message: "Make sure you entered numeric values in price, rating, miles and year respectively")
            }catch{
                
            }

    }
    
    func searchVehicleByMake(sender:UIButton){
        
        if !(searchTextField?.text?.isEmpty)!{
            
            let vehicle = bostonDepartment!.searchVehicleByMake(searchTextField!.text!)
            printVehicle(cars: vehicle)
        }else{
            showErrorAlert(message: "Please enter input to search")
        }
        
    }
    
    func searchVehicleByModel(sender:UIButton){
        if !(searchTextField?.text?.isEmpty)!{
            
            let vehicle = bostonDepartment!.searchVehicleByName(searchTextField!.text!)
            printVehicle(cars: vehicle)
        }else{
            showErrorAlert(message: "Please enter input to search")
        }
    }
    
    func printVehicle(cars:[vehicle]){
        var flag:Bool = false
        textView?.text = ""
        for car in cars{
            flag = true
            textView?.text = """
                Vehicle Make:\(car.getMake())
                Vehicle Model:\(car.getModel())
                Vehicle Price:\(car.getPrice())
                Vehicle Rating:\(car.getRating())
                Vehicle Type:\(car.getType())
                Vehicle Photo:\(car.getPhoto())
                \n
                """ + textView!.text
        }
        
        if !flag{
            showErrorAlert(message: "No values found, please refine your search")
        }
    }
    
    func showErrorAlert(message:String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle:UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style:UIAlertActionStyle.destructive, handler: nil))
        window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    func createTitleLable( x:Int, y:Int, width:Int, height:Int, text:String) -> UILabel{
        let rect:CGRect = CGRect(x:x,y:y,width:width,height:height)
        let label:UILabel = UILabel(frame: rect)
        label.text=text
        label.font=UIFont(name: "TimesNewRomanPSMT", size: 30.0)
        
        return label
    }
    
    func createContentLable( x:Int, y:Int, width:Int, height:Int, text:String) -> UILabel{
        let rect:CGRect = CGRect(x:x,y:y,width:width,height:height)
        let label:UILabel = UILabel(frame: rect)
        label.text=text
        label.font=UIFont(name: "TimesNewRomanPSMT", size: 22.5)
        
        return label
    }
    
    func createButton(x:Int, y:Int, width:Int, height:Int, text:String) -> UIButton {
        let btn1:UIButton = UIButton(frame: CGRect(x: x, y: y, width: width, height: height))
        btn1.setTitle(text, for: UIControlState.normal)
        btn1.layer.cornerRadius = 20.0
        btn1.layer.borderColor = UIColor.blue.cgColor
        btn1.layer.borderWidth = 2.0
        btn1.backgroundColor = UIColor.white
        btn1.setTitleColor(UIColor.blue, for: UIControlState.normal)
        return btn1
    }
    
    func createTextBox(x:Int, y:Int, width:Int, height:Int, placeHolder:String, isNumber:Bool) -> UITextField{
        let textField = UITextField(frame: CGRect(x:x, y:y, width:width, height:height))
        textField.textAlignment = NSTextAlignment.center
        textField.textColor = UIColor.black
        textField.backgroundColor = UIColor.white
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.autocapitalizationType = UITextAutocapitalizationType.words
        textField.clearButtonMode = .whileEditing
        textField.placeholder = placeHolder
        if isNumber{
            textField.keyboardType = .numberPad
        }else{
            textField.keyboardType = .default
        }
        textField.returnKeyType = .done
        textField.delegate = self as? UITextFieldDelegate
        return textField
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

