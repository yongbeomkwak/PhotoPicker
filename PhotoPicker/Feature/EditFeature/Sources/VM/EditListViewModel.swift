//
//  EditListViewModel.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/26/24.
//

import Foundation

final class EditListViewModel : ViewModelType {

    var dataes:[Data?]
    
    init(dataes: [Data?]) {
        self.dataes = dataes
    }
    
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(input: Input) -> Output {
        
        return Output()
    }
    
}
