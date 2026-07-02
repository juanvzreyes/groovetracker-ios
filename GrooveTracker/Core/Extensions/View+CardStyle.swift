//
//  View+CardStyle.swift
//  GrooveTracker
//
//  Created by Juan Adolfo Velazquez Reyes on 01/07/26.
//

import SwiftUI

extension View {
    public func cardStyle(cornerRadius: CGFloat = 12, shadowRadius: CGFloat = 4)
        -> some View
    {
        self
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .shadow(radius: shadowRadius)
    }
}
