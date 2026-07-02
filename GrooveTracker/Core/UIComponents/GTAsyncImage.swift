//
//  GTAsyncImage.swift
//  GrooveTracker
//
//  Created by Juan Adolfo Velazquez Reyes on 01/07/26.
//

import SwiftUI

public struct GTAsyncImage: View {
    let url: URL?

    public init(url: URL?) {
        self.url = url
    }

    public var body: some View {
        AsyncImage(url: url) { phase in
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
    }
}
