//
//  CollectionViewDelegate+HomeViewController.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/27/24.
//

import Foundation
import UIKit

extension HomeViewController : UICollectionViewDelegate {
    
 
    
}

extension HomeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return output.dataSource.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.id, for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        

        cell.prepare(output.dataSource.value[indexPath.row])
        
        return cell
        
        
    }
    
    
}

extension HomeViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard
             let flowLayout = collectionViewLayout as? GridCollectionViewFlowLayout,
             flowLayout.numberOfColumns > 0
           else { fatalError() }
        
        let widthOfCells = collectionView.bounds.width - (collectionView.contentInset.left + collectionView.contentInset.right)
        
        let widthOfSpacing = CGFloat(flowLayout.numberOfColumns - 1) * flowLayout.cellSpacing
        
        
        let width = (widthOfCells - widthOfSpacing) / CGFloat(flowLayout.numberOfColumns)

    
        return CGSize(width: width, height: width * flowLayout.ratioHeightToWidth)
        
    }
}

