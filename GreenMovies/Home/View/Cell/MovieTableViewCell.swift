//
//  MovieTableViewCell.swift
//  GreenMovies
//
//  Created by Antonio Flores on 06/03/24.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieReleaseDateLabel: UILabel!
    
    public var movieViewModel: MovieViewModel? {
        didSet {
            setup()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setup() {
        guard let movieViewModel = movieViewModel else { return }
        movieTitleLabel.attributedText = movieViewModel.title
        movieReleaseDateLabel.attributedText = movieViewModel.releaseDate
        movieImage.load(url: movieViewModel.url)
    }
}
