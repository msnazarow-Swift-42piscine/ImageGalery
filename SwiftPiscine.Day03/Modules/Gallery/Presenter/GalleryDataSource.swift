//
//  GalleryDataSource.swift
//  SwiftPiscine.Day03
//
//  Created by out-nazarov2-ms on 19.09.2021.
//  
//

import UIKit

class GalleryPresenterDataSource: NSObject, PresenterToDataSourceGalleryProtocol {
    // MARK: Properties
    weak var presenter: PresenterToCellGalleryProtocol?

    private var sections: [SectionModel] = [SectionModel([Model(id: 0), Model(id: 1), Model(id: 2), Model(id: 3)])]

    func updateForSections(_ sections: [SectionModel]) {
        self.sections = sections
    }

    func numberOfSections(in _: UICollectionView) -> Int {
        return sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].rows.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = sections[indexPath.section].rows[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: model.cellIdentifier, for: indexPath) as? Cell else {
            return UICollectionViewCell()
        }
        cell.presenter = presenter
        cell.model = model
        return cell
    }
}
