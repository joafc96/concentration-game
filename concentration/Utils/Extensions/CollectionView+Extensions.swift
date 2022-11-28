//
//  CollectionView+Extensions.swift
//  concentration
//
//  Created by qbuser on 27/11/22.
//

import UIKit

extension UICollectionView {
    func dequeueReusableCellForIndexPath<T: UICollectionViewCell>(_ indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.nameOfClass, for: indexPath) as! T
    }
}
