//
//  ContentViewTests.swift
//  SchoolsAppTests
//
//  Created by dhenu on 3/1/24.
//

import XCTest
@testable import SchoolsApp

final class ContentViewTests: XCTestCase {
  var viewModel:SchoolsViewModel!
  var contentView: ContentView!
  var testService: NetworkManagerMock!
  override func setUp() {
    super.setUp()
    testService = NetworkManagerMock()
    viewModel = SchoolsViewModel(service: testService)
    contentView = ContentView(viewModel: viewModel)
  }


  func testSchoolsAPIService() {
    XCTAssertNotNil(viewModel)
    XCTAssertNotNil(testService)
    let schoolModelArray:[SchoolModel] = [SchoolModel(id: "DBN 1234",schoolName: "NYC School", overViewparagragh: "Overview description", boro: "M"),SchoolModel(id: "DBN 56789",schoolName: "USA School", overViewparagragh: "Overview description updated", boro: "K")]
    viewModel.schools = schoolModelArray
    contentView.onAppear()
    XCTAssertEqual(contentView.viewModel.schools.count, 2)
  }

  override func tearDown() {
    super.tearDown()
    contentView = nil
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
