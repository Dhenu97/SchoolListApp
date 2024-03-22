//
//  SchoolDetailView.swift
//  SchoolsApp
//
//  Created by dhenu on 3/1/24.
//

import SwiftUI

struct SchoolDetailView: View {
  var school:SchoolModel
    var body: some View {
      ScrollView {
        VStack(alignment: .leading, spacing: 16) {
          if let id = school.id {
            Text("ID: \(id)").font(.subheadline).foregroundColor(.gray)
          }
          if let name = school.schoolName {
            Text("School Name: \(name)").font(.headline)
          }
          if let para = school.overViewparagragh {
            Text("OverView: \(para)").font(.subheadline).foregroundColor(.gray)
          }
        }
        .padding()

      }
    }
}
