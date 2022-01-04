import SwiftUI

public struct BadgeView: View {

    @Environment(\.badgeStyle) private var style

    private let title: String

    public init(title: String) {
        self.title = title
    }

    public var body: some View {
        self.style
            .makeBody(configuration: AnyBadgeViewStyle.Configuration(title: AnyBadgeViewStyle.Configuration.Title(text: self.title)))
    }
}

// CRASH
// IF YOU CHANGE THIS LINE TO: `public extension BadgeView {` THE CRASH WILL NOT HAPPEN
public extension View where Self == BadgeView {

    /// Sets the style for any `BadgeView` in the hierarchy to the given `BadgeViewStyle`.
    /// - Returns: a new view, with the environment configured for the new badge view.
    func badgeViewStyle<S: BadgeViewStyle>(_ style: S) -> some View {
        self.environment(\.badgeStyle, AnyBadgeViewStyle(style: style))
    }
}
