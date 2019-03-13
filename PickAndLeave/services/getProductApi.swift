//
//  getProductApi.swift
//  WalmartGo
//
//  Created by Amarprakash Mishra on 11/03/19.
//  Copyright © 2019 Amarprakash Mishra. All rights reserved.
//

import Foundation

class GetProduct{
    func getPayloadUrlSession(id: String, completion: @escaping payLoadCompletion){
        let urlString = "\(constURL)\(id)"
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else{
                debugPrint(error.debugDescription)
                completion(nil)
                return
            }
            guard let data = data else{
                return
            }
            let jsonDecoder =  JSONDecoder()
            do {
                let ploadRes = try jsonDecoder.decode(ProductResponse.self , from: data)
                DispatchQueue.main.async {
                    completion(ploadRes)
                }
            } catch {
                debugPrint(error.localizedDescription)
                return
            }
        }
        task.resume()
    }
}
