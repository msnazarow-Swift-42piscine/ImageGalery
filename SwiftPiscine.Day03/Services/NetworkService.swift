//
//  NetworkService.swift
//  SwiftPiscine.Day03
//
//  Created by out-nazarov2-ms on 20.09.2021.
//

import UIKit

protocol NetworkServiceProtocol {
   func downloadImage(for url: String, complition: @escaping (UIImage?) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func downloadImage(for url: String, complition: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: url) else {
            complition(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data, error == nil else {
                complition(nil)
                return
            }
            complition(UIImage(data: data))
        }.resume()
    }
}
