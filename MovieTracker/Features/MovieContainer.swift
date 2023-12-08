import SwiftUI
import SwiftData


struct MovieContainer: View {
  @Environment(\.modelContext) var modelContext
  @Query(sort: \Movie.title) private var movies: [Movie]
  @State var displayState: MovieDisplayState = .list

  enum MovieDisplayState {
    case list
    case grid
  }
  
  var body: some View {
    NavigationStack {
      VStack {
        Picker("displayState", selection: $displayState) {
          Text("List").tag(MovieDisplayState.list)
          Text("Grid").tag(MovieDisplayState.grid)
        }.pickerStyle(.segmented)
          .padding()
        switch displayState {
        case .list: MovieList(movies: movies)
        case .grid: MovieGrid(movies: movies)
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
}

#Preview {
  do {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: Movie.self, configurations: config)
    return MovieContainer().modelContainer (container)
  } catch {
    fatalError("Failed to create model container.")
  }
}
