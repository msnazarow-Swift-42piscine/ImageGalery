//
//  ImageService.swift
//  SwiftPiscine.Day03
//
//  Created by out-nazarov2-ms on 20.09.2021.
//

import UIKit

protocol ImageServiceProtocol {
    func getImage(for id: Int) -> UIImage?
    func saveImages(images: [UIImage])
}

class ImageService: ImageServiceProtocol {
    var images: [UIImage] = []
    func saveImages(images: [UIImage]) {
        self.images = images
    }

    func getImage(for id: Int) -> UIImage? {
        return images[id]
    }
}
