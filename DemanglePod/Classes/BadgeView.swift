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

extension EnvironmentValues {
    var badgeStyle: AnyBadgeViewStyle {
        get { self[BadgeViewStyleKey.self] }
        set { self[BadgeViewStyleKey.self] = newValue }
    }
}

struct BadgeViewStyleKey: EnvironmentKey {
    static var defaultValue = AnyBadgeViewStyle(style: PrimaryBadgeViewStyle())
}

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


public extension View where Self == BadgeView {

    /// Sets the style for any `BadgeView` in the hierarchy to the given `BadgeViewStyle`.
    /// - Returns: a new view, with the environment configured for the new badge view.
    func badgeViewStyle<S: BadgeViewStyle>(_ style: S) -> some View {
        self.environment(\.badgeStyle, AnyBadgeViewStyle(style: style))
    }
}
