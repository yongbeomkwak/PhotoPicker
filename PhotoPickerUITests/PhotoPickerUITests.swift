//
//  PhotoPickerUITests.swift
//  PhotoPickerUITests
//
//  Created by yongbeomkwak on 1/23/24.
//

import XCTest

final class PhotoPickerUITests: XCTestCase {

    override func setUpWithError() throws {

        try super.setUpWithError()
        // 테스트 실패 발생 시, 계속하여 실행할지
        continueAfterFailure = true

    
    }

    override func tearDownWithError() throws {
        // 만약 테스트에서 어떤 값을 변경했을 경우 다음 테스트에서 문제가 발생할 수 있기 때문에 사용
        // 각각의 유닛 테스트가 끝난 후 테스트 값을 처리합니다.
        // 초기 상태로 복원할 때 사용됩니다. (파일 닫기, 연결, 새로 만든 항목 제거, 트랜잭션 콜백 호출 등)
        
        try super.tearDownWithError()
    }

    /*
    
     함수 네이밍 규칙
     
     1. 앞에 test를 붙이고 테스트를 할 클래스 이름을 적어준다.
     2. 테스트를 할 상황에 대해 설명한다.
     3. 예상되는 결과를 적어준다.
     
    */
    
    func testButtonTapRenameTobtn() throws {
        
        // 테스트 앱 실행
        let app = XCUIApplication()
        app.launch()

        let btnInput = app.buttons["abc"]
        XCTAssertTrue(btnInput.exists)
        btnInput.tap()
        
        
        
        

    }
    
    


}
