//
//  ConcentrationView.swift
//  concentration
//
//  Created by joe on 26/11/22.
//

import UIKit

class ConcentrationView: UIView {
    fileprivate let sectionInsets = UIEdgeInsets(top: 8.0, left: 16.0, bottom: 8.0, right: 16.0)
    
    let currentTheme = ThemeManager.shared.getCurrentTheme()
    
    // MARK: - UI Properties
    lazy var collectionView: UICollectionView = {
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = sectionInsets
        flowLayout.minimumLineSpacing = sectionInsets.left
        flowLayout.minimumInteritemSpacing = sectionInsets.left
        
        let paddingSpace = Int(sectionInsets.left) * 5
        let availableWidth = Int(UIScreen.main.bounds.width) - paddingSpace
        let widthPerItem = availableWidth / 4
        
        flowLayout.itemSize = CGSize(
            width: widthPerItem,
            height: widthPerItem
        )
        let clnView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowLayout
        )
        clnView.translatesAutoresizingMaskIntoConstraints = false
        clnView.register(ConcentrationCollectionViewCell.self, forCellWithReuseIdentifier: ConcentrationCollectionViewCell.nameOfClass)
        
        clnView.backgroundColor = currentTheme.backgroundColor
        
        return clnView
    }()
    
    
    lazy var flipCountLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = currentTheme.accentColor
        lbl.font = FontHelper.Default.extraLargeRegular
        lbl.textAlignment = .left
        lbl.text = "Flips: 0"
        //lbl.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        return lbl
    }()
    
    lazy var currentScoreLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = currentTheme.accentColor
        lbl.font = FontHelper.Default.extraLargeRegular
        lbl.textAlignment = .left
        lbl.text = "Score: 0"
        //lbl.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        return lbl
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
//      stackView.backgroundColor = .blue
        
        return stackView
    }()
    
    lazy var newGameButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.contentInsets = .init(top: 8, leading: 16, bottom: 8, trailing: 16)
        configuration.baseForegroundColor = currentTheme.accentColor
        configuration.baseBackgroundColor = currentTheme.secondaryColor
//        configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
//          var outgoing = incoming
//          outgoing.font = FontHelper.Default.largeRegular
//          return outgoing
//         }
//      configuration.cornerStyle = .medium
        configuration.background.cornerRadius = 8
//     configuration.buttonSize = .large
        
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("NEW GAME", for: .normal)
        btn.layer.cornerRadius = 8
        btn.configuration = configuration
//        btn.titleLabel?.font = FontHelper.Default.largeRegular
//        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        /*
         https://stackoverflow.com/questions/17666907/auto-layout-invalid-after-presenting-view-controller-and-many-situation
         
         I was setting translatesAutoresizingMaskIntoConstraints = NO; on my root UIView. It appears the "outermost" UIView - the superview at the root of your hierarchy must use the default translatesAutoresizingMaskIntoConstraints = YES. Once I've removed this, everything worked as expected.
         
         If you use auto layout between the UIWindow and your root view (to set the root view to fill the entire UIWindow) these constraints will get blown away by a full screen presentation of another view controller.
         
         What happens, is the entire hierarchy of the full-screen presentation replaces everything below UIWindow - your original view is removed (blowing away the constraints) and the new view hierarchy substituted. Then when your review is replaced, these constraints are lost. You would need to recreate them somewhere like viewWillAppear: or just ensure your root view has self.view.translatesAutoresizingMaskIntoConstraints = NO;
         
         Never set translatesAutoresizingMaskIntoConstraints as false in root UIView
         */
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        backgroundColor = currentTheme.backgroundColor
        
        configureSubViews()
        configureConstraints()
    }
    
    private func configureSubViews() {
        addSubview(labelStackView)
        addSubview(collectionView)
        addSubview(newGameButton)
        
        labelStackView.addArrangedSubview(flipCountLabel)
        labelStackView.addArrangedSubview(currentScoreLabel)
    }
    
    private func configureConstraints() {
        let lblStkViewConstraints = [
            // Vertical
            labelStackView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            
            // Horizontal
            labelStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ]
        
        let clnViewConstraints = [
            // Vertical
            collectionView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7),
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            
            // Horizontal
            collectionView.leadingAnchor.constraint(equalTo:  leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.widthAnchor.constraint(equalTo: widthAnchor),
            
        ]
        
        let newGameBtnConstraints = [
            // Vertical
            newGameButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            
            // Horizontal
            newGameButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(lblStkViewConstraints)
        NSLayoutConstraint.activate(clnViewConstraints)
        NSLayoutConstraint.activate(newGameBtnConstraints)
    }
}
