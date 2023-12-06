import SwiftUI
import SwiftData

@main
struct MovieTrackerApp: App {
    var body: some Scene {
        WindowGroup {
          TabContainer()
            .modelContainer(for: [Movie.self])
        }
        .modelContainer(for: [Movie.self])
    }
}
