import SwiftUI
import SwiftData

@main
struct MovieTrackerApp: App {
    var body: some Scene {
        WindowGroup {
<<<<<<< HEAD
          MovieList()
            .modelContainer(for: [Movie.self])
=======
          TabContainer()
>>>>>>> ea480955367deb9467257a3ab549b938d6d751c6
        }
        .modelContainer(for: [Movie.self])
    }
}
