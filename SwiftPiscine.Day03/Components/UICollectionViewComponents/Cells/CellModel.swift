//
//  CellModel.swift
//  SwiftPiscine.Day03
//
//  Created by out-nazarov2-ms on 20.09.2021.
//

import Foundation

struct Model {
    let id: Int
}

struct CellModel: CellIdentifiable {

    var cellIdentifier: String { return "ImageViewCell" }
    let id: Int

    init(_ property: Model) {
        self.id = property.id
    }
}
