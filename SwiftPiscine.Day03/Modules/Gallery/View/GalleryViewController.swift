//
//  GalleryViewController.swift
//  SwiftPiscine.Day03
//
//  Created by out-nazarov2-ms on 19.09.2021.
//  
//

import UIKit

class GalleryViewController: UIViewController {

    // MARK: - Properties
    var presenter: ViewToPresenterGalleryProtocol?

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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
}
