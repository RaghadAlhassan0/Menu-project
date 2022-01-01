//
//  main.swift
//  menu
//
//  Created by Raghad Alhassan on 25/05/1443 AH.
//

import Foundation



struct Meal {
    
    let price: Double
    let name: String
    
   //function
    init(name: String, price: Double){
        
        self.name = name
        self.price = price
        
    }
    
}

enum Contury: String {
    case Italian = "Italian"
    case French = "French"
    case Turkish = "Turkish"
    
}
//arry meals
var meals: [Meal] = [
    
    Meal(name: "Food1", price: 20),
    Meal(name: "Food2", price: 20),
    Meal(name: "Food3", price: 20),
    Meal(name: "Food4", price: 20),
    Meal(name: "Food5", price: 20),
    Meal(name: "Food6", price: 20),
    Meal(name: "Food7", price: 20),
    
]

//arry cart
var cart: [Meal] = []

// Note: console start from here

print("~~~~~~~~~~~~~~~~~~~~~~~~~")
print(" ✨ Wellcome To Mellon ✨ ")
print("~~~~~~~~~~~~~~~~~~~~~~~~~")

print("Enter your Name")
if let name = readLine(){
    
    print("Enter your PhoneNumber")
    var phoneNumber = readLine()
    
    print("We are at your service Mrs \(name)\n ")
    
        print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        print("    Country Food Menu    ")
        print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    
        print("-Italian Food 🇮🇹\n-French Food 🇫🇷\n-Turkish Food 🇹🇷")
    
        print("~~~~~~~~~~~~~~~~~~~~~~~~~\n") 
 
    print("Choose the country to view its meals.\n")
   //loop
    while true{
        let country = readLine()
        
        guard let country = country else {
            continue
        }
        
        switch Contury(rawValue: country) ?? Contury.Italian ?? Contury.French
        {
            
        case .French:
            meals = frenchFoods
        case .Italian:
            meals =  italianFoods
        case .Turkish:
            meals =  turkishFoods
        }
        
        break
        
        
    }
    
    var index = 0
    print("\nSelect your meal by typing the number be for it\n")
    
    for meal in meals {
        index += 1
        print("\t\(index) \(meal.name) \(meal.price) SR")
    }
    
    
    // while loop
    while true {
        print("\n~~~~~~~~~~Please Choose Your meal's number or No to exit~~~~~~~~~~\n")
        
        let input = readLine()
        print("Has Been Added:")
        guard let input = input else {
            break
        }
        
        if input == "No" {
          
            break
            
        }
        
        guard let input = Int(input) else {
            break
        }
        
        if input > meals.count {
            continue
        }
        
        let meal: Meal? = meals[input - 1]
        
        guard let meal = meal else {
            continue
            
        }
        print("\t\(meal.name) t\(meal.price) SR")
        cart.append(meal)
        
    }
    
    for meal in cart {
        
        
        print("\t\(meal.name) \(meal.price) SR")
        
    }
    //print total price
    print("\tThe total amount", cart.map{$0.price}.reduce(0, +))
    
}


