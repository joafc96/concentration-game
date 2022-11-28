//
//  ConcentrationCollectionViewCell.swift
//  concentration
//
//  Created by qbuser on 27/11/22.
//

import UIKit

class ConcentrationCollectionViewCell: UICollectionViewCell {
    private let cardImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.layer.cornerRadius = 8
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFill
        imgView.backgroundColor = .label
        imgView.image = UIImage(named: "cardBack.png")

        return imgView
    }()
    
    
//    private lazy var cardButton: UIButton = {
//        let btn = UIButton()
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.layer.cornerRadius = 8
//        btn.layer.masksToBounds = true
//        btn.backgroundColor = .label
//        btn.setTitle("", for: .normal)
//        return btn
//    }()
    
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
//        addSubview(cardButton)
    }
    
    private func configureConstraints() {
        cardImageView.fillInSuperView()
//        cardButton.fillInSuperView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
        
    public func showCard(_ show: Bool, with image: UIImage?) {
        if show {
            cardImageView.image = image
//            cardButton.setTitle("😇", for: .normal)
//            cardButton.backgroundColor = .systemGreen
        
            UIView.transition(with: cardImageView,
                              duration: 0.4,
                              options: .transitionFlipFromLeft,
                              animations: nil,
                              completion: nil)
        } else {
            cardImageView.image = image
//            cardButton.backgroundColor = .label
//            cardButton.setTitle("", for: .normal)
            UIView.transition(with: cardImageView,
                              duration: 0.4,
                              options: .transitionFlipFromRight,
                              animations: nil,
                              completion: nil)
        }
    }
}
