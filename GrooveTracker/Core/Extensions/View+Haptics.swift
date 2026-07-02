//
//  View+Haptics.swift
//  GrooveTracker
//
//  Created by Juan Adolfo Velazquez Reyes on 01/07/26.
//

import SwiftUI
import UIKit

extension View {
    public func triggerHapticFeedback(
        _ style: UIImpactFeedbackGenerator.FeedbackStyle = .medium
    ) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
