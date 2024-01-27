//
//  EditListViewModelTests.swift
//  PhotoPickerTests
//
//  Created by yongbeomkwak on 1/27/24.
//

import XCTest
import Combine
@testable import PhotoPicker

final class EditListViewModelTests: XCTestCase {


    /*
    
     함수 네이밍 규칙
     
     1. 앞에 test를 붙이고 테스트를 할 클래스 이름을 적어준다.
     2. 테스트를 할 상황에 대해 설명한다.
     3. 예상되는 결과를 적어준다.
     
    */
    
    var viewModel: EditListViewModel!
    var subscription: Set<AnyCancellable>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        viewModel = EditListViewModel(dataes: [Data(),Data(),Data()])
        subscription = .init()
    }

    override func tearDownWithError() throws {
        // 만약 테스트에서 어떤 값을 변경했을 경우 다음 테스트에서 문제가 발생할 수 있기 때문에 사용
        // 각각의 유닛 테스트가 끝난 후 테스트 값을 처리합니다.
        // 초기 상태로 복원할 때 사용됩니다. (파일 닫기, 연결, 새로 만든 항목 제거, 트랜잭션 콜백 호출 등)
        
        viewModel = nil
        subscription = nil
    }

    func test_tapCrop_선택된데이터_방출() {
        
        let data = viewModel.dataes
        
        let tapCrop = PassthroughSubject<Void,Never>()
        let tapRotate = PassthroughSubject<Void,Never>()
        
        let input = EditListViewModel.Input(tapCrop: tapCrop.eraseToAnyPublisher(), tapRotate: tapRotate.eraseToAnyPublisher())
        
        input.index.send(2)
        
        let selectedItem = data[2]

        let output = viewModel.transform(input: input)
        
        tapCrop.send(())
        
        // 선택된 데이터다 index2번을 가리키고 있어야함
        
        output.selelctedData.sink { data in
            
            XCTAssertEqual(data, selectedItem)
            
        }.store(in: &subscription)
        
    }

}
