//
//  ConcentrationCollectionProvider.swift
//  concentration
//
//  Created by qbuser on 27/11/22.
//

import UIKit

protocol ConcentrationCollectionProviderDelegate: AnyObject {
    func didSelectCard(_ provider: ConcentrationCollectionProvider, card: Card)
}

final class ConcentrationCollectionProvider: NSObject {
    var cards: [Card] = []
    weak var delegate: ConcentrationCollectionProviderDelegate?
    
    deinit {
        print("ConcentrationCollectionProvider deinit")
    }
    
    func cardForRow(at indexPath: IndexPath) -> Card {
        return cards[indexPath.row]
    }
}

// MARK: - UICollectionViewDataSource
extension ConcentrationCollectionProvider: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cardCell(with: collectionView, indexPath: indexPath)
        return cell
    }
    
    func cardCell(with collectionView: UICollectionView, indexPath: IndexPath) -> ConcentrationCollectionViewCell {
        let cell: ConcentrationCollectionViewCell = collectionView.dequeueReusableCellForIndexPath(indexPath)
        let card = cardForRow(at: indexPath)
        cell.configureCell(withCard: card)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension ConcentrationCollectionProvider: UICollectionViewDelegate {
    
    
}
