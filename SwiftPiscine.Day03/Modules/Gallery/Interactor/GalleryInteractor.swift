//
//  GalleryInteractor.swift
//  SwiftPiscine.Day03
//
//  Created by out-nazarov2-ms on 19.09.2021.
//  
//

import UIKit

class GalleryInteractor: PresenterToInteractorGalleryProtocol {
    let networkService: NetworkServiceProtocol
    let imageService: ImageServiceProtocol

    init(networkService: NetworkServiceProtocol, imageService: ImageServiceProtocol) {
        self.networkService = networkService
        self.imageService = imageService
    }

    func downloadImages(for names: [String], complition: @escaping ([UIImage]) -> Void) {
        let group = DispatchGroup()
        var images: [UIImage] = []
        for url in names {
            group.enter()
            networkService.downloadImage(for: url) { image in
                guard let image = image else {
                    group.leave()
                    return
                }
                images.append(image)
                group.leave()
            }
        }
        group.notify(queue: .main) {
            complition(images)
        }
    }

    func getImage(for id: Int) -> UIImage? {
        return imageService.getImage(for: id)
    }

    func saveImages(images: [UIImage]) {
        imageService.saveImages(images: images)
    }
}
