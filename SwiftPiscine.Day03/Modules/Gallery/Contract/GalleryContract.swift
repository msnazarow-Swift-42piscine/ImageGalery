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
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterGalleryProtocol: AnyObject {

}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorGalleryProtocol: AnyObject {

}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterGalleryProtocol: AnyObject {
    
}

// MARK: Router Input (Presenter -> DataSource)
protocol PresenterToDataSourceGalleryProtocol: UITableViewDataSource {
    func updateForSections(_ sections: [SectionModel])
}

// MARK: Router Input (Presenter -> Cell)
protocol PresenterToCellGalleryProtocol: AnyObject {

}
