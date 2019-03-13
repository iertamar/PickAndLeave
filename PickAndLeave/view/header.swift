//
//  header.swift
//  WalmartGo
//
//  Created by Amarprakash Mishra on 11/03/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import UIKit

protocol StartDelegate {
    func startOverPressed()
    func deleteOverPressed()
}

class Header: UITableViewHeaderFooterView {
    var delegate: StartDelegate?
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let button1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.purple
        button.setTitle("ADD", for: .normal)
        button.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    let button2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.purple
        button.setTitle("DELETE", for: .normal)
        button.addTarget(self, action: #selector(deleteButtonPressed), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 20
        return button
    }()
    
    let stkView: UIStackView = {
        let stkView = UIStackView()
        stkView.translatesAutoresizingMaskIntoConstraints = false
        stkView.axis = .horizontal
        stkView.spacing = 20
        stkView.distribution = .fillEqually
        return stkView
    }()
    
    func setupViews() {
        stkView.addArrangedSubview(button1)
        stkView.addArrangedSubview(button2)
        contentView.backgroundColor = .lightGray
        contentView.addSubview(stkView)
        stkView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        stkView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        stkView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30 ).isActive = true
        stkView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
    }
    
    @objc func addButtonPressed(){
        delegate?.startOverPressed()
    }
    
    @objc func deleteButtonPressed(){
        delegate?.deleteOverPressed()
    }
}
