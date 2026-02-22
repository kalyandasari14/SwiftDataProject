//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by kalyan on 2/21/26.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
