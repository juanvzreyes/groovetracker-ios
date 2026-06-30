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
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([SavedTrack.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            TabView {
                DiscoveryView(viewModel: makeDiscoveryViewModel())
                    .tabItem {
                        Label("Explorar", systemImage: "magnifyingglass")
                    }
                FavoritesView(viewModel: makeFavoritesViewModel())
                    .tabItem {
                        Label("Favoritos", systemImage: "star.fill")
                    }
            }
        }
        .modelContainer(sharedModelContainer)
    }

    @MainActor
    private func makeDiscoveryViewModel() -> DiscoveryViewModel {
        let httpClient = HTTPClient()
        let discoveryRepository = DiscoveryRepository(httpClient: httpClient)
        let getUseCase = GetTracksUseCase(repository: discoveryRepository)

        let favoritesRepository = FavoritesRepository(context: sharedModelContainer.mainContext)
        let saveUseCase = SaveTrackUseCase(repository: favoritesRepository)

        return DiscoveryViewModel(
            getTracksUseCase: getUseCase,
            saveTrackUseCase: saveUseCase
        )
    }

    @MainActor
    private func makeFavoritesViewModel() -> FavoritesViewModel {
        let repository = FavoritesRepository(context: sharedModelContainer.mainContext)
        return FavoritesViewModel(repository: repository)
    }
}
