import SwiftUI

@main
struct MovieTrackerApp: App {
  @StateObject var movieStore = MovieStore()

  @State var hasSaveLoadError: Bool = false
  @State var currentError: Error?
  @State var errorGuidance: String?

  var body: some Scene {
    WindowGroup {
      MovieList(saveAction: {
        Task {
          do {
            try await MovieStore.save(movies: movieStore.movies)
          } catch {
            hasSaveLoadError = true
            currentError = error
            errorGuidance = "Try again later."
          }
        }
      })
      .environmentObject(movieStore)
      .task {
        do {
          movieStore.movies = try await MovieStore.load()
          if movieStore.movies.isEmpty {
            movieStore.movies = Movie.previewData
          }
        } catch {
          hasSaveLoadError = true
          currentError = error
          errorGuidance = "Try again later."
        }
      }
      .alert("Error", isPresented: $hasSaveLoadError, actions: {
        Button("OK") {
          self.hasSaveLoadError = false
          self.currentError = nil
          self.errorGuidance = nil
        }}, message: {
          VStack {
            Text(currentError?.localizedDescription ?? "Error")
            Text(errorGuidance ?? "")
          }
        })
    }
  }
}
