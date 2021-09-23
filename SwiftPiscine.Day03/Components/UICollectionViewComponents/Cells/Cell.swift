//
//  Cell.swift
//  SwiftPiscine.Day03
//
//  Created by out-nazarov2-ms on 19.09.2021.
//
//

import UIKit

class Cell: UICollectionViewCell, ModelRepresentable {
    weak var presenter: PresenterToCellGalleryProtocol?

    var model: CellIdentifiable? {
        didSet {
            updateViews()
        }
    }

    func updateViews() {}
}
