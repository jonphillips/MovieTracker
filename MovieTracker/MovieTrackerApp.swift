import SwiftUI

@main
struct MovieTrackerApp: App {
  @StateObject var movieStore = MovieStore()

  var body: some Scene {
    WindowGroup {
      MovieList()
        .environmentObject(movieStore)
    }
  }
}
