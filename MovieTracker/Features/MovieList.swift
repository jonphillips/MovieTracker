import SwiftUI

struct MovieList: View {
  @State var movies: [Movie] = Movie.previewData

  var body: some View {
    NavigationStack {
      List($movies) { $movie in
        NavigationLink(destination: MovieDetail(movie: $movie)) {
          MovieRow(movie: movie)
        }
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

struct MovieRow: View {
  let movie: Movie

  var body: some View {
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
      Spacer()
      VStack {
        Spacer()
        Image(systemName: movie.viewed ? "checkmark.circle.fill" : "circle")
          .foregroundColor(movie.viewed ? Color.green : Color.black)
        Spacer()
      }

    }
  }
}
