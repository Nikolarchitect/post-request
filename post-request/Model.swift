//
//  Model.swift
//  post-request
//
//  Created by Nikolay Kiyko on 29.10.2022.
//  Copyright ⓒ Nikolay Kiyko 2022. All rights reserved.
//

import UIKit

class Person: Codable {
    public let birth: Int?
    public let occupation: String?
    public let name: String?
    public let lastname: String?
    public let country: String?
    
    init(birth: Int, occupation: String, name: String, lastname: String, country: String) {
        self.birth = birth
        self.occupation = occupation
        self.name = name
        self.lastname = lastname
        self.country = country
    }
    
    class func modelsFromDictionaryArray(array: NSArray) -> [Person] {
        var models: [Person] = []
        for item in array {
            models.append(Person(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required init?(dictionary: NSDictionary) {
        birth = dictionary["birth"] as? Int
        occupation = dictionary["occupation"] as? String
        name = dictionary["name"] as? String
        lastname = dictionary["lastname"] as? String
        country = dictionary["country"] as? String
    }
    
    func dictionaryRepresentation() -> NSDictionary {
        let dictionary = NSMutableDictionary()
        dictionary.setValue(self.birth, forKey: "birth")
        dictionary.setValue(self.occupation, forKey: "occupation")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.lastname, forKey: "lastname")
        dictionary.setValue(self.country, forKey: "country")
        return dictionary
    }
}
