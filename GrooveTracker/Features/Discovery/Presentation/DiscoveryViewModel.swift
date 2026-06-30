//
//  DiscoveryViewModel.swift
//  GrooveTracker
//
//  Created by Juan Adolfo Velazquez Reyes on 23/06/26.
//

import Foundation
import Observation

@Observable
@MainActor
class DiscoveryViewModel {
    enum ViewState {
        case idle
        case loading
        case success(tracks: [Track])
        case error(message: String)
    }

    var viewState: ViewState = .idle
    var searchQuery: String = ""

    private let getTracksUseCase: GetTracksUseCaseProtocol
    private let saveTrackUseCase: SaveTrackUseCaseProtocol

    init(
        getTracksUseCase: GetTracksUseCaseProtocol,
        saveTrackUseCase: SaveTrackUseCaseProtocol
    ) {
        self.getTracksUseCase = getTracksUseCase
        self.saveTrackUseCase = saveTrackUseCase
    }

    func searchTracks() async {
        viewState = .loading

        do {
            let tracks = try await getTracksUseCase.execute(query: searchQuery)

            if tracks.isEmpty {
                viewState = .error(message: "No se encontraron canciones para tu búsqueda")
            } else {
                viewState = .success(tracks: tracks)
            }
        } catch {
            viewState = .error(message: error.localizedDescription)
        }
    }

    func saveToFavorites(track: Track) {
        do {
            try saveTrackUseCase.execute(track: track)
            print("¡Track guardado en favoritos!")
        } catch {
            viewState = .error(message: "No se pudo guardar la canción en favoritos")
        }
    }
}
