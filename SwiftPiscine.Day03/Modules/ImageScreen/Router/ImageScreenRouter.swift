//
//  ImageScreenRouter.swift
//  SwiftPiscine.Day03
//
//  Created by out-nazarov2-ms on 20.09.2021.
//  
//

import UIKit

class ImageScreenRouter: PresenterToRouterImageScreenProtocol {

    // MARK: - Properties
    weak var view: UIViewController?

    // MARK: - Init
    init(view: UIViewController) {
        self.view = view
    }
    
}
