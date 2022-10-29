//
//  ViewController.swift
//  post-request
//
//  Created by Nikolay Kiyko on 18.10.2022.
//  Copyright ⓒ Nikolay Kiyko 2022. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire

    class ViewController: UIViewController {
    
    var birthData: Int = 0
    var occupationData: String = "empty"
    var nameData: String = "empty"
    var lastnameData: String = "empty"
    var countryData: String = "empty"
        
    func getDataModel() -> Person {
        let model = Person(birth: Int(birthData), occupation: "\(occupationData)", name: "\(nameData)", lastname: "\(lastnameData)", country: "\(countryData)")
        return model
    }

    private let swiftButton: UIButton = swift.swiftButtonAppearance()
    private let alamofireButton: UIButton = alamofire.alamofireButtonAppearance()
    private let headerText: UILabel = headerLabel.headerAppearance()
    private var resultLabel: UILabel = result.resultAppearance()
    private let birthTextField: UITextField = birthField.birthFieldAppearance()
    private let occupationTextField: UITextField = occupationField.occupationFieldAppearance()
    private let nameTextField: UITextField = nameField.nameFieldAppearance()
    private let lastnameTextField: UITextField = lastnameField.lastnameFieldAppearance()
    private let countryTextField: UITextField = countryField.countryFieldAppearance()
    
    private lazy var buttonStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .center
        view.axis = .vertical
        view.backgroundColor = .systemGray4
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .center
        view.axis = .horizontal
        view.backgroundColor = .systemGray4
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
        birthTextField.delegate = self
        occupationTextField.delegate = self
        nameTextField.delegate = self
        lastnameTextField.delegate = self
        countryTextField.delegate = self
        
        swiftButton.addTarget(
            self,
            action: #selector(swiftButtonTapped),
            for: .touchUpInside
        )
        alamofireButton.addTarget(
            self,
            action: #selector(alamofireButtonTapped),
            for: .touchUpInside)
    }
    
    private func setupViews() {
        view.backgroundColor = .systemGray4
        view.addSubview(mainStackView)
        mainStackView.addSubview(headerText)
        mainStackView.addSubview(birthTextField)
        mainStackView.addSubview(occupationTextField)
        mainStackView.addSubview(nameTextField)
        mainStackView.addSubview(lastnameTextField)
        mainStackView.addSubview(countryTextField)
        mainStackView.addSubview(buttonStackView)
        buttonStackView.addSubview(swiftButton)
        buttonStackView.addSubview(alamofireButton)
        mainStackView.addSubview(resultLabel)
    }
    
    private func setupConstraints() {
        headerText.snp.makeConstraints { make in
            make.top.equalTo(mainStackView).inset(32)
            make.left.right.equalTo(mainStackView)
        }
        
        birthTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(300)
            make.top.equalTo(headerText).inset(64)
            make.centerX.equalTo(mainStackView)
        }
        occupationTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(300)
            make.top.equalTo(birthTextField).inset(60)
            make.centerX.equalTo(mainStackView)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(300)
            make.top.equalTo(occupationTextField).inset(60)
            make.centerX.equalTo(mainStackView)
        }
        
        lastnameTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(300)
            make.top.equalTo(nameTextField).inset(60)
            make.centerX.equalTo(mainStackView)
        }
        
        countryTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(300)
            make.top.equalTo(lastnameTextField).inset(60)
            make.centerX.equalTo(mainStackView)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.centerX.equalTo(mainStackView)
            make.width.equalTo(350)
            make.top.equalTo(countryTextField).inset(64)
        }
        
        swiftButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(130)
            make.top.bottom.equalTo(buttonStackView)
            make.left.equalTo(buttonStackView).inset(35)
        }
        
        alamofireButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(130)
            make.top.bottom.equalTo(buttonStackView)
            make.right.equalTo(buttonStackView).inset(35)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.centerX.equalTo(mainStackView)
            make.top.equalTo(buttonStackView).inset(64)
        }
        
        mainStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin)
            make.left.right.equalToSuperview()
        }
    }
    
    public func displaySuccess() {
        resultLabel.textColor = .systemGreen
        resultLabel.text = "success"
    }
    
    public func displayFailure() {
        resultLabel.textColor = .systemRed
        resultLabel.text = "failure"
    }
    
    @objc private func swiftButtonTapped() {
        print("S-Tapped")
        
        // Конвертация данных в JSON
        let jsonData = try? JSONSerialization.data(withJSONObject: getDataModel().dictionaryRepresentation())
        
        // Настройка запроса
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        // Запрос и обработка ответа
        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self?.displayFailure()
                }
                return
            }
            DispatchQueue.main.async {
                self?.displaySuccess()
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data)
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }
        task.resume()
    }
    
    @objc private func alamofireButtonTapped() {
        print("A-Tapped")
        
        let dataModel = getDataModel()
        AF.request(
            "https://jsonplaceholder.typicode.com/posts",
            method: .post,
            parameters: dataModel,
            encoder: JSONParameterEncoder.default
        ).response { [weak self] response in
            guard response.error == nil else {
                self?.displayFailure()
                return
            }
            self?.displaySuccess()
            debugPrint(response)
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == birthTextField {
            birthData = Int(textField.text ?? "") ?? birthData
        } else if textField == occupationTextField {
            occupationData = textField.text ?? occupationData
        } else if textField == nameTextField {
            nameData = textField.text ?? nameData
        } else if textField == lastnameTextField {
            lastnameData = textField.text ?? lastnameData
        } else {
            countryData = textField.text ?? countryData
        }
        textField.resignFirstResponder()
        return true
    }
}
