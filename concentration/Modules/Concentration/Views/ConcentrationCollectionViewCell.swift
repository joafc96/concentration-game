//
//  ConcentrationCollectionViewCell.swift
//  concentration
//
//  Created by qbuser on 27/11/22.
//

import UIKit

class ConcentrationCollectionViewCell: UICollectionViewCell {
    public let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.layer.cornerRadius = 8
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFill
        imgView.backgroundColor = .label
        
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
        addSubview(imageView)
    }
    
    private func configureConstraints() {
        
        imageView.fillInSuperView()
        
//        mainStackView.centerYInSuperview()
//        mainStackView.constraintHeight(constant: 140)
//
//        let mainStackViewConstraints = [
//            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
//            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
//        ]
//
//        let detailsStackViewConstraints = [
//            detailsStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
//            detailsStackView.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor),
//        ]
//
//        posterImage.constraintWidth(constant: 100)
//        posterImage.constraintHeight(constant: 140)
//
//        NSLayoutConstraint.activate(detailsStackViewConstraints)
//        NSLayoutConstraint.activate(mainStackViewConstraints)
    }

    public func configureCell(withCard card: Card) {
//        titleLabel.text = movie.title
//        overViewLabel.text = movie.overview
//        guard let posterPath = movie.posterPath else { return }
//        guard let imageUrl = Endpoint.posterImage(path: posterPath, quality: ImageQuality.posterMedium.rawValue).imageUrl else { return }
//        posterImage.set(for: imageUrl)
        
        if(card.isFaceUp) {
            imageView.image = UIImage(named: "america.jpg")
            
        }
    }
    
}
