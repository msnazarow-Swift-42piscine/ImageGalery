//
//  GalleryRouter.swift
//  SwiftPiscine.Day03
//
//  Created by out-nazarov2-ms on 19.09.2021.
//  
//

import UIKit

class GalleryRouter: PresenterToRouterGalleryProtocol {

    // MARK: - Properties
    weak var view: UIViewController?

    // MARK: - Init
    init(view: UIViewController) {
        self.view = view
    }
    func routeToImageScreen(with imageId: Int) {
        view?.navigationController?.pushViewController(ImageScreenAssembly.createModule(with: imageId), animated: true)
    }
}
