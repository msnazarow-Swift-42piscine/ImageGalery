//
//  ImageScreenContract.swift
//  SwiftPiscine.Day03
//
//  Created by out-nazarov2-ms on 20.09.2021.
//  
//

import UIKit


// MARK: View Output (Presenter -> View)
protocol PresenterToViewImageScreenProtocol: AnyObject {
    func setImage(for image: UIImage)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterImageScreenProtocol: AnyObject {
    func viewDidLoad()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorImageScreenProtocol: AnyObject {

}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterImageScreenProtocol: AnyObject {
    
}

// MARK: Router Input (Presenter -> DataSource)
protocol PresenterToDataSourceImageScreenProtocol: UITableViewDataSource {
    func updateForSections(_ sections: [SectionModel])
}

// MARK: Router Input (Presenter -> Cell)
protocol PresenterToCellImageScreenProtocol: AnyObject {

}
