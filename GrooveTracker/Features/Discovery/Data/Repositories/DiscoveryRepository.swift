//
//  DiscoveryRepository.swift
//  GrooveTracker
//
//  Created by Juan Adolfo Velazquez Reyes on 23/06/26.
//

import Foundation

struct DiscoveryRepository: DiscoveryRepositoryProtocol {
    let httpClient: HTTPClientProtocol

    func searchTracks(query: String) async throws -> [Track] {
        let formattedQuery = query.replacingOccurrences(of: " ", with: "+")
        let urlString = "https://itunes.apple.com/search?term=\(formattedQuery)&media=music&entity=song&limit=25"

        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }

        let request = URLRequest(url: url)
        let responseDTO: TrackResponseDTO = try await httpClient.fetch(request: request)
        let tracks: [Track] = responseDTO.results.map { dto in
            dto.toDomain()
        }

        return tracks
    }
}
