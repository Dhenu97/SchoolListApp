//
//  SchoolsViewModel.swift
//  SchoolsApp
//
//  Created by dhenu on 3/1/24.
//

import Foundation

class SchoolsViewModel: ObservableObject {
  @Published var schools: [SchoolModel] = []
  @Published var errorMessage:String?
  var networkManager:ServiceProtocol

  init(service:ServiceProtocol = NetworkManager.shared) {
    self.networkManager = service
  }
  func fetchData() {
    networkManager.fetchData { [weak self] result in
      switch result {
      case .success(let schools):
        DispatchQueue.main.async {
          self?.schools = schools
        }
      case .failure(let error):
        DispatchQueue.main.async {
          self?.errorMessage = error.localizedDescription
        }
      }
    }
  }
}
