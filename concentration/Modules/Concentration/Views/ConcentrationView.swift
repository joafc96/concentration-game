//
//  ConcentrationView.swift
//  concentration
//
//  Created by qbuser on 26/11/22.
//

import UIKit

class ConcentrationView: UIView {
    // MARK: - UI Properties
    public var collectionView: UICollectionView = {
        
        // create a layout to be used
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        // make sure that there is a slightly larger gap at the top of each row
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        // set minimum line spacing
        layout.minimumLineSpacing = 1
        // set minimum inter item spacing
        layout.minimumInteritemSpacing = 1
        // set a standard item size of 3 by 3
        layout.itemSize = CGSize(
            width: (UIScreen.main.bounds.width / 3) - 3,
            height:(UIScreen.main.bounds.width / 3) - 3
           )
        // the layout scrolls vertically
        layout.scrollDirection = .vertical
        // set the frame and layout
        let clnView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
//        clnView.alwaysBounceVertical = true
        clnView.translatesAutoresizingMaskIntoConstraints = false
        clnView.register(ConcentrationCollectionViewCell.self, forCellWithReuseIdentifier: ConcentrationCollectionViewCell.nameOfClass)

        return clnView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        
        configureSubViews()
        configureConstraints()
    }
    
    private func configureSubViews() {
        addSubview(collectionView)
    }
    
    private func configureConstraints() {
        collectionView.fillInSuperView()
    }
}
