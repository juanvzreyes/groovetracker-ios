//
//  Item.swift
//  GrooveTracker
//
//  Created by Juan Adolfo Velazquez Reyes on 16/06/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
