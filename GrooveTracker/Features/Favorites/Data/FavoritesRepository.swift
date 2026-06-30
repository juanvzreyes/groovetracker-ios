//
//  FavoritesRepository.swift
//  GrooveTracker
//
//  Created by Juan Adolfo Velazquez Reyes on 29/06/26.
//

import Foundation
import SwiftData

@MainActor
struct FavoritesRepository: FavoritesRepositoryProtocol {
    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func getFavorites() throws -> [Track] {
        let descriptor = FetchDescriptor<SavedTrack>(sortBy: [
            SortDescriptor(\.title)
        ])
        let savedTracks = try context.fetch(descriptor)
        return savedTracks.map { $0.toDomain() }
    }

    func save(track: Track) throws {
        let id = track.id
        let descriptor = FetchDescriptor<SavedTrack>(
            predicate: #Predicate { $0.id == id }
        )
        if try context.fetchCount(descriptor) == 0 {
            let newSavedTrack = SavedTrack(
                id: track.id,
                title: track.title,
                artistName: track.artistName,
                coverImageURL: track.coverImageURL,
                genre: track.genre
            )
            context.insert(newSavedTrack)
            try context.save()
        }
    }

    func delete(trackId: String) throws {
        let descriptor = FetchDescriptor<SavedTrack>(
            predicate: #Predicate { $0.id == trackId }
        )
        if let trackToDelete = try context.fetch(descriptor).first {
            context.delete(trackToDelete)
            try context.save()
        }
    }
}
