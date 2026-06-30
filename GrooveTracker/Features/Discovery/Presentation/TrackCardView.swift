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
            AsyncImage(url: track.coverImageURL) { phase in
                switch phase {
                case .empty:
                    ZStack {
                        Color(.systemGray6)
                        ProgressView()
                    }
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure:
                    ZStack {
                        Color(.systemGray6)
                        Image(systemName: "music.note")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                    }
                @unknown default:
                    Color(.systemGray6)
                }
            }
            .aspectRatio(1, contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 4)
            .overlay(alignment: .topTrailing) {
                Button(action: {
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
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

            Text(track.genre)
                .font(.caption)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color(.systemGroupedBackground))
                .clipShape(Capsule())
        }
    }
}
