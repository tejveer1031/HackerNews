//
//  HackerNewsApp.swift
//  HackerNews
//
//  Created by TEJVEER SINGH on 2022-04-22.
//

import SwiftUI

@main
struct HackerNewsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
