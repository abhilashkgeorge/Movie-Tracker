//
//  MovieList.swift
//  Movie Tracker
//
//  Created by Abhilash k George on 26/11/22.
//

import SwiftUI

struct MovieList: View {
    
    @ObservedObject var movieStorage = MovieStorage()
    
    
    var body: some View {
        NavigationView {
            List(movieStorage.movies){ movie in
                NavigationLink(destination: MovieDetailView(movieStorage: movieStorage, movie: movie, newMovie: false)) {
                    Text(movie.title)
                }
            }
            .navigationTitle("Movies")
            .toolbar {
                ToolbarItem(){
                    NavigationLink(destination: MovieDetailView(movieStorage: movieStorage, movie: Movies(), newMovie: true))
                    {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}
