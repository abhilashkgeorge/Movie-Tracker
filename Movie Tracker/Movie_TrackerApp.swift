//
//  Movie_TrackerApp.swift
//  Movie Tracker
//
//  Created by Abhilash k George on 25/11/22.
//

import SwiftUI

@main
struct Movie_TrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
