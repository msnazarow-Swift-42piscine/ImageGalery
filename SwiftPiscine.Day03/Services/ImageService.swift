//
//  ImageService.swift
//  SwiftPiscine.Day03
//
//  Created by out-nazarov2-ms on 20.09.2021.
//

import UIKit

protocol ImageServiceProtocol {
    func getImage(for id: Int) -> UIImage?
//    func saveImages(images: [UIImage])
    func saveImage(for id: Int, image: UIImage)
}

class ImageService: ImageServiceProtocol {
    var images: [Int: UIImage] = [:]

    static let shared = ImageService()

    private init() {}
    
//    func saveImages(images: [UIImage]) {
//        self.images = images
//    }

    func getImage(for id: Int) -> UIImage? {
//        guard id < images.count else { return nil }
        return images[id]
    }

    func saveImage(for id: Int, image: UIImage) {
        images[id] = image
    }
}
