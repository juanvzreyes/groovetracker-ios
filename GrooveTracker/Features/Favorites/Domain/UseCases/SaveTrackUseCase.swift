//
//  SaveTrackUseCase.swift
//  GrooveTracker
//
//  Created by Juan Adolfo Velazquez Reyes on 29/06/26.
//

import Foundation

protocol SaveTrackUseCaseProtocol {
    func execute(track: Track) throws
}

struct SaveTrackUseCase: SaveTrackUseCaseProtocol {
    let repository: FavoritesRepositoryProtocol

    func execute(track: Track) throws {
        try repository.save(track: track)
    }
}
