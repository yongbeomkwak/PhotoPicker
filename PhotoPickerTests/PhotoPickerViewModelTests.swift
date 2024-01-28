//
//  PhotoPickerViewModelTests.swift
//  PhotoPickerTests
//
//  Created by yongbeomkwak on 1/27/24.
//

import XCTest
import Combine
@testable import PhotoPicker

final class PhotoPickerViewModelTests: XCTestCase {

    /*
    
     함수 네이밍 규칙
     
     1. 앞에 test를 붙이고 테스트를 할 클래스 이름을 적어준다.
     2. 테스트를 할 상황에 대해 설명한다.
     3. 예상되는 결과를 적어준다.
     
    */
    
    var viewModel: PhotoPickerViewModel!
    var subscription: Set<AnyCancellable>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        viewModel = PhotoPickerViewModel()
        subscription = .init()
    }

    override func tearDownWithError() throws {
        // 만약 테스트에서 어떤 값을 변경했을 경우 다음 테스트에서 문제가 발생할 수 있기 때문에 사용
        // 각각의 유닛 테스트가 끝난 후 테스트 값을 처리합니다.
        // 초기 상태로 복원할 때 사용됩니다. (파일 닫기, 연결, 새로 만든 항목 제거, 트랜잭션 콜백 호출 등)
        
        viewModel = nil
        subscription = nil
    }

    /*
     
     1. 앞에 test를 붙이고 테스트를 할 클래스 이름을 적어준다.
      
     2. 테스트를 할 상황에 대해 설명한다.

     3. 예상되는 결과를 적어준다.
     
     */
    
    func test_fetchData에_데이터추가되면_DataSource의_index값이_Count값과일치() {
        
        let input = PhotoPickerViewModel.Input()
        
        let output = viewModel.transform(input: input)
        
        input.fetchData.send([Data(),Data(),Data(),Data(),Data()])
        //5개
        
        var count: Int = 0
        
        output.dataSource.sink { data  in
         
            for d in data {
                
                XCTAssertEqual(d.index, count)
                
                count += 1
                
            }
            
        }
        .store(in: &subscription)
        
    }
    
    func test_tapItem에_데이터가들어오면_선택된_데이터의_isSelected값은_True() {
        
        let input = PhotoPickerViewModel.Input()
        
        let output = viewModel.transform(input: input)
        
        input.fetchData.send([Data(),Data(),Data(),Data(),Data()])
        
        // 6개 데이터 소스(0,1,2,3,4,5)
        // 0은 기본 데이터 + 5개는 추가 데이터
        
        input.tapItem.send(1)
        input.tapItem.send(5)
        input.tapItem.send(2)
        
        //인덱스 1,5,2 데이터 선택
        //1,5,2의 isSelected = true
        
        output.dataSource.sink { data in
            for d in data {
                if d.index == 1 || d.index == 5 || d.index == 2 {
                    // 1,5,2는 선택된 것이므로 isSelected는 true여야함
                    XCTAssertTrue(d.isSelected)
    
                }
            }
            
        }
        .store(in: &subscription)
    }
    
    func test_tapItem에_데이터가들어오면_selectedItems의_count는_3() {
            
        let input = PhotoPickerViewModel.Input()
        
        let output = viewModel.transform(input: input)
        
        input.fetchData.send([Data(),Data(),Data(),Data(),Data()])
        
        // 6개 데이터 소스(0,1,2,3,4,5)
        // 0은 기본 데이터 + 5개는 추가 데이터
        
        input.tapItem.send(1)
        input.tapItem.send(5)
        input.tapItem.send(2)
            
        output.selectedItems.sink { data in
            
            //위에서 3개를 선택했으므로 선택된 데이터의 길이는 3개 이다.
            XCTAssertEqual(data.count, 3)
            
        }
        .store(in: &subscription)
    }
    
    func test_tapItem에_이미_있는_데이터가들어오면_selectedItems의_count는_1() {
        
        let input = PhotoPickerViewModel.Input()
        
        let output = viewModel.transform(input: input)
        
        input.fetchData.send([Data(),Data(),Data(),Data(),Data()])
        
        // 6개 데이터 소스(0,1,2,3,4,5)
        // 0은 기본 데이터 + 5개는 추가 데이터
        
        input.tapItem.send(1)
        input.tapItem.send(5)
        input.tapItem.send(2)
        
        //인덱스 1,5,2 데이터 선택
        //1,5,2의 isSelected = true
        
        input.tapItem.send(1)
        input.tapItem.send(2)
        
        //인덱스 1,2 데이터를 재 선택
        // selectedItems = 3-2 = 1
        
        output.selectedItems.sink { data in
            
            XCTAssertEqual(data.count, 1)
        }
        .store(in: &subscription)
    }
    
               


}

