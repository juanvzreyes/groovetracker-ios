//
//  GetTracksUseCase.swift
//  GrooveTracker
//
//  Created by Juan Adolfo Velazquez Reyes on 19/06/26.
//

import Foundation

protocol GetTracksUseCaseProtocol {
    func execute(query: String) async throws -> [Track]
}

struct GetTracksUseCase: GetTracksUseCaseProtocol {
    let repository: DiscoveryRepositoryProtocol

    func execute(query: String) async throws -> [Track] {
        let cleanQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !cleanQuery.isEmpty else {
            return []
        }

        return try await repository.searchTracks(query: cleanQuery)
    }
}
