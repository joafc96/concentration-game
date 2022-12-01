//
//  ConcentrationCollectionProvider.swift
//  concentration
//
//  Created by joe on 27/11/22.
//

import UIKit

protocol ConcentrationCollectionProviderDelegate: AnyObject {
    func didSelectCard(_ provider: ConcentrationCollectionProvider, withIndex index: Int)
}

final class ConcentrationCollectionProvider: NSObject {
    var cards = [Card]()
    var associatedEmjois = [Int: String]()
    
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
        cell.configureCell(of: indexPath)
        return cell
    }
    
    func cardCell(with collectionView: UICollectionView, indexPath: IndexPath) -> ConcentrationCollectionViewCell {
        let cell: ConcentrationCollectionViewCell = collectionView.dequeueReusableCellForIndexPath(indexPath)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension ConcentrationCollectionProvider: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectCard(self, withIndex: indexPath.row)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
