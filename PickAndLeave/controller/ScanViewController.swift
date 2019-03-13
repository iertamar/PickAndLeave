//
//  ScanViewController.swift
//  WalmartGo
//
//  Created by Amarprakash Mishra on 13/03/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import UIKit

class ScanViewController: UIViewController {

    let button1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.purple
        button.setTitle("scan", for: .normal)
        button.addTarget(self, action: #selector(scanButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    let enableTokenButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.brown
        button.setTitle("Enable Token", for: .normal)
        button.addTarget(self, action: #selector(enableTokenButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Welcome To Walmart"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.font = UIFont.systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let stkView: UIStackView = {
        let stkView = UIStackView()
        stkView.translatesAutoresizingMaskIntoConstraints = false
        stkView.axis = .horizontal
        stkView.spacing = 20
        stkView.distribution = .fillEqually
        return stkView
    }()
    
    let img: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "QRCode")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setUpView()
    }
    
    func setUpView(){
        
        view.addSubview(enableTokenButton)
        enableTokenButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        enableTokenButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        enableTokenButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        enableTokenButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        view.addSubview(stkView)
        stkView.topAnchor.constraint(equalTo: enableTokenButton.topAnchor, constant: 50).isActive = true
        stkView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stkView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30 ).isActive = true
        //stkView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        
        view.addSubview(img)
        img.topAnchor.constraint(equalTo: enableTokenButton.bottomAnchor, constant: 150).isActive = true
        img.widthAnchor.constraint(equalToConstant: 250).isActive = true
        img.heightAnchor.constraint(equalToConstant: 250).isActive = true
        img.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(button1)
        button1.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 50).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func scanButtonPressed(){
        navigationController?.pushViewController(ViewController(), animated: true)
    }
    
    @objc func enableTokenButtonPressed(){
        navigationController?.pushViewController(TokenViewController(), animated: true)
    }

}

extension ScanViewController: PassingTokenDelegate{
    func addTokenWithPerson(enteredId: String) {
        label.text = enteredId
        stkView.addArrangedSubview(label)
    }
}
