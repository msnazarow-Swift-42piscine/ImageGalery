//
//  GalleryPresenter.swift
//  SwiftPiscine.Day03
//
//  Created by out-nazarov2-ms on 19.09.2021.
//  
//

import UIKit

class GalleryPresenter: ViewToPresenterGalleryProtocol {

    // MARK: Properties
    weak var view: PresenterToViewGalleryProtocol?
    let interactor: PresenterToInteractorGalleryProtocol?
    let router: PresenterToRouterGalleryProtocol?
    let dataSource: PresenterToDataSourceGalleryProtocol?

    let imagesURLs = [
        "https://www.nasa.gov/sites/default/files/thumbnails/image/curiosity_selfie.jpg",
        "https://apod.nasa.gov/apod/image/2109/LDN1251Gualco.jpg",
        "https://eoimages.gsfc.nasa.gov/images/imagerecords/148000/148833/nicholas_geo5_2021257_lrg.jpg",
        "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/pia24478.jpeg"
    ]

    // MARK: Init
    init(view: PresenterToViewGalleryProtocol,
         interactor: PresenterToInteractorGalleryProtocol?,
         router: PresenterToRouterGalleryProtocol?,
         dataSource: PresenterToDataSourceGalleryProtocol?) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.dataSource = dataSource
    }

    func viewDidLoad() {
        var sections: [SectionModel] = []
        var models: [Model] = []
        (0 ..< imagesURLs.count).forEach{ models.append(Model(id: $0))}
        sections.append(SectionModel(models))
        dataSource?.updateForSections(sections)
    }
}

extension GalleryPresenter: PresenterToCellGalleryProtocol {
    func getImage(for id: Int, complition: @escaping (UIImage?) -> Void) {
        if let image = interactor?.getImage(for: id) {
            complition(image)
        } else {
            interactor?.downloadImage(for: imagesURLs[id]) { image in
                complition(image)
            }
        }
    }

    func updateItem(for id: Int) {
        view?.reloatCollectionViewItems(at: [IndexPath(item: id, section: 0)])
    }
}
