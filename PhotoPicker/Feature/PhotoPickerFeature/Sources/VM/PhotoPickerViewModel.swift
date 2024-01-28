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
        
        let fetchData : PassthroughSubject<[Data?], Never> = .init()
        let tapItem: PassthroughSubject<Int, Never> = .init()
    }
    
    struct Output {
        let dataSource : CurrentValueSubject<[ImageEntity], Never>
        let selectedItems: CurrentValueSubject<[(id:Int,mappingIndex:Int)], Never> 
        //(id, mappingIndex: selectedItems -> dataSource)
        let finalItems: CurrentValueSubject<[Data?], Never>
    }

    
    deinit {
        DEBUG_LOG("❌ \(Self.self) deinit")
    }
    
    func transform(input: Input) -> Output {
        
        // 데이터 소스
        var outputDataSourceSubject = CurrentValueSubject<[ImageEntity], Never>([])
        
        // 선택된 데이터
        var outputSelectedItemsSubject = CurrentValueSubject<[(id:Int,mappingIndex:Int)],Never>([])
        
        // 화면 전환 시 , 전달될 최종 데이터
        var outputfinalItemsSubject = CurrentValueSubject<[Data?],Never>([])
        

        input.fetchData.sink(receiveValue: {
            
            var index = 1
            
            let convertedResult = $0.map { image in
                let data = ImageEntity(index:index,image: image,isSelected: false)
                index += 1
                return data
            }
            
            
            // 새로운 데이터 소스가 들어오면 선택된 것들 비워줌
            outputSelectedItemsSubject.send([])
            
            // 카메라 셀 데이터 + 실제 사진 데이터
            outputDataSourceSubject.send([ImageEntity(index: 0, id: -1)] + convertedResult)
            
        })
        .store(in: &subscription)
        
        input.tapItem
            .sink(receiveValue: { (index: Int) in
                
                var data = outputDataSourceSubject.value
                var selectedItems = outputSelectedItemsSubject.value
                
                if data[index].isSelected {
                    // 들어온 index가 선택된 상태면 , 해제와 동시에 현재 index보다 나중에 선택된 인덱스들도 순서를 1칸 씩 당겨 준다.
                    
                    let firstIndex = selectedItems.firstIndex(where: {$0.id == data[index].id})! // 현재 선택된 인덱스 찾음
                
                    // 제거할 것보다 나중에 추가된 것들은 앞으로 하나씩 당겨준다
                    for i in stride(from:firstIndex, to: selectedItems.count, by:1) {
                        data[selectedItems[i].mappingIndex].index -= 1  // 뒤에 있는 것들 선택해
                    }

                    data[selectedItems[firstIndex].mappingIndex].isSelected = false // 선택해제
                    selectedItems.remove(at: firstIndex) // 제거
                    
                } else {
                    
                    data[index].index = selectedItems.count+1
                    data[index].isSelected = true
                    selectedItems.append((id:data[index].id, mappingIndex:index))
                    
                }
                
                
                // 갱신
                
                
                var result: [Data?] = []
                
                for selectedItem in selectedItems {
                    result.append(data[selectedItem.mappingIndex].image)
                }
                
                outputSelectedItemsSubject.send(selectedItems)
                outputDataSourceSubject.send(data)
                outputfinalItemsSubject.send(result)
                
                
            })
            .store(in: &subscription)
        
        return Output(
            dataSource: outputDataSourceSubject,
            selectedItems: outputSelectedItemsSubject,
            finalItems: outputfinalItemsSubject
        )
    }
}
