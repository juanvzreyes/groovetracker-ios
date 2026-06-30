//
//  DiscoveryView.swift
//  GrooveTracker
//
//  Created by Juan Adolfo Velazquez Reyes on 23/06/26.
//

import SwiftUI

struct DiscoveryView: View {
    @State private var viewModel: DiscoveryViewModel

    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
    ]

    init(viewModel: DiscoveryViewModel) {
        self._viewModel = State(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.viewState {
                case .idle:
                    ContentUnavailableView(
                        "Explora Música",
                        systemImage: "music.note.list",
                        description: Text("Busca tus géneros o artistas favoritos para ver sus detalles técnicos")
                    )
                case .loading:
                    ProgressView("Buscando...")
                        .scaleEffect(1.2)
                case .success(let tracks):
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(tracks) { track in
                                TrackCardView(track: track) {
                                    viewModel.saveToFavorites(track: track)
                                }
                            }
                        }
                        .padding()
                    }
                case .error(let message):
                    ContentUnavailableView(
                        "Ocurrió un problema",
                        systemImage: "exclamationmark.triangle",
                        description: Text(message)
                    )
                }
            }
        }
        .navigationTitle("Buscador")
        .searchable(
            text: $viewModel.searchQuery,
            prompt: "Buscar artistas o géneros"
        )
        .onSubmit(of: .search) {
            Task {
                await viewModel.searchTracks()
            }
        }
    }
}
