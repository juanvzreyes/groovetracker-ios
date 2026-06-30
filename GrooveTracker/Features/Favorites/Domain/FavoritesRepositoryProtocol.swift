//
//  FavoritesRepositoryProtocol.swift
//  GrooveTracker
//
//  Created by Juan Adolfo Velazquez Reyes on 29/06/26.
//

import Foundation

protocol FavoritesRepositoryProtocol {
    func getFavorites() throws -> [Track]
    func save(track: Track) throws
    func delete(trackId: String) throws
}
