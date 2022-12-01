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
    
    func configureCell(of indexPath:IndexPath) {
        configureCardFront()
        cardView.alpha = 0
        let duration = Double(indexPath.row) * 0.1
        cardView.fadeIn(with: duration)
    }
        
    func showCard(_ show: Bool, with emoji: String?) {
        if show {
            configureCardBack(with: emoji)
            UIView.transition(with: cardView,
                              duration: Constants.flipDelayDuration,
                              options: .transitionFlipFromLeft,
                              animations: nil,
                              completion: nil)
        } else {
            configureCardFront()
            UIView.transition(with: cardView,
                              duration: Constants.flipDelayDuration,
                              options: .transitionFlipFromRight,
                              animations: nil,
                              completion: nil)
        }
    }
    
    private func configureCardBack(with emoji: String?) {
        cardView.emojiLabel.text = emoji
        cardView.backgroundColor = currentTheme.secondaryColor
    }
    
    private func configureCardFront() {
        cardView.emojiLabel.text = nil
        cardView.backgroundColor = currentTheme.accentColor
    }
}
