//
//  UICollectionView.swift
//  Lucky Spinner
//
//  Created by Muneeb on 30/05/2023.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func getCell<T: Registerable>(type: T.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: type.identifier, for: indexPath) as? T
    }
    
    func register(types: Registerable.Type ...) {
        for type in types {
            register(type.getNIB(), forCellWithReuseIdentifier: type.identifier)
        }
    }
    
    func registerHeader(types: Registerable.Type ...) {
        for type in types {
            register(type.getNIB(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: type.identifier)
        }
    }
    
    func getHeader<T: Registerable>(type: T.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: type.identifier, for: indexPath) as? T
    }
    
    func registerFooter(types: Registerable.Type ...) {
        for type in types {
            register(type.getNIB(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: type.identifier)
        }
    }
    
    func getFooter<T: Registerable>(type: T.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: type.identifier, for: indexPath) as? T
    }
    
    var centerPoint : CGPoint {
        get {
            return CGPoint(x: self.center.x + self.contentOffset.x, y: self.center.y + self.contentOffset.y);
        }
    }
    
    var centerCellIndexPath: IndexPath? {
        if let centerIndexPath: IndexPath  = self.indexPathForItem(at: self.centerPoint) {
            return centerIndexPath
        }
        return nil
    }
    
    @discardableResult
    func scrollToNearestVisibleCollectionViewCell() -> Int {
        self.decelerationRate = .normal
        let visibleCenterPositionOfScrollView = Float(self.contentOffset.x + (self.bounds.size.width / 2))
        var closestCellIndex = -1
        var closestDistance: Float = .greatestFiniteMagnitude
        for i in 0..<self.visibleCells.count {
            let cell = self.visibleCells[i]
            let cellWidth = cell.bounds.size.width
            let cellCenter = Float(cell.frame.origin.x + cellWidth / 2)
            
            // Now calculate closest cell
            let distance: Float = fabsf(visibleCenterPositionOfScrollView - cellCenter)
            if distance < closestDistance {
                closestDistance = distance
                closestCellIndex = self.indexPath(for: cell)!.row
            }
        }
        if closestCellIndex != -1 {
            self.scrollToItem(at: IndexPath(row: closestCellIndex, section: 0), at: .centeredHorizontally, animated: true)
            
        }
        return closestCellIndex
    }
}

