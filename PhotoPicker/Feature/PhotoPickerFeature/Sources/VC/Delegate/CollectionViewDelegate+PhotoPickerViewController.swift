//
//  CollectionViewDelegate+PhotoPickerViewController.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/25/24.
//

import Foundation
import UIKit

extension PhotoPickerViewController : UICollectionViewDelegate {
    
}

extension PhotoPickerViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoPickerCollectionViewCell.id, for: indexPath) as? PhotoPickerCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.prepare((num: 10, isSelected: false, image: UIImage(named: "H")))
        
        return cell
        
        
    }
    
    
}

extension PhotoPickerViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard
             let flowLayout = collectionViewLayout as? GridCollectionViewFlowLayout,
             flowLayout.numberOfColumns > 0
           else { fatalError() }
        
        let widthOfCells = collectionView.bounds.width - (collectionView.contentInset.left + collectionView.contentInset.right)
        
        let widthOfSpacing = CGFloat(flowLayout.numberOfColumns - 1) * flowLayout.cellSpacing
        
        DEBUG_LOG("withOfcell \(widthOfCells) \(widthOfSpacing) \(flowLayout.cellSpacing)")
        
        let width = (widthOfCells - widthOfSpacing) / CGFloat(flowLayout.numberOfColumns)

    
        return CGSize(width: width, height: width * flowLayout.ratioHeightToWidth)
        
    }
}
