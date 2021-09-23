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

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: UIScreen.main.bounds)
        scrollView.delegate = self
        scrollView.bounces = false
        scrollView.backgroundColor = .white
        return scrollView
    }()

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Lifecycle Methods

    override func loadView() {
        view = scrollView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }

    override func viewWillTransition(to size: CGSize, with _: UIViewControllerTransitionCoordinator) {
        updateMinZoomScaleForSize(size)
    }

    private func updateMinZoomScaleForSize(_ size: CGSize) {
        guard let image = imageView.image else { return }
        let widthScale = size.width / imageView.bounds.width
        scrollView.contentSize = image.size
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

    private func setupConstraints() {}
}

extension ImageScreenViewController: UIScrollViewDelegate {
    func viewForZooming(in _: UIScrollView) -> UIView? {
        imageView
    }
}

extension ImageScreenViewController: PresenterToViewImageScreenProtocol {
    func setImage(for image: UIImage) {
        imageView.image = image
        imageView.frame = CGRect(origin: CGPoint(), size: image.size)
        scrollView.contentSize = image.size
        updateMinZoomScaleForSize(scrollView.bounds.size)
    }
}
