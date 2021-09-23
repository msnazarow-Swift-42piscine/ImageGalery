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
        setupUI()
        presenter.viewDidLoad()
    }

    private func setupUI() {
        addSubviews()
        setupConstraints()
        title = "Images"
        collectionView.dataSource = presenter?.dataSource
        collectionView.delegate = self
        collectionView.register(ImageViewCell.self, forCellWithReuseIdentifier: String(describing: ImageViewCell.self))
        collectionView.backgroundColor = .white
    }

    private func addSubviews() {}

    private func setupConstraints() {}
}

extension GalleryViewController: PresenterToViewGalleryProtocol {
    func reloadCollectionViewData() {
        collectionView.reloadData()
    }

    func reloadCollectionViewItems(at indexPath: [IndexPath]) {
        collectionView.reloadItems(at: indexPath)
    }

    // TODO: Не работает если ошибок больше чем одна
    func showAlert(with url: String) {
        let alert = UIAlertController(title: "Error", message: "Cannot access to \(url)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        guard let flowlayout = collectionViewLayout as? UICollectionViewFlowLayout else { return CGSize.zero }
        let numberOfCellsInRow = 2
        let totalSpace = flowlayout.sectionInset.left +
                         flowlayout.sectionInset.right +
                         (flowlayout.minimumInteritemSpacing * CGFloat(numberOfCellsInRow - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(numberOfCellsInRow))
        return CGSize(width: size, height: size)
    }

    override func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectItemAt(indexPath)
    }
}
