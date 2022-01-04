//
//  BadgeViewStyle+Environment.swift
//  DemanglePod
//
//  Created by Kerr Marin Miller on 04/01/2022.
//

import SwiftUI

struct BadgeViewStyleKey: EnvironmentKey {
    static var defaultValue = AnyBadgeViewStyle(style: PrimaryBadgeViewStyle())
}

extension EnvironmentValues {
    var badgeStyle: AnyBadgeViewStyle {
        get { self[BadgeViewStyleKey.self] }
        set { self[BadgeViewStyleKey.self] = newValue }
    }
}
