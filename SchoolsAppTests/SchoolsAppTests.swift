//
//  SchoolsAppTests.swift
//  SchoolsAppTests
//
//  Created by dhenu on 3/1/24.
//

import XCTest
@testable import SchoolsApp

final class SchoolsAppTests: XCTestCase {
  var viewModel:SchoolsViewModel!
  var testService: NetworkManagerMock!
  override func setUp() {
    super.setUp()
    testService = NetworkManagerMock()
    viewModel = SchoolsViewModel(service: testService)
  }


  func testSchoolsAPIService() {
    XCTAssertNotNil(viewModel)
    XCTAssertNotNil(testService)
    viewModel.fetchData()
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
      XCTAssertNotNil(self.viewModel.schools)
      XCTAssertGreaterThanOrEqual(self.viewModel.schools.count, 2)
      let firstSchool = self.viewModel.schools.first
      XCTAssertEqual(firstSchool?.id, "DBN 1234")
      XCTAssertEqual(firstSchool?.schoolName, "NYC School")
      XCTAssertEqual(firstSchool?.overViewparagragh, "Overview description")

    }
  }
  func testAPIFailure() {
    testService.isAPISuccess = false
    viewModel.fetchData()
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
      //XCTAssertNotNil(self.viewModel.errorMessage)
      XCTAssertEqual(self.viewModel.errorMessage, "Scools API Failure")
    }
  }

   //Dispose Elements
  override func tearDown() {
    super.tearDown()
    testService = nil
    viewModel = nil
  }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
