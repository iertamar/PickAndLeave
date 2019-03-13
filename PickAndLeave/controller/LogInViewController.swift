//
//  LogInViewController.swift
//  WalmartGo
//
//  Created by Amarprakash Mishra on 13/03/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController{
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Welcome To Walmart"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.font = UIFont.systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let button1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.purple
        button.setTitle("Log In", for: .normal)
        button.addTarget(self, action: #selector(logInButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    let userLabel: UILabel = {
        let label = UILabel()
        label.text = "UserName"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let usernameText: UITextField = {
        let sampleTextField =  UITextField()
        sampleTextField.placeholder = "Enter your username"
        sampleTextField.translatesAutoresizingMaskIntoConstraints = false
        sampleTextField.font = UIFont.systemFont(ofSize: 18)
        sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
        sampleTextField.autocorrectionType = UITextAutocorrectionType.no
        sampleTextField.textAlignment = .center
        return sampleTextField
    }()
    
    let passLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let passwordText: UITextField = {
        let sampleTextField =  UITextField()
        sampleTextField.placeholder = "Enter your password"
        sampleTextField.translatesAutoresizingMaskIntoConstraints = false
        sampleTextField.font = UIFont.systemFont(ofSize: 18)
        sampleTextField.isSecureTextEntry = true
        sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
        sampleTextField.autocorrectionType = UITextAutocorrectionType.no
        sampleTextField.textAlignment = .center
        return sampleTextField
    }()
    
    let stkView1: UIStackView = {
        let stkView = UIStackView()
        stkView.translatesAutoresizingMaskIntoConstraints = false
        stkView.axis = .horizontal
        stkView.spacing = 20
        stkView.distribution = .fillEqually
        return stkView
    }()
    
    let stkView2: UIStackView = {
        let stkView = UIStackView()
        stkView.translatesAutoresizingMaskIntoConstraints = false
        stkView.axis = .horizontal
        stkView.spacing = 20
        stkView.distribution = .fillEqually
        return stkView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setUpView()
    }
    
    func setUpView(){
        view.addSubview(label)
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        label.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        view.addSubview(stkView1)
        stkView1.addArrangedSubview(userLabel)
        stkView1.addArrangedSubview(usernameText)
        stkView1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 70).isActive = true
        stkView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stkView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        stkView1.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(stkView2)
        stkView2.addArrangedSubview(passLabel)
        stkView2.addArrangedSubview(passwordText)
        stkView2.topAnchor.constraint(equalTo: stkView1.bottomAnchor, constant: 20).isActive = true
        stkView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stkView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        stkView2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(button1)
        button1.topAnchor.constraint(equalTo: stkView1.bottomAnchor, constant: 200).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    @objc func logInButtonPressed(){
        navigationController?.pushViewController(ScanViewController(), animated: true)
    }
}
