//
//  ContentView.swift
//  Movie Tracker
//
//  Created by Abhilash k George on 25/11/22.
//

import SwiftUI
import CoreData



struct MovieDetailView: View {
    @ObservedObject var movieStorage: MovieStorage
    @State var movie: Movies
    
    var newMovie: Bool
    @Environment(\.presentationMode) var presentationMode
    var body: some View{
        List {
            Section {
                SubTitle(title: "Movie Title")
                TextField("hello", text: $movie.title)
            }
            Section {
                HStack{
                    SubTitle(title: "Rating")
                    Spacer()
                    Text(String(repeating: "⭐️", count: Int(movie.rating)))
                    Spacer()
                }
                Slider(value: $movie.rating, in: 1...5, step: 1)

            }
            Section {
                Toggle(isOn: $movie.seen) {
                    SubTitle(title: "Seen?")
                    if movie.title == "" {
                        Text("Have you watched this movie?")
                        
                    } else {
                        Text("Have you watched the movie \(movie.title)?")
                    }
                    
                }
            }
            
            Section {
                
                Button(action: {
                    if newMovie {
                        movieStorage.movies.append(movie)
                    } else {
                        for x in 0...movieStorage.movies.count {
                            if self.movieStorage.movies[x].id == self.movie.id {
                                
                            }
                        }
                    }
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack{
                        Spacer()
                        Text("Save")
                            .foregroundColor(.green)
                        Spacer()
                    }
                }
            }
            
        }.listStyle(GroupedListStyle())
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieStorage: MovieStorage(), movie: Movies(), newMovie: false)
    }
}

struct SubTitle: View {
    var title: String
    var body: some View {
        Text(title).font(.caption).foregroundColor(.gray)
    }
}
