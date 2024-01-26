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
    }
    
    struct Output {
        let navigateToPhotoPicker: AnyPublisher<Void,Never>
    }
    
    private var subscription = Set<AnyCancellable>()
    
    deinit {
        DEBUG_LOG("❌ \(Self.self)")
    }
    
    func transform(input: Input) -> Output {
        
        let outputNavigateSubject = PassthroughSubject<Void,Never>()
        
        
        input.tapNavigateButton
            .sink(receiveValue: outputNavigateSubject.send(_:))
            .store(in: &subscription)
        
        
        return Output(navigateToPhotoPicker: outputNavigateSubject.eraseToAnyPublisher())
    }
}
