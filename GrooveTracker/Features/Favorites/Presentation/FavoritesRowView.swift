//
//  FavoritesRowView.swift
//  GrooveTracker
//
//  Created by Juan Adolfo Velazquez Reyes on 01/07/26.
//

import SwiftUI

struct FavoritesRowView: View {
    let track: Track

    var body: some View {
        HStack {
            GTAsyncImage(url: track.coverImageURL)
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading) {
                Text(track.title)
                    .font(.headline)
                    .lineLimit(1)
                Text(track.artistName)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }
        }
    }
}
