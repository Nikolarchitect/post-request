//
//  Extensions.swift
//  post-request
//
//  Created by Nikolay Kiyko on 29.10.2022.
//  Copyright ⓒ Nikolay Kiyko 2022. All rights reserved.
//

import UIKit

enum Constants {
    enum Colours {
        static var buttonColour: UIColor {
            UIColor(red: 148/255, green: 98/255, blue: 197/255, alpha: 1)
        }
    }
    enum Fonts {
        static var ui24HelveticaRegular: UIFont? {
            UIFont(name: "Helvetica", size: 24)
        }
        static var ui30HelveticaBold: UIFont? {
            UIFont(name: "Helvetica-Bold", size: 30)
        }
    }
}

let swift = UIButton()
let alamofire = UIButton()
let headerLabel = UILabel()
let result = UILabel()
let birthField = UITextField()
let occupationField = UITextField()
let nameField = UITextField()
let lastnameField = UITextField()
let countryField = UITextField()

extension UIButton {
    func swiftButtonAppearance() -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Constants.Colours.buttonColour
        button.setTitleColor(.white, for: .normal)
        button.setTitle("post-sw", for: .normal)
        button.layer.cornerRadius = 10
        return button
    }
    func alamofireButtonAppearance() -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Constants.Colours.buttonColour
        button.setTitleColor(.white, for: .normal)
        button.setTitle("post-al", for: .normal)
        button.layer.cornerRadius = 10
        return button
    }
}

extension UILabel {
    func headerAppearance() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "enter your details:"
        label.font = Constants.Fonts.ui30HelveticaBold
        label.textColor = .black
        label.textAlignment = .center
        return label
    }
    func resultAppearance() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "result"
        label.font = Constants.Fonts.ui24HelveticaRegular
        label.textColor = .systemGray4
        label.textAlignment = .center
        return label
    }
}

extension UITextField {
    func birthFieldAppearance() -> UITextField {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "enter your birth year"
        field.textAlignment = .center
        field.backgroundColor = .systemGray6
        field.textColor = .black
        field.layer.cornerRadius = 10
        return field
    }
    func occupationFieldAppearance() -> UITextField {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "enter your occupation"
        field.textAlignment = .center
        field.backgroundColor = .systemGray6
        field.textColor = .black
        field.layer.cornerRadius = 10
        return field
    }
    func nameFieldAppearance() -> UITextField {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "enter your name"
        field.textAlignment = .center
        field.backgroundColor = .systemGray6
        field.textColor = .black
        field.layer.cornerRadius = 10
        return field
    }
    func lastnameFieldAppearance() -> UITextField {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "enter your lastname"
        field.textAlignment = .center
        field.backgroundColor = .systemGray6
        field.textColor = .black
        field.layer.cornerRadius = 10
        return field
    }
    func countryFieldAppearance() -> UITextField {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "enter your country"
        field.textAlignment = .center
        field.backgroundColor = .systemGray6
        field.textColor = .black
        field.layer.cornerRadius = 10
        return field
    }
}
