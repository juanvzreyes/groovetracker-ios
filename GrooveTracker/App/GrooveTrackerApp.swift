//
//  GrooveTrackerApp.swift
//  GrooveTracker
//
//  Created by Juan Adolfo Velazquez Reyes on 16/06/26.
//

import SwiftData
import SwiftUI

@main
struct GrooveTrackerApp: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()

    var body: some Scene {
        WindowGroup {
            let httpClient = HTTPClient()
            let repository = DiscoveryRepository(httpClient: httpClient)
            let useCase = GetTracksUseCase(repository: repository)
            let viewModel = DiscoveryViewModel(getTracksUseCase: useCase)

            DiscoveryView(viewModel: viewModel)
        }
//        .modelContainer(sharedModelContainer)
    }
}
