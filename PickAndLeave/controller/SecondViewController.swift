//
//  SecondViewController.swift
//  WalmartGo
//
//  Created by Amarprakash Mishra on 12/03/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import UIKit

protocol PassingIdDelegate{
    func enteredIdByUser(enteredId: String)
}
class SecondViewController: UIViewController{
    var delegate: PassingIdDelegate?
    let itemText: UITextField = {
        let sampleTextField =  UITextField()
        sampleTextField.placeholder = "Enter item id here"
        sampleTextField.translatesAutoresizingMaskIntoConstraints = false
        sampleTextField.font = UIFont.systemFont(ofSize: 18)
        sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
        sampleTextField.autocorrectionType = UITextAutocorrectionType.no
        sampleTextField.textAlignment = .center
        return sampleTextField
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Enter Item ID"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let button1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.lightGray
        button.setTitle("Add Item", for: .normal)
        button.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        itemText.delegate = self
        setUpView()
    }
    
    func setUpView(){
        view.addSubview(label)
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 40).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -40).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor , constant: 100).isActive = true
        label.heightAnchor.constraint(equalToConstant: 40).isActive =  true
        
        view.addSubview(itemText)
        itemText.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 70).isActive = true
        itemText.topAnchor.constraint(equalTo: label.topAnchor , constant: 50).isActive = true
        itemText.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -70).isActive = true
        itemText.heightAnchor.constraint(equalToConstant: 40).isActive =  true
        
        view.addSubview(button1)
        button1.topAnchor.constraint(equalTo: itemText.topAnchor , constant: 100).isActive = true
        button1.widthAnchor.constraint(equalToConstant: 200).isActive =  true
        button1.heightAnchor.constraint(equalToConstant: 40).isActive =  true
        button1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //button1.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func submitButtonPressed(){
        delegate?.enteredIdByUser(enteredId: itemText.text!)
        navigationController?.popViewController(animated: true)
    }
}

extension SecondViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
