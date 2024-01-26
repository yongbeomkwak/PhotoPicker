//
//  CropViewModel.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/26/24.
//

import Foundation

final class CropViewModel : ViewModelType {
    
    var data: Data?
    
    init(data: Data?) {
        self.data = data
    }
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(input: Input) -> Output {
        
        return Output()
    }
    
}
