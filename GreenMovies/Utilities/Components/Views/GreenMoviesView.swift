//
//  GreenMoviesView.swift
//  GreenMovies
//
//  Created by Antonio Flores on 07/03/24.
//

import UIKit

@IBDesignable
class GreenMoviesView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI() {
        self.layer.cornerRadius = 15
        self.backgroundColor = Theme.mainBackgroundColor
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
}
