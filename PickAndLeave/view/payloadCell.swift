//
//  payloadCell.swift
//  WalmartGo
//
//  Created by Amarprakash Mishra on 11/03/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import UIKit

class payloadCell1: UITableViewCell{
    var label1: UILabel = {
        let label = UILabel()
        label.text = "label"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    var label2: UILabel = {
        let label = UILabel()
        label.text = "unit"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    var label3: UILabel = {
        let label = UILabel()
        label.text = "price"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    let stkView: UIStackView = {
        let stkView = UIStackView()
        stkView.translatesAutoresizingMaskIntoConstraints = false
        stkView.axis = .horizontal
        stkView.spacing = 20
        stkView.distribution = .fill
        stkView.backgroundColor = .green
        return stkView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpLayout(){
        stkView.addArrangedSubview(label1)
        stkView.addArrangedSubview(label2)
        stkView.addArrangedSubview(label3)
        contentView.addSubview(stkView)
        stkView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stkView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        stkView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        stkView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
