//
//  RepositoryModel.swift
//  GitHubRepositoriesApp
//
//  Created by sandro shanshiashvili on 8/7/22.
//

import Foundation

struct RepositoryModel: Identifiable, Codable {
  
  let id = UUID()
  let owner: RepositoryOwner
  let name: String
  
  struct RepositoryOwner: Codable {
    let userName: String
    let avatar: String
    
    private enum CodingKeys : String, CodingKey {
           case avatar = "avatar_url"
           case userName = "login"
       }
  }
}





extension RepositoryModel {
  static let dummyData = [
    RepositoryModel(
      owner: RepositoryOwner(userName: "sandro", avatar: "https://www.cnet.com/a/img/resize/c074d86e39cc5bddc376d1882aa7925851b244e9/2018/05/24/28ddccdb-2ae1-4d0f-ada8-c0ecc66b045e/deadpool-can.jpg?auto=webp&fit=crop&height=675&width=1200"),
      name: "Deadpool Project"),
    RepositoryModel(
      owner: RepositoryOwner(userName: "Developer", avatar: "https://www.pinkvilla.com/files/styles/amp_metadata_content_image/public/ironmansocial_3.jpg"),
      name: "Project Iron Man")
  ]
  
}
