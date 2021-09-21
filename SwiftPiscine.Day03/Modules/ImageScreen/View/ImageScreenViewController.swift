//
//  ImageScreenViewController.swift
//  SwiftPiscine.Day03
//
//  Created by out-nazarov2-ms on 20.09.2021.
//  
//

import UIKit

class ImageScreenViewController: UIViewController {

    // MARK: - Properties
    var presenter: ViewToPresenterImageScreenProtocol?
    let scrollView = UIScrollView(frame: UIScreen.main.bounds)

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func loadView() {
        scrollView.backgroundColor = .green
        scrollView.delegate = self
        scrollView.bounces = false
        self.view = scrollView
    }

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        updateMinZoomScaleForSize(size)
    }

    private func updateMinZoomScaleForSize(_ size: CGSize) {

        let widthScale = size.width / imageView.bounds.width
        scrollView.contentSize = imageView.image!.size
        scrollView.minimumZoomScale = widthScale
        scrollView.maximumZoomScale = max(2, widthScale)
        scrollView.zoomScale = widthScale
    }

    private func setupUI() {
        addSubviews()
        setupConstraints()
    }

    private func addSubviews() {
        view.addSubview(imageView)
    }

    private func setupConstraints() {
//        NSLayoutConstraint.activate([
//            imageView.topAnchor.constraint(equalTo: view.topAnchor),
//            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
    }
}

extension ImageScreenViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
}

extension ImageScreenViewController: PresenterToViewImageScreenProtocol{
    func setImage(for image: UIImage) {
        self.imageView.image = image
        imageView.frame = CGRect(origin: CGPoint(), size: image.size)
        scrollView.contentSize = image.size
        updateMinZoomScaleForSize(scrollView.bounds.size)
    }
}
