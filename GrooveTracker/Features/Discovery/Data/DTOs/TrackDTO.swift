//
//  TrackDTO.swift
//  GrooveTracker
//
//  Created by Juan Adolfo Velazquez Reyes on 18/06/26.
//

import Foundation

struct TrackResponseDTO: Decodable {
    let resultCount: Int
    let results: [TrackDTO]
}

struct TrackDTO: Decodable {
    let trackId: Int
    let trackName: String?
    let artistName: String?
    let artworkUrl100: String?
    let primaryGenreName: String?

    func toDomain() -> Track {
        return Track(
            id: String(self.trackId),
            title: self.trackName ?? "Pista desconocida",
            artistName: self.artistName ?? "Artista desconocido",
            coverImageURL: highResCoverURL,
            bpm: nil,
            key: nil,
            genre: self.primaryGenreName ?? "Desconocido"
        )
    }

    private var highResCoverURL: URL? {
        guard let url = artworkUrl100?.replacingOccurrences(of: "100x100", with: "600x600")
        else { return nil }
        return URL(string: url)
    }
}
