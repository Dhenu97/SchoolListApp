//
//  SchoolModel.swift
//  SchoolsApp
//
//  Created by dhenu on 3/1/24.
//

import Foundation

struct SchoolModel : Codable, Identifiable {
  var id:String?
  var schoolName:String?
  var overViewparagragh:String?
  var boro:String?

  enum CodingKeys: String, CodingKey {
    case id = "dbn"
    case schoolName = "school_name"
    case overViewparagragh = "overview_paragraph"
    case boro

  }

}


