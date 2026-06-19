//
//  DiscoveryRepositoryProtocol.swift
//  GrooveTracker
//
//  Created by Juan Adolfo Velazquez Reyes on 19/06/26.
//

import Foundation

protocol DiscoveryRepositoryProtocol {
    func searchTracks(query: String) async throws -> [Track]
}
