import SwiftUI

@main
struct MovieTrackerApp: App {
    var body: some Scene {
        WindowGroup {
          MovieList()
            .modelContainer(for: [Movie.self])
        }
    }
}
