//
//  ContentView.swift
//  Movie Tracker
//
//  Created by Abhilash k George on 25/11/22.
//

import SwiftUI
import CoreData



struct MovieDetailView: View {
    @State var title = ""
    @State var rating = 3.0
    @State var seen = false
    var body: some View{
        List {
            Section {
                SubTitle(title: "Movie Title")
                TextField("hello", text: $title)
            }
            Section {
                HStack{
                    
                    SubTitle(title: "Rating")
                    Spacer()
                    Text(String(repeating: "⭐️", count: Int(rating)))
                    Spacer()
                }
                Slider(value: $rating, in: 1...5, step: 1)

            }
            Section {
                Toggle(isOn: $seen) {
                    SubTitle(title: "Seen?")
                    if title == "" {
                        Text("Have you watched this movie?")
                        
                    } else {
                        Text("Have you watched the movie \(title)?")
                    }
                    
                }
            }
            
            Section {
                
                Button(action: {}) {
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
        MovieDetailView()
    }
}

struct SubTitle: View {
    var title: String
    var body: some View {
        Text(title).font(.caption).foregroundColor(.gray)
    }
}
