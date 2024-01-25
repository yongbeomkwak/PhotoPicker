//
//  PhotoPickerViewModel.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/24/24.
//

import Foundation
import Combine
import UIKit

final class PhotoPickerViewModel : ViewModelType {
    
    var subscription: Set<AnyCancellable> = .init()
    
    struct Input {
        
        let fetchData : PassthroughSubject<[UIImage], Never> = .init()
        
    }
    
    struct Output {
        let dataSource : CurrentValueSubject<[ImageEntity], Never>
    }

    
    deinit {
        DEBUG_LOG("❌ \(Self.self) deinit")
    }
    
    func transform(input: Input) -> Output {
        
        
        var outputDataSourceSubject = CurrentValueSubject<[ImageEntity], Never>([])
        
      
        input.fetchData.sink(receiveValue: {
            
            var index = 1
            
            DEBUG_LOG("index: \(index)")
            
            let convertedResult = $0.map { image in
                
                let data = ImageEntity(id:index,image: image,isSelected: false)
                
                index += 1
                
                return data
            }
            
            
            outputDataSourceSubject.send( [ImageEntity(id: -1)] + convertedResult )
            
        })
        .store(in: &subscription)
        
        
        
        
        return Output(dataSource: outputDataSourceSubject)
    }
}
