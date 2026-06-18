//
//  Artist.swift
//  GrooveTracker
//
//  Created by Juan Adolfo Velazquez Reyes on 18/06/26.
//

import Foundation

struct Artist: Identifiable, Equatable {
    let id: String
    let name: String
    let imageURL: URL?
    let genres: [String]
}
