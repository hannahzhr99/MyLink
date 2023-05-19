//
//  MyLinkApp.swift
//  MyLink
//
//  Created by Hannah's Mac on 19/05/23.
//

import SwiftUI

@main
struct MyLinkApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
