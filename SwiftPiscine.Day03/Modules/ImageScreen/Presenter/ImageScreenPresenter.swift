//
//  ImageScreenPresenter.swift
//  SwiftPiscine.Day03
//
//  Created by out-nazarov2-ms on 20.09.2021.
//
//

import Foundation

class ImageScreenPresenter: ViewToPresenterImageScreenProtocol {
    // MARK: Properties

    weak var view: PresenterToViewImageScreenProtocol?
    let interactor: PresenterToInteractorImageScreenProtocol?
    let router: PresenterToRouterImageScreenProtocol?
    let imageService: ImageServiceProtocol?
    let imageId: Int?

    // MARK: Init

    init(view: PresenterToViewImageScreenProtocol, interactor: PresenterToInteractorImageScreenProtocol?, router: PresenterToRouterImageScreenProtocol?, imageService: ImageServiceProtocol?, imageId: Int?) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.imageService = imageService
        self.imageId = imageId
    }

    func viewDidLoad() {
        if let imageId = imageId, let image = imageService?.getImage(for: imageId) {
            view?.setImage(for: image)
        }
    }
}
