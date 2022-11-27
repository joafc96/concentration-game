//
//  ConcentrationVC.swift
//  concentration
//
//  Created by qbuser on 26/11/22.
//

import UIKit

class ConcentrationVC: UIViewController, ConcentrationCollectionProviderDelegate {

    // MARK: - Dependencies
    private let viewModel: ConcentrationViewModel
    private let concentrationView: ConcentrationView
    private let collectionViewProvider: ConcentrationCollectionProvider = ConcentrationCollectionProvider()
    
    // MARK: - Lifecycle
    init(viewModel: ConcentrationViewModel, concentrationView: ConcentrationView = ConcentrationView(frame: UIScreen.main.bounds)) {
        self.viewModel = viewModel
        self.concentrationView  =  concentrationView
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
        configureBindables()
        configureCollectionViewDelegates()
    }
}

// MARK: - Reactive Behaviour
extension ConcentrationVC {
    private func configureBindables() {
        viewModel.viewState.bind(listener: { [weak self] (viewState: Viewstate) in
            guard let strongSelf = self else { return }
            
            switch viewState {
            case .initial:
                break
            case .loading:
                break
            case .loaded:
                strongSelf.collectionViewProvider.cards = strongSelf.viewModel.cards
                strongSelf.concentrationView.collectionView.reloadData()
                print(viewState)
            case .error:
                break
            }
        })
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
extension ConcentrationVC {
    func didSelectCard(_ provider: ConcentrationCollectionProvider, card: Card) {
        print(card)
    }
}
