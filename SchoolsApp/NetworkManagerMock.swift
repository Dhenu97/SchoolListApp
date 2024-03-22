//
//  NetworkManagerMock.swift
//  SchoolsApp
//
//  Created by dhenu on 3/1/24.
//

import Foundation

class NetworkManagerMock : ServiceProtocol {
  var isAPISuccess = true

  func fetchData(completion: @escaping (Result<[SchoolModel], Error>) -> Void) {
    if isAPISuccess {
      let schoolModelArray:[SchoolModel] = [SchoolModel(id: "DBN 1234",schoolName: "NYC School", overViewparagragh: "Overview description", boro: "M"),SchoolModel(id: "DBN 56789",schoolName: "USA School", overViewparagragh: "Overview description updated", boro: "K")]
      completion(.success(schoolModelArray))
      return
    }
    let error = NSError(domain: "Scools API Failure", code: -1)
    completion(.failure(error))

  }
}

