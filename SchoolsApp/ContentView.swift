//
//  ContentView.swift
//  SchoolsApp
//
//  Created by dhenu on 3/1/24.
//

import SwiftUI

struct ContentView: View {

  @ObservedObject var viewModel = SchoolsViewModel()
  var body: some View {
    NavigationView {

      List(viewModel.schools, id: \.id) { school in

        NavigationLink(destination: SchoolDetailView(school: school)) {

          VStack(alignment: .leading) {
            Text(school.id ?? "").font(.subheadline).foregroundColor(.gray)
            Text(school.schoolName ?? "").font(.headline)
          }

        }

      }.navigationTitle("Schools")
    }

    .onAppear() {
      viewModel.fetchData()
    }
  }
}

#Preview {
    ContentView()
}
