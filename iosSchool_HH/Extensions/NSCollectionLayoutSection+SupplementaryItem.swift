//
//  NSCollectionLayoutSection+SupplementaryItem.swift
//  iosSchool_HH
//
//  Created by MaximM on 14.12.2023.
//

import Foundation
import UIKit

extension NSCollectionLayoutSection {

    func add(supplementaryItem: NSCollectionLayoutBoundarySupplementaryItem?) -> Self {
        if let supplementaryItem = supplementaryItem {
            boundarySupplementaryItems.append(supplementaryItem)
        }
        return self
    }
}
