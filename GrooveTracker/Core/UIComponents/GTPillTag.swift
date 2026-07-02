//
//  GTPillTag.swift
//  GrooveTracker
//
//  Created by Juan Adolfo Velazquez Reyes on 01/07/26.
//

import SwiftUI

public struct GTPillTag: View {
    let text: String
    var backgroundColor: Color = Color(.systemGroupedBackground)
    var font: Font = .caption
    var paddingHorizontal: CGFloat = 8
    var paddingVertical: CGFloat = 4

    public init(
        text: String,
        backgroundColor: Color = Color(.systemGroupedBackground),
        font: Font = .caption,
        paddingHorizontal: CGFloat = 8,
        paddingVertical: CGFloat = 4
    ) {
        self.text = text
        self.backgroundColor = backgroundColor
        self.font = font
        self.paddingHorizontal = paddingHorizontal
        self.paddingVertical = paddingVertical
    }

    public var body: some View {
        Text(text)
            .font(font)
            .padding(.horizontal, paddingHorizontal)
            .padding(.vertical, paddingVertical)
            .background(backgroundColor)
            .clipShape(Capsule())
    }
}
