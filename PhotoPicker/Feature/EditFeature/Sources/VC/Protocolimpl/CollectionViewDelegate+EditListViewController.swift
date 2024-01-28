//
//  CollectionViewDelegate+EditListViewController.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/26/24.
//

import Foundation
import UIKit

extension EditListViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.dataes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EditListCollectionViewCell.id, for: indexPath) as? EditListCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let index = indexPath.row
        
        cell.prepare(viewModel.dataes[index],viewModel.rotateState[index],index: index)
        cell.clipsToBounds = true
        cell.delegate = self
        
        return cell
    }
    
    
}

extension EditListViewController : EditListCollectionViewCellDelegate {
    func syncData(data: Data?, index: Int) {
        
        viewModel.dataes[index] = data
        
    }
    
    
}

extension EditListViewController : UICollectionViewDelegate {
   
}

extension EditListViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return collectionView.bounds.size
    }
}

extension EditListViewController: UIScrollViewDelegate {
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let i = Int(scrollView.contentOffset.x / APP_WIDTH())
        
        self.navigationBarView.changeTitle("\(i+1)/\(viewModel.dataes.count)")
        self.carouselLabel.text = "\(i+1)"
        self.input.index.send(i)
    }
}
