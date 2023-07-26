//
//  AvtomobilkaAppApp.swift
//  AvtomobilkaApp
//
//  Created by Михаил on 26.07.2023.
//

import SwiftUI

@main
struct AvtomobilkaAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
