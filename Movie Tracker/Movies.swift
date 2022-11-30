//
//  Movies.swift
//  Movie Tracker
//
//  Created by Abhilash k George on 26/11/22.
//

import Foundation

struct Movies: Identifiable{
    var id = UUID()
    var title = ""
    var rating = 3.0
    var seen = false
}


class MovieStorage: ObservableObject {
    @Published var movies = [Movies]()
}
