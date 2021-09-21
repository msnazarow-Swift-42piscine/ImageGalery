//
//  ImageScreenAssembly.swift
//  SwiftPiscine.Day03
//
//  Created by out-nazarov2-ms on 20.09.2021.
//  
//

import UIKit

enum ImageScreenAssembly{
    
    // MARK: Static methods
    static func createModule(with imageId: Int) -> UIViewController {

        let viewController = ImageScreenViewController()
        let router = ImageScreenRouter(view: viewController)
        let interactor = ImageScreenInteractor()
        let imageService = ImageService.shared
        let presenter = ImageScreenPresenter(view: viewController, interactor: interactor, router: router, imageService: imageService, imageId: imageId)

        viewController.presenter = presenter

        return viewController
    }
}
