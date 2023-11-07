//
//  ContentView.swift
//  MovieList
//
//  Created by SMIN on 11/2/23.
//

import SwiftUI
import MovieAPI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<viewModel.movies.count, id: \.self) { index in
                    MovieRow(movie: viewModel.movies[index])
                }
            }
            .navigationBarTitle(Text("Favorite Movie"))
        }
        
        .task {
            await viewModel.fetchData()
        }
    }
}

struct MovieRow: View {
    let movie: MovieListQuery.Data.Movie
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: movie.thumb)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100, alignment: .center)
            .background(Color.gray)
            .clipShape(Circle())
            
            Text(movie.name)
        }
    }
}
