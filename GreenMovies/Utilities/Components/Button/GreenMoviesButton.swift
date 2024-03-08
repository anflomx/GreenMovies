//
//  GreenMoviesButton.swift
//  GreenMovies
//
//  Created by Antonio Flores on 07/03/24.
//

import UIKit

@IBDesignable
class GreenMoviesButton: UIButton {

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
        self.backgroundColor = Theme.buttonColor
        self.titleLabel?.font = UIFont(name: Theme.mainFont, size: 18)
        self.setTitleColor(UIColor.white, for: .normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
}
