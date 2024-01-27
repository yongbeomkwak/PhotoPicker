//
//  EditListViewModel.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/26/24.
//

import Foundation
import Combine

enum RotateState : Int {
    
    case vertical = 0
    case horizon
    case flipVertical
    case flipHorizontal
    
    func next() -> RotateState {
        
        return RotateState(rawValue:(self.rawValue+1)%4)!
    }
    
}

final class EditListViewModel : ViewModelType {

    var dataes:[Data?]
    
    var subscription: Set<AnyCancellable> = .init()
    
    init(dataes: [Data?]) {
        self.dataes = dataes
    }
    
    deinit {
        DEBUG_LOG("❌ \(Self.self)")
    }
    
    struct Input {
        let tapCrop : AnyPublisher<Void, Never>
        let tapRotate : AnyPublisher<Void, Never>
        let index = CurrentValueSubject<Int, Never>(0)
    }
    
    struct Output {
        let rotate: AnyPublisher<RotateState, Never>
        let selelctedData: AnyPublisher<Data?, Never>
    }
    
    func transform(input: Input) -> Output {
        
        var outputRotateSubject = CurrentValueSubject<RotateState, Never>(.vertical)
        var outputSelelctedDataSubject = PassthroughSubject<Data?, Never>()
        
        input.tapCrop
            .sink { [weak self] _ in
                guard let self else {return}
                outputSelelctedDataSubject.send(self.dataes[input.index.value])
            }
            .store(in: &subscription)
        
        
        
        input.tapRotate
            .combineLatest(outputRotateSubject.eraseToAnyPublisher())
            .sink { (_, state) in
                
                outputRotateSubject.send(state.next())
                
            }
            .store(in: &subscription)
        
        
        
        return Output(rotate: outputRotateSubject.eraseToAnyPublisher(), selelctedData: outputSelelctedDataSubject.eraseToAnyPublisher())
    }
    
}
