//
//  TrackCardView.swift
//  GrooveTracker
//
//  Created by Juan Adolfo Velazquez Reyes on 23/06/26.
//

import SwiftUI

struct TrackCardView: View {
    let track: Track
    var onSave: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            GTAsyncImage(url: track.coverImageURL)
                .aspectRatio(1, contentMode: .fit)
                .cardStyle(cornerRadius: 12, shadowRadius: 4)
            .overlay(alignment: .topTrailing) {
                Button(action: {
                    triggerHapticFeedback(.medium)
                    onSave()
                }) {
                    Image(systemName: "star.circle.fill")
                        .font(.title)
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.white, .black.opacity(0.6))
                        .padding(8)
                }
            }

            Text(track.title)
                .font(.headline)
                .lineLimit(1)

            Text(track.artistName)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(1)

            GTPillTag(text: track.genre)
        }
    }
}
