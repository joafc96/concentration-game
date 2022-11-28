//
//  ConcentrationView.swift
//  concentration
//
//  Created by qbuser on 26/11/22.
//

import UIKit

class ConcentrationView: UIView {
    fileprivate let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 20.0, right: 20.0)
    
    // MARK: - UI Properties
    public lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = sectionInsets
//        layout.minimumLineSpacing = sectionInsets.left
//        layout.minimumInteritemSpacing = sectionInsets.left
        
        let paddingSpace = Int(sectionInsets.left) * 4
        let availableWidth = Int(UIScreen.main.bounds.width) - paddingSpace
        let widthPerItem = availableWidth / 4
        
        layout.itemSize = CGSize(
            width: widthPerItem,
            height: widthPerItem
        )
        layout.scrollDirection = .vertical
        
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
