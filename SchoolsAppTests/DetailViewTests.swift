//
//  DetailViewTests.swift
//  SchoolsAppTests
//
//  Created by dhenu on 3/1/24.
//

import XCTest
@testable import SchoolsApp

final class DetailViewTests: XCTestCase {
  var school:SchoolModel!
  var detailView: SchoolDetailView!

  override func setUp() {
    super.setUp()

    school = SchoolModel(id: "DBN 9999",schoolName: "USA School", overViewparagragh: "Overview", boro: "XYZ")
    detailView = SchoolDetailView(school: school)
  }


  func testSchoolsDetailsView() {

    XCTAssertEqual(detailView.school.id, "DBN 9999")
    XCTAssertEqual(detailView.school.schoolName, "USA School")
    XCTAssertEqual(detailView.school.overViewparagragh, "Overview")
  }

  override func tearDown() {
    super.tearDown()
    detailView = nil
    school = nil
  }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
