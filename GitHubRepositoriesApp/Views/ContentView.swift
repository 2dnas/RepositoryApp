//
//  ContentView.swift
//  GitHubRepositoriesApp
//
//  Created by sandro shanshiashvili on 8/6/22.
//

import SwiftUI

struct ContentView: View {
  let getUserRepositoryGateway = GetUserRepositoriesGatewayImpl()
  @State var list: [RepositoryModel] = RepositoryModel.dummyData
  @State var searchText: String = ""
  var body: some View {
    NavigationView {
      VStack {
        List(list, id: \.id) { repository in
          NavigationLink(destination: RepositoryDetailsView()) {
            HStack {
              AsyncImage(url: URL(string: repository.owner.avatar)) { image in
                image.resizable()
                  .scaledToFit()
                  .frame(width: 70, height: 70)
              } placeholder: {
                ProgressView()
              }
              VStack(alignment: .leading) {
                Text(repository.name)
                  .font(.headline)
                Text(repository.owner.userName)
                  .font(.subheadline)
                  .foregroundColor(.secondary)
              }
            }
          }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        .onChange(of: searchText, perform: { filter in
          filterRepositories()
        })
        .navigationTitle("Repositories")
      }
    }
  }
  func filterRepositories() {
    if searchText.isEmpty {
      list = RepositoryModel.dummyData
    } else {
       getUserRepositoryGateway.getUserRepositories(from: searchText, completionHanlder: { result in
        list = try! result.get()
      })
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
