import SwiftUI


struct MovieContainer: View {
  @State var movies = Movie.previewData
  @State var displayState: MovieDisplayState = .list
  @State var hideSpoilers: Bool = false
  
  
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
      case .list: MovieList(movies: $movies, hideSpoilers: $hideSpoilers)
      case .grid: MovieGrid(movies: $movies, hideSpoilers: $hideSpoilers)
      }
    }
    .navigationTitle("Movies")
  }
}

struct MovieContainer_Previews: PreviewProvider {
  static var previews: some View {
    MovieContainer()
  }
}
