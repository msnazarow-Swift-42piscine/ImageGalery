//
//  ImageViewCell.swift
//  SwiftPiscine.Day03
//
//  Created by out-nazarov2-ms on 20.09.2021.
//

import UIKit
let imagesURLs = [
    "https://www.nasa.gov/sites/default/files/thumbnails/image/curiosity_selfie.jpg",
    "https://apod.nasa.gov/apod/image/2109/LDN1251Gualco.jpg",
    "https://eoimages.gsfc.nasa.gov/images/imagerecords/148000/148833/nicholas_geo5_2021257_lrg.jpg",
    "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/pia24478.jpeg"
]
class ImageViewCell: Cell {
    static let identifier = "ImageViewCell"
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.color = .white
        return indicator
    }()

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(activityIndicator)
        contentView.backgroundColor = .black
        activityIndicator.startAnimating()
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        print("I AM WORKING")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateViews() {

        guard let model = model as? CellModel,
              let url = URL(string: imagesURLs[model.id]),
              imageView.image == nil
        else {
            return
        }
        presenter?.getImage(for: model.id) { image in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.imageView.image = image
//                self.presenter?.updateItem(for: model.id)
            }
        }

    }
}
