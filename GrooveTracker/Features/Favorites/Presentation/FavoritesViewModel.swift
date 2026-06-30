//
//  FavoritesViewModel.swift
//  GrooveTracker
//
//  Created by Juan Adolfo Velazquez Reyes on 29/06/26.
//

import Foundation
import Observation

@Observable
@MainActor
class FavoritesViewModel {
    var savedTracks: [Track] = []
    var errorMessage: String?

    private let repository: FavoritesRepositoryProtocol

    init(repository: FavoritesRepositoryProtocol) {
        self.repository = repository
    }

    func loadFavorites() {
        do {
            savedTracks = try repository.getFavorites()
        } catch {
            errorMessage = "Error to load favorites: \(error.localizedDescription)"
        }
    }

    func delete(at offsets: IndexSet) {
        offsets.forEach { index in
            let trackId = savedTracks[index].id
            do {
                try repository.delete(trackId: trackId)
                savedTracks.remove(at: index)
            } catch {
                errorMessage = "Could not delete track: \(error.localizedDescription)"
            }
        }
    }
}
