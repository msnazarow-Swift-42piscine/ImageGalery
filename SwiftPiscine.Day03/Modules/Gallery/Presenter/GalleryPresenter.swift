//
//  GalleryPresenter.swift
//  SwiftPiscine.Day03
//
//  Created by out-nazarov2-ms on 19.09.2021.
//  
//

import Foundation

class GalleryPresenter: ViewToPresenterGalleryProtocol {

    // MARK: Properties
    weak var view: PresenterToViewGalleryProtocol?
    let interactor: PresenterToInteractorGalleryProtocol?
    let router: PresenterToRouterGalleryProtocol?

    // MARK: Init
    init(view: PresenterToViewGalleryProtocol, interactor: PresenterToInteractorGalleryProtocol?, router: PresenterToRouterGalleryProtocol?) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}
