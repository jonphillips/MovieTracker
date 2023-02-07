import SwiftUI


struct MovieContainer: View {
  @State var movies = Movie.previewData
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
        case .list: MovieList(movies: $movies)
        case .grid: MovieGrid(movies: $movies)
        }
      }
      .navigationTitle("Movies")
    }
  }
}

struct MovieContainer_Previews: PreviewProvider {
  static var previews: some View {
    MovieContainer()
  }
}
