//
//  BadgeViewStyle.swift
//  DemanglePod
//
//  Created by Kerr Marin Miller on 04/01/2022.
//

import SwiftUI

public protocol BadgeViewStyle {
    /// The configuration that has the views that are available for placing and styling within a `BadgeView`.
    typealias Configuration = BadgeViewStyleConfiguration
    /// The view that will be returned after configuring and placing all `BadgeView` components.
    associatedtype Body: View

    /// Creates the body of the `BadgeView` for each of the particular implementations of `BadgeViewStyle`.
    /// Use the `configuration` parameter passed in to get access to the (optional) image and title in the `BadgeView`.
    /// - Returns: a new view, configured and styled.
    func makeBody(configuration: Self.Configuration) -> Self.Body
}

public struct BadgeViewStyleConfiguration {

    /// The title shown in a badge view
    public struct Title: View {
        private let text: String

        init(text: String) {
            self.text = text
        }

        public var body: some View {
            return Text(self.text)
        }
    }

    /// A description of the badge view item.
    public private(set) var title: BadgeViewStyleConfiguration.Title?
}

// MARK: - Style implementations

public struct PrimaryBadgeViewStyle: BadgeViewStyle {

    public func makeBody(configuration: Configuration) -> some View {
        configuration.title
            .background(Color.red)
    }

    public init() { }
}

public struct SecondaryBadgeViewStyle: BadgeViewStyle {

    public func makeBody(configuration: Configuration) -> some View {
        configuration.title
            .background(Color.blue)
    }

    public init() { }
}
