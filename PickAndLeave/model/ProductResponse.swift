//
//  ProductResponse.swift
//  WalmartGo
//
//  Created by Amarprakash Mishra on 11/03/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import Foundation

struct ProductResponse: Decodable {
    let id: Int
    let name: String
    let category: String
    let price: Float
    let brand: String
}
