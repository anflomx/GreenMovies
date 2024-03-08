//
//  DetailViewController.swift
//  GreenMovies
//
//  Created by Antonio Flores on 07/03/24.
//

import UIKit

final class DetailViewController: UIViewController {
    private var movieViewModel: MovieViewModel
    
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
        
        view.addSubview(posterImageView)
        posterImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                               width: 125,
                               height: 250,
                               centerX: view.centerXAnchor)
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, releaseDateLabel, descriptionLabel, ratingLabel])
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .fill
        
        view.addSubview(stackView)
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
        view.addSubview(opinionButton)
        opinionButton.anchor(top: stackView.bottomAnchor, paddingTop: 10, width: 150, height: 60, centerX: view.centerXAnchor)
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
