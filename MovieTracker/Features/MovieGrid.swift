import SwiftUI

struct MovieGrid: View {
  var movies: [Movie]

  var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

  var body: some View {
    NavigationStack {
      LazyVGrid(columns: threeColumnGrid) {
        ForEach(movies) { movie in
          NavigationLink(destination: MovieDetail(movie: movie, hideSpoilers: Binding.constant(true))) {
            Text(movie.title).foregroundColor(.black)
              .font(.headline)
              .padding()
          }
        }
      }
      .navigationTitle("Movies")
    }
  }
}

#Preview {
    MovieGrid(movies: Movie.previewData)
  }

