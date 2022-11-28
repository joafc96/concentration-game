//
//  ConcentrationCollectionViewCell.swift
//  concentration
//
//  Created by qbuser on 27/11/22.
//

import UIKit

class ConcentrationCollectionViewCell: UICollectionViewCell {
    
    
//    var cellIdentifier: UUID = UUID()
    
    private let frontImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.layer.cornerRadius = 8
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFill
        
        return imgView
    }()
    
    private let backImageView: UIImageView = {
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
        addSubview(backImageView)
        addSubview(frontImageView)
        
        sendSubviewToBack(frontImageView)
    }
    
    private func configureConstraints() {
        backImageView.fillInSuperView()
        frontImageView.fillInSuperView()

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    public func showCard(_ show: Bool, animated: Bool = true) {
        frontImageView.isHidden = false
        backImageView.isHidden = false
        if animated {
                  if show {
                      UIView.transition(
                          from: backImageView,
                          to: frontImageView,
                          duration: 0.3,
                          options: [.transitionFlipFromRight, .showHideTransitionViews],
                          completion: nil)
                  } else {
                      UIView.transition(
                          from: frontImageView,
                          to: backImageView,
                          duration: 0.3,
                          options: [.transitionFlipFromRight, .showHideTransitionViews],
                          completion:  nil)
                  }
              } else {
                  if show {
                      bringSubviewToFront(frontImageView)
                      backImageView.isHidden = true
                  } else {
                      bringSubviewToFront(backImageView)
                      frontImageView.isHidden = true
                  }
              }
        
    }
    
    public func configureCell(country: Country) {
            frontImageView.image = UIImage(named: country.path)
    }
    
}
