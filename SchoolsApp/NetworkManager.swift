//
//  NetworkManager.swift
//  SchoolsApp
//
//  Created by dhenu on 3/1/24.
//

import Foundation

protocol ServiceProtocol {
  func fetchData(completion: @escaping (Result<[SchoolModel], Error>) -> Void)
}

class NetworkManager: ServiceProtocol {

  static let shared = NetworkManager()
  private init() { }

  func fetchData(completion: @escaping (Result<[SchoolModel], Error>) -> Void) {

    guard let apiURL = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json") else {
      let err = NSError(domain: "URL NOT Found", code: 0)
      completion(.failure(err))
      return
    }
    let session = URLSession.shared
    let task = session.dataTask(with: apiURL) { data, resp, error in
      if let err = error {
        completion(.failure(err))
        return
      }

      guard let httpResp = resp as? HTTPURLResponse, (200...299).contains(httpResp.statusCode) else {
        let statusCode = (resp as? HTTPURLResponse)?.statusCode ?? -1
        let err = NSError(domain: "API response Error", code: statusCode)
        completion(.failure(err))
        return
      }
      guard let respData = data else {
        let err = NSError(domain: "Data Error", code: -1)
        completion(.failure(err))
        return
      }
      do {
        let schools = try JSONDecoder().decode([SchoolModel].self, from: respData)
        completion(.success(schools))
        return
      } catch let error {
        completion(.failure(error))
      }
    }
    task.resume()
  }


}
