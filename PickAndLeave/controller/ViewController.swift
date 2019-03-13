//
//  ViewController.swift
//  WalmartGo
//
//  Created by Amarprakash Mishra on 11/03/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, StartDelegate, PassingIdDelegate  {
    var fields:[ProductResponse] = []
    var header: Header?
    var footer: Footer?
    var total = 0.0
    var dict: [Int: Int] = [:]
    
    let button1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.textColor = .black
        button.setTitle("Checkout", for: .normal)
        //button.addTarget(self, action: #selector(footerButtonPressed), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .gray
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
//        tableView.estimatedRowHeight = 100
//        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(payloadCell1.self, forCellReuseIdentifier: "payloadCellId1")
        tableView.register(Header.self, forHeaderFooterViewReuseIdentifier: "headerId")
        tableView.register(Footer.self, forHeaderFooterViewReuseIdentifier: "footerId")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fields.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "payloadCellId1", for: indexPath) as? payloadCell1
        cell?.label1.text = fields[indexPath.row].name
        cell?.label2.text = "\(dict[fields[indexPath.row].id]!)"
        let multiply = Float(dict[fields[indexPath.row].id]!) * fields[indexPath.row].price
        cell?.label3.text = "\(multiply)"
        //total = total + 500
        return cell ?? UITableViewCell()
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        header =  tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerId") as? Header
        header?.delegate = self
        return header
    }
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: "footerId") as? Footer
        let rounded = Double(round((1000*total)/1000))
        footer?.label2.text = "\(rounded)"
        footer?.delegate = self
        return footer
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 80
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didselect row clicked")
    }
    
    func startOverPressed() {
        let secondVC = SecondViewController()
        secondVC.delegate = self
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    func deleteOverPressed() {
        let deleteVC = DeleteViewController()
        deleteVC.delegate = self
        navigationController?.pushViewController(deleteVC, animated: true)
    }
    
    func enteredIdByUser(enteredId: String) {
                let getProdect = GetProduct()
        getProdect.getPayloadUrlSession(id: enteredId) { (prodResponse) in
                    if let prodResponse = prodResponse {
                        if let val = self.dict[prodResponse.id]{
                            self.dict[prodResponse.id] = val + 1
                        }
                        else{
                            self.fields.append(prodResponse)
                            self.dict[prodResponse.id] = 1
                        }
                        self.total = self.total + Double(prodResponse.price)
                        self.tableView.reloadData()
                    }
                }
    }

}

extension ViewController: PassingDeleteIdDelegate{
    func enteredDeleteIdByUser(enteredId: Int) {
        var index = -1
        for i in 0 ..< fields.count {
            if fields[i].id == enteredId{
                index = i
                break
            }
        }
        total = total - Double(fields[index].price)
        
        if dict[enteredId] == 1{
            fields.remove(at: index)
        }
        else{
            dict[enteredId] = dict[enteredId]! - 1
        }
        tableView.reloadData()
    }
}

extension ViewController: FooterDelegate{
    func checkoutButtonPressed() {
        fields = []
        dict.removeAll()
        total = 0.0
        tableView.reloadData()
    }
}


