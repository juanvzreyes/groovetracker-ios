//
//  SavedTrack.swift
//  GrooveTracker
//
//  Created by Juan Adolfo Velazquez Reyes on 29/06/26.
//

import Foundation
import SwiftData

@Model
final class SavedTrack {
    @Attribute(.unique) var id: String
    var title: String
    var artistName: String
    var coverImageURL: URL?
    var genre: String
    var practiceNotes: String

    init(
        id: String,
        title: String,
        artistName: String,
        coverImageURL: URL?,
        genre: String,
        practiceNotes: String = ""
    ) {
        self.id = id
        self.title = title
        self.artistName = artistName
        self.coverImageURL = coverImageURL
        self.genre = genre
        self.practiceNotes = practiceNotes
    }

    func toDomain() -> Track {
        return Track(
            id: self.id,
            title: self.title,
            artistName: self.artistName,
            coverImageURL: self.coverImageURL,
            bpm: nil,
            key: nil,
            genre: self.genre
        )
    }
}
