import SwiftUI

struct MovieList: View {
  let movies: [Movie] = Movie.previewData

  var body: some View {
    NavigationStack {
      List(movies) { movie in
        NavigationLink(value: movie) {
          HStack(alignment: .top) {
            AsyncImage(url: movie.posterUrl, content: { image in
              image
                .resizable()
                .aspectRatio(contentMode: .fit)
            }, placeholder: {
              if movie.posterUrl != nil {
                ProgressView()
              } else {
                Image(systemName: "film.fill")
              }
            })
            .frame(maxWidth: 100, maxHeight: 100)
            Text(movie.title)
              .font(.title2)
          }
        }
      }
      .navigationDestination(for: Movie.self) { movie in
        MovieDetail(movie: movie)
      }
      .padding()
      .navigationTitle("Movies")
      .listStyle(.plain)
    }

  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MovieList()
  }
}
