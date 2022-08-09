//
//  GetUserRepositoriesGateway.swift
//  GitHubRepositoriesApp
//
//  Created by sandro shanshiashvili on 8/8/22.
//

import Foundation

typealias GetUserRepositoryCompletionHanlder = ((Result<[RepositoryModel],Error>) -> ())

protocol GetUserRepositoriesGateway {
  func getUserRepositories(from user: String, completionHanlder: @escaping GetUserRepositoryCompletionHanlder)
}


struct GetUserRepositoriesGatewayImpl : GetUserRepositoriesGateway {
  let session = URLSession.shared
  
  func getUserRepositories(from user: String, completionHanlder: @escaping GetUserRepositoryCompletionHanlder) {
    let url = URL(string: "\(Utilities.baseURL)/users/\(user)/repos")!

    session.dataTask(with: url) { data, response, error in
      if let error = error {
        completionHanlder(.failure(error))
        return
      }
      guard let data = try? JSONDecoder().decode([RepositoryModel].self, from: data!) else { return }
      completionHanlder(.success(data))
    }.resume()
  }
}
