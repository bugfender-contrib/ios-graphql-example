//
//  ViewModel.swift
//  MovieList
//
//  Created by SMIN on 11/3/23.
//

import Foundation
import MovieAPI

public class ViewModel: ObservableObject {
  @Published var movies = [MovieListQuery.Data.Movie]()
  
  @MainActor
  func fetchData() async {
    Network.shared.apollo.fetch(query: MovieListQuery()) { [weak self] result in
        guard let self = self else {
            return
        }
          
        switch result {
          case .success(let graphQLResult):
              if let launchConnection = graphQLResult.data?.movies {
                  self.movies.append(contentsOf: launchConnection.compactMap({ $0 }))
              }
          
              print(self.movies)

              if let errors = graphQLResult.errors {
                  print("error \(errors)")
              }
          case .failure(let error):
            print("failure \(error)")
          }
      }
  }
}
