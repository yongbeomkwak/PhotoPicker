//
//  GridCollectionViewFlowLayout.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/25/24.
//

import UIKit

class GridCollectionViewFlowLayout: UICollectionViewFlowLayout {
    var numberOfColumns = 1
    var cellSpacing = 1.0 {
      didSet {
        self.minimumLineSpacing = self.cellSpacing // 행 사이 간격 
        self.minimumInteritemSpacing = self.cellSpacing // 아이템 사이 좌우 간겨
      }
    }
    var ratioHeightToWidth = 1.0
    
    override init() {
      super.init()
      self.scrollDirection = .vertical // 스크롤이 수직이므로 , 기준은 행
    }
    required init?(coder: NSCoder) {
      fatalError()
    }
}
