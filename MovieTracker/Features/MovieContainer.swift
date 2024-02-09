import SwiftUI
import SwiftData


struct MovieContainer: View {
  @Environment(\.modelContext) var modelContext
  @Query(sort: \Movie.title) var movies: [Movie]
  @State private var displayState: MovieDisplayState = .list
  @State private var hideSpoilers: Bool = false

  enum MovieDisplayState {
    case list
    case grid
  }
  
  var body: some View {
    VStack {
      Picker("displayState", selection: $displayState) {
        Text("List").tag(MovieDisplayState.list)
        Text("Grid").tag(MovieDisplayState.grid)
      }.pickerStyle(.segmented)
        .padding()
      switch displayState {
      case .list: MovieList(movies: movies, hideSpoilers: $hideSpoilers)
      case .grid: MovieGrid(movies: movies, hideSpoilers: $hideSpoilers)
      }
    }
    .navigationTitle("Movies")
    .onAppear {
      if movies.isEmpty {
        for movie in Movie.previewData {
          modelContext.insert(movie)
        }
      }
    }
  }
}

#Preview {
  do {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: Movie.self, configurations: config)
    return NavigationStack { MovieContainer().modelContainer (container) }
  } catch {
    fatalError("Failed to create model container.")
  }
}
