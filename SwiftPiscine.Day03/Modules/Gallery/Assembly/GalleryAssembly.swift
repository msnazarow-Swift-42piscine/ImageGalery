//
//  GalleryAssembly.swift
//  SwiftPiscine.Day03
//
//  Created by out-nazarov2-ms on 19.09.2021.
//  
//

import UIKit

enum GalleryAssembly{
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 200, height: 200)
        let viewController = GalleryViewController(collectionViewLayout: layout)
        let router = GalleryRouter(view: viewController)
        let networkService = NetworkService()
        let imageService = ImageService()
        let interactor = GalleryInteractor(networkService: networkService, imageService: imageService)
        let dataSource = GalleryPresenterDataSource()
        let presenter = GalleryPresenter(view: viewController, interactor: interactor, router: router, dataSource: dataSource)

        viewController.presenter = presenter
        dataSource.presenter = presenter
        
        return viewController
    }
}
