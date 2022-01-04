//
//  BadgeViewContainer.swift
//  DemanglePod
//
//  Created by Kerr Marin Miller on 04/01/2022.
//

import SwiftUI

public struct BadgeViewContainer: View {
    public var body: some View {
        HStack {
            Text("Test")
            BadgeView(title: "Test")
                // If you don't run this line the crash doesn't happen
                .badgeViewStyle(SecondaryBadgeViewStyle())
        }
    }

    public init() { }
}
