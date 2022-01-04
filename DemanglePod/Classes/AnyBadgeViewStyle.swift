//
//  AnyBadgeViewStyle.swift
//  DemanglePod
//
//  Created by Kerr Marin Miller on 04/01/2022.
//

import SwiftUI

struct AnyBadgeViewStyle: BadgeViewStyle {
    private var _makeBody: (Configuration) -> AnyView

    init<S: BadgeViewStyle>(style: S) {
        _makeBody = { configuration in
            AnyView(style.makeBody(configuration: configuration))
        }
    }

    func makeBody(configuration: Configuration) -> some View {
        _makeBody(configuration)
    }
}
