//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
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
