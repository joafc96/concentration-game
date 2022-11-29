//
//  ConcentrationVC.swift
//  concentration
//
//  Created by qbuser on 26/11/22.
//

import UIKit

class ConcentrationVC: UIViewController {
    // MARK: - Dependencies
    private var viewModel: ConcentrationViewModelProtocol
    
    // MARK: - Stored Properties
    private let concentrationView: ConcentrationView = ConcentrationView(frame: UIScreen.main.bounds)
    private let collectionViewProvider: ConcentrationCollectionProvider = ConcentrationCollectionProvider()
    
    // MARK: - Lifecycle
    init(viewModel: ConcentrationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = concentrationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        viewModel.startGame()
        configureCollectionViewDelegates()
    }
    
    deinit {
        print("ConcentrationVC deinit")
    }
}

// MARK: - UI Configurations
extension ConcentrationVC {
    private func configureCollectionViewDelegates() {
        collectionViewProvider.delegate = self
        
        concentrationView.collectionView.dataSource = collectionViewProvider
        concentrationView.collectionView.delegate = collectionViewProvider
    }
}

// MARK: - CollectionView Provider Delegates
extension ConcentrationVC: ConcentrationCollectionProviderDelegate {
    func didSelectCard(_ provider: ConcentrationCollectionProvider, withIndex index: Int) {
        viewModel.userTappedCard(ofIndex: index)
    }
}

// MARK: - Concentration Game Delegates
extension ConcentrationVC: ConcentrationGameProtocol {
    func concentrationGameDidStart(_ game: ConcentrationViewModel) {
        collectionViewProvider.cards = viewModel.cards
        collectionViewProvider.associatedCountries = viewModel.associatedCardCountries
        concentrationView.collectionView.reloadData()
    }
    
    func concentrationGame(_ game: ConcentrationViewModel, showCards cardIndices: [Int]) {
        for index in cardIndices {
            let cell = concentrationView.collectionView.cellForItem(at: IndexPath(item: index, section:0)) as! ConcentrationCollectionViewCell
            let card = viewModel.cards[index]
            let country = viewModel.associatedCardCountries[card.identifier]
            cell.showCard(true, with: UIImage(named: country?.path ?? "cardBack.png"))
        }
    }
    
    func concentrationGame(_ game: ConcentrationViewModel, hideCards cardIndices: [Int]) {
        for index in cardIndices {
            let cell = concentrationView.collectionView.cellForItem(at: IndexPath(item: index, section:0)) as! ConcentrationCollectionViewCell
            cell.showCard(false, with: UIImage(named: "cardBack.png"))
        }
    }
    
    func concentrationGameDidEnd(_ game: ConcentrationViewModel) {
        
    }
}
