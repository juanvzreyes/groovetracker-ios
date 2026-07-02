//
//  FavoritesView.swift
//  GrooveTracker
//
//  Created by Juan Adolfo Velazquez Reyes on 29/06/26.
//

import SwiftUI

struct FavoritesView: View {
    @State private var viewModel: FavoritesViewModel

    init(viewModel: FavoritesViewModel) {
        self._viewModel = State(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.savedTracks.isEmpty {
                    emptyState
                } else {
                    listView
                }
            }
            .navigationTitle("Favoritos")
            .onAppear {
                viewModel.loadFavorites()
            }
        }
    }

    private var emptyState: some View {
        GTEmptyStateView(
            title: "Aún no hay favoritos",
            systemImage: "star",
            description: "Las canciones que marques con una estrella aparecerán en esta sección"
        )
    }

    private var listView: some View {
        List {
            ForEach(viewModel.savedTracks) { track in
                FavoritesRowView(track: track)
            }
            .onDelete(perform: viewModel.delete)
        }
    }
}
