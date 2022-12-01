//
//  ConcentrationCollectionViewCell.swift
//  concentration
//
//  Created by joe on 27/11/22.
//

import UIKit

class ConcentrationCollectionViewCell: UICollectionViewCell {
    
    let currentTheme = ThemeManager.shared.getCurrentTheme()

    private lazy var cardView: CardView = {
        let cardView = CardView()
                
        return cardView
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
        addSubview(cardView)
    }
    
    private func configureConstraints() {
        cardView.fillInSuperView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
        
    func showCard(_ show: Bool, with emoji: String?) {
        if show {
            cardView.emojiLabel.text = emoji
            cardView.backgroundColor = currentTheme.secondaryColor
            UIView.transition(with: cardView,
                              duration: Constants.flipDelayDuration,
                              options: .transitionFlipFromLeft,
                              animations: nil,
                              completion: nil)
        } else {
            cardView.emojiLabel.text = nil
            cardView.backgroundColor = currentTheme.accentColor
            UIView.transition(with: cardView,
                              duration: Constants.flipDelayDuration,
                              options: .transitionFlipFromRight,
                              animations: nil,
                              completion: nil)
        }
    }
    
    func configureCell() {
        cardView.backgroundColor = currentTheme.accentColor
        cardView.emojiLabel.text = nil
    }
}
