//
//  DetailViewController.swift
//  GreenMovies
//
//  Created by Antonio Flores on 07/03/24.
//

import UIKit

final class DetailViewController: UIViewController {
    private var movieViewModel: MovieViewModel
    
    private let scroll: UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let posterImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.adjustsImageSizeForAccessibilityContentSizeCategory = true
        return image
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    private let opinionButton: GreenMoviesButton = {
        let button = GreenMoviesButton()
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    init(movieViewModel: MovieViewModel) {
        self.movieViewModel = movieViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        view.backgroundColor = Theme.mainBackgroundColor
        
        view.addSubview(scroll)
        scroll.anchor(top: view.topAnchor,
                      left: view.leftAnchor,
                      bottom: view.bottomAnchor,
                      right: view.rightAnchor)
        
        scroll.addSubview(posterImageView)
        posterImageView.anchor(top: scroll.topAnchor,
                               width: 125,
                               height: 250,
                               centerX: scroll.centerXAnchor)
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, releaseDateLabel, descriptionLabel, ratingLabel])
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .fill
        scroll.addSubview(stackView)
        stackView.anchor(top: posterImageView.bottomAnchor,
                                left: view.leftAnchor,
                                right: view.rightAnchor,
                         paddingTop: 10, paddingLeft: 15, paddingRight: 15)
        
        titleLabel.attributedText = movieViewModel.title
        releaseDateLabel.attributedText = movieViewModel.releaseDate
        posterImageView.load(url: movieViewModel.url)
        descriptionLabel.attributedText = movieViewModel.description
        ratingLabel.attributedText = movieViewModel.rating
        
        opinionButton.setTitle("Your Opinion", for: .normal)
        scroll.addSubview(opinionButton)
        opinionButton.anchor(top: stackView.bottomAnchor,
                             bottom: scroll.bottomAnchor,
                             paddingTop: 10,
                             width: 150,
                             height: 60,
                             centerX: scroll.centerXAnchor)
        opinionButton.addTarget(self, action: #selector(pressedAction(_:)), for: .touchUpInside)
    }
    
    @objc
    func pressedAction(_ sender: UIButton) {
        let vc = OpinionViewController()
        vc.modalPresentationStyle = .overCurrentContext
        vc.delegate = self
        self.present(vc, animated: false)
    }
}

extension DetailViewController: OpinionViewControllerDelegate {
    func showToastMessage() {
        self.showToast(message: "Opinion added, Thanks!")
    }
}
