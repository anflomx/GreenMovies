//
//  OpinionViewController.swift
//  GreenMovies
//
//  Created by Antonio Flores on 07/03/24.
//

import UIKit

protocol OpinionViewControllerDelegate: AnyObject {
    func showToastMessage()
}

class OpinionViewController: UIViewController {
    @IBOutlet weak var addButton: GreenMoviesButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var opinionTextView: UITextView!
    
    weak var delegate: OpinionViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        addButton.setTitle("Add", for: .normal)
        addButton.addTarget(self, action: #selector(pressedAddButton(_:)), for: .touchUpInside)
        
        closeButton.configuration?.baseForegroundColor = Theme.mainBackgroundColor
        closeButton.contentMode = .scaleAspectFill
        closeButton.addTarget(self, action: #selector(pressedCloseButton(_:)), for: .touchUpInside)
    }
    
    @objc
    func pressedAddButton(_ sender: UIButton) {
        if opinionTextView.text.count > 0 {
            self.dismiss(animated: false)
            delegate?.showToastMessage()
            return
        }
        self.showToast(message: "Add Some Text! :)")
    }
    
    @objc
    func pressedCloseButton(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
}
