//
//  AKADaommoCodeChallengeApp.swift
//  Shared
//
//  Created by tongtong on 11/23/21.
//

import SwiftUI


@main
struct AKADaommoCodeChallengeApp: App {
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
