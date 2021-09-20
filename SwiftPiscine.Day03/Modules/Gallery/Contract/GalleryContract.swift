//
//  GalleryContract.swift
//  SwiftPiscine.Day03
//
//  Created by out-nazarov2-ms on 19.09.2021.
//  
//

import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewGalleryProtocol: AnyObject {
    func reloadCollectionViewData()
    func reloatCollectionViewItems(at indexPath: [IndexPath])
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterGalleryProtocol: AnyObject {
    var dataSource: PresenterToDataSourceGalleryProtocol? { get }

    func viewDidLoad()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorGalleryProtocol: AnyObject {
    func getImage(for id: Int) -> UIImage?
    func saveImages(images: [UIImage])
    func downloadImages(for urls: [String], complition: @escaping ([UIImage]) -> Void)
    func downloadImage(for url: String, complition: @escaping (UIImage?) -> Void)
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterGalleryProtocol: AnyObject {
    
}

// MARK: Router Input (Presenter -> DataSource)
protocol PresenterToDataSourceGalleryProtocol: UICollectionViewDataSource & UICollectionViewDelegateFlowLayout {
    func updateForSections(_ sections: [SectionModel])
}

// MARK: Router Input (Presenter -> Cell)
protocol PresenterToCellGalleryProtocol: AnyObject {
    func getImage(for id: Int, complition: @escaping (UIImage?) -> Void)
    func updateItem(for id: Int)
}
