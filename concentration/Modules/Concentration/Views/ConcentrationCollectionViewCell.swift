//
//  ConcentrationCollectionViewCell.swift
//  concentration
//
//  Created by joe on 27/11/22.
//

import UIKit

class ConcentrationCollectionViewCell: UICollectionViewCell {
    
    let currentTheme = ThemeManager.shared.getCurrentTheme()

    private lazy var cardImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.layer.cornerRadius = 8
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFill
        
        return imgView
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Configurations
    private func configureSubViews() {
        addSubview(cardImageView)
    }
    
    private func configureConstraints() {
        cardImageView.fillInSuperView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
        
    func showCard(_ show: Bool, with image: UIImage?) {
        if show {
            cardImageView.image = image
            UIView.transition(with: cardImageView,
                              duration: Constants.flipDelayDuration,
                              options: .transitionFlipFromLeft,
                              animations: nil,
                              completion: nil)
        } else {
            cardImageView.image = nil
            cardImageView.backgroundColor = currentTheme.accentColor
            UIView.transition(with: cardImageView,
                              duration: Constants.flipDelayDuration,
                              options: .transitionFlipFromRight,
                              animations: nil,
                              completion: nil)
        }
    }
    
    func configureCell() {
        cardImageView.image = nil
        cardImageView.backgroundColor = currentTheme.accentColor
    }
}
