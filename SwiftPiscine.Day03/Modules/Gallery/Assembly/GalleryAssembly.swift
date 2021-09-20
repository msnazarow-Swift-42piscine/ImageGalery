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
        let viewController = GalleryViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let router = GalleryRouter(view: viewController)
        let networkService = NetworkService()
        let imageService = ImageService.shared
        let interactor = GalleryInteractor(networkService: networkService, imageService: imageService)
        let dataSource = GalleryPresenterDataSource()
        let presenter = GalleryPresenter(view: viewController, interactor: interactor, router: router, dataSource: dataSource)

        viewController.presenter = presenter
        dataSource.presenter = presenter
        
        return viewController
    }
}
