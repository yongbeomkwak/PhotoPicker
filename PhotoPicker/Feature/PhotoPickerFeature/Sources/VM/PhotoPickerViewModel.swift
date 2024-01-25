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
    
    func transform(input: Input) -> Output {
        
        
        var outputDataSourceSubject = CurrentValueSubject<[ImageEntity], Never>([ImageEntity(id: -1)])
        
        input.fetchData.sink(receiveValue: {
            
            var index = outputDataSourceSubject.value.count
            
            let convertedResult = $0.map { image in
                
                let data = ImageEntity(id:index,image: image,isSelected: false)
                
                index += 1
                
                return data
            }
            
            
            outputDataSourceSubject.send( outputDataSourceSubject.value + convertedResult )
            
        })
        .store(in: &subscription)
        
        
        
        
        return Output(dataSource: outputDataSourceSubject)
    }
}
