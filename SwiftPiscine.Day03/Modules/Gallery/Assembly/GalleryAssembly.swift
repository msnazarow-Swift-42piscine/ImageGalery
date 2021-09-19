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

        let viewController = GalleryViewController()
        let router = GalleryRouter(view: viewController)
        let interactor = GalleryInteractor()
        let presenter = GalleryPresenter(view: viewController, interactor: interactor, router: router)

        viewController.presenter = presenter

        return viewController
    }
}
