//
//  Track.swift
//  GrooveTracker
//
//  Created by Juan Adolfo Velazquez Reyes on 18/06/26.
//

import Foundation

struct Track: Identifiable, Equatable {
    let id: String
    let title: String
    let artistName: String
    let coverImageURL: URL?
    let bpm: Int?
    let key: String?
    let genre: String
}
