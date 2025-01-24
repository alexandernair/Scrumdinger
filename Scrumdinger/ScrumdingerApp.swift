//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Alex Nair on 1/9/25.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
