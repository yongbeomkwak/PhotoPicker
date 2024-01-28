//
//  RootViewModel.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/24/24.
//

import Foundation
import Combine
import UIKit

final class HomeViewModel : ViewModelType {

    
    struct Input {
        let tapNavigateButton : AnyPublisher<Void,Never>
        let fetchData : PassthroughSubject<[Data?], Never> = .init()
    }
    
    struct Output {
        let navigateToPhotoPicker: AnyPublisher<Void,Never>
        let dataSource : CurrentValueSubject<[ImageEntity], Never>
    }
    
    private var subscription = Set<AnyCancellable>()
    
    deinit {
        DEBUG_LOG("❌ \(Self.self)")
    }
    
    func transform(input: Input) -> Output {
    
        
        
        let outputNavigateSubject = PassthroughSubject<Void,Never>()
        var outputDataSourceSubject = CurrentValueSubject<[ImageEntity], Never>([])
        
        input.tapNavigateButton
            .sink(receiveValue: outputNavigateSubject.send(_:))
            .store(in: &subscription)
        
        
        input.fetchData.sink(receiveValue: {
            
            var index = 1
            
            
            let convertedResult = $0.map { image in
                
                let data = ImageEntity(index:index,image: image,isSelected: false)
                
                index += 1
                
                return data
            }
            
            
            outputDataSourceSubject.send( convertedResult )
            
        })
        .store(in: &subscription)
        
        
        return Output(navigateToPhotoPicker: outputNavigateSubject.eraseToAnyPublisher(),dataSource: outputDataSourceSubject)
    }
}
