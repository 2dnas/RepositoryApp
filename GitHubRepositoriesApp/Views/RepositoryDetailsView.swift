//
//  RepositoryDetailsView.swift
//  GitHubRepositoriesApp
//
//  Created by sandro shanshiashvili on 8/7/22.
//

import SwiftUI

struct RepositoryDetailsView: View {
    var body: some View {
      VStack(spacing: 10) {
        Spacer()
        Label {
          Text("Date Created: 21/15/21")
        } icon: {
          Image(systemName: "calendar")
            .scaledToFit()
        }
        Label {
          Text("Languages: Swift")
        } icon: {
          Image(systemName: "globe")
            .scaledToFit()
        }
        Text("No Description ")
        Image(systemName: "star.fill")
          .foregroundColor(.yellow)
        Spacer()
        Text("Add Star")
          .bold()
          .font(.title2)
          .frame(width: 280, height: 50)
          .background(Color.green)
          .foregroundColor(.white)
        
        
      }
      .padding()
    }
}

struct RepositoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryDetailsView()
    }
}
