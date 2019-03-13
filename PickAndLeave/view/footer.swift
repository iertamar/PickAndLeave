//
//  footer.swift
//  WalmartGo
//
//  Created by Amarprakash Mishra on 11/03/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import UIKit

protocol FooterDelegate{
    func checkoutButtonPressed()
}

class Footer: UITableViewHeaderFooterView {
    var delegate: FooterDelegate?
    let button1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Checkout", for: .normal)
        button.addTarget(self, action: #selector(footerButtonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = UIColor.purple
        return button
    }()
    
    let textView: UIView = {
       let textView = UIView()
        textView.backgroundColor = .clear
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let checkoutView: UIView = {
        let textView = UIView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let label1: UILabel = {
        let label = UILabel()
        label.text = "Total"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .left
        return label
    }()
    
    let label2: UILabel = {
        let label = UILabel()
        label.text = "0.0$"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.backgroundColor = .lightGray
        textView.addSubview(label1)
        textView.addSubview(label2)
        contentView.addSubview(textView)
        checkoutView.addSubview(button1)
        contentView.addSubview(checkoutView)

        textView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 50).isActive = true

        checkoutView.topAnchor.constraint(equalTo: textView.bottomAnchor).isActive = true
        checkoutView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        checkoutView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        checkoutView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        label1.topAnchor.constraint(equalTo: textView.topAnchor).isActive = true
        label1.leadingAnchor.constraint(equalTo: textView.leadingAnchor).isActive = true
        label1.widthAnchor.constraint(equalTo: textView.widthAnchor, multiplier: 0.7).isActive = true
        label1.bottomAnchor.constraint(equalTo: textView.bottomAnchor).isActive = true
        
        label2.topAnchor.constraint(equalTo: textView.topAnchor).isActive = true
        label2.leadingAnchor.constraint(equalTo: label1.trailingAnchor).isActive = true
        label2.trailingAnchor.constraint(equalTo: textView.trailingAnchor).isActive = true
        label2.bottomAnchor.constraint(equalTo: textView.bottomAnchor).isActive = true
        
        button1.centerXAnchor.constraint(equalTo: checkoutView.centerXAnchor).isActive = true
        button1.centerYAnchor.constraint(equalTo: checkoutView.centerYAnchor).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button1.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
    }
    
    @objc func footerButtonPressed(){
        delegate?.checkoutButtonPressed()
    }
}
