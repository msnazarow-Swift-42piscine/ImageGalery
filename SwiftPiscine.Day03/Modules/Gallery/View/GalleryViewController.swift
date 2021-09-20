//
//  GalleryViewController.swift
//  SwiftPiscine.Day03
//
//  Created by out-nazarov2-ms on 19.09.2021.
//  
//

import UIKit

class GalleryViewController: UICollectionViewController {

    // MARK: - Properties
    var presenter: ViewToPresenterGalleryProtocol?

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        guard let presenter = presenter else {
            print("GalleryViewController Assemble Error")
            return
        }
        super.viewDidLoad()
        collectionView.dataSource = presenter.dataSource
        collectionView.delegate = self
        collectionView.register(ImageViewCell.self, forCellWithReuseIdentifier: String(describing: ImageViewCell.self))
        collectionView.backgroundColor = .white
        collectionView.alwaysBounceVertical = true
        setupUI()
        presenter.viewDidLoad()
    }

    private func setupUI() {
        addSubviews()
        setupConstraints()
    }

    private func addSubviews() {

    }

    private func setupConstraints() {

    }
}

extension GalleryViewController: PresenterToViewGalleryProtocol{
    // TODO: Implement View Output Methods
    func reloadCollectionViewData() {
        collectionView.reloadData()
    }
}
extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCellsInRow = 2
        let flowlayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowlayout.sectionInset.left + flowlayout.sectionInset.right + (flowlayout.minimumInteritemSpacing * CGFloat(numberOfCellsInRow - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(numberOfCellsInRow))
        return CGSize(width: size, height: size)
    }
}
