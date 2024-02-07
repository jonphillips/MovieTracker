import SwiftUI

struct MovieList: View {
  @Binding var movies: [Movie]
  @Binding var hideSpoilers: Bool
  
  func deleteMovie(_ movie: Movie) {
    if let index = movies.firstIndex(where: { $0.id == movie.id }) {
      movies.remove(at: index)
    }
  }
  
  var body: some View {
    Toggle("No Spoilers!", isOn: $hideSpoilers)
      .padding(.horizontal)
    List(movies) { movie in
      NavigationLink(destination: MovieDetail(movie: movie, hideSpoilers: $hideSpoilers)) {
        MovieRow(movie: movie)
          .swipeActions(edge: .leading) {
            Button {
              movie.viewed.toggle()
            } label: {
              Label(movie.viewed ? "UnView" : "Viewed", systemImage: movie.viewed ? "video.slash.fill" : "eyes")
            }
            .tint(movie.viewed ? .gray : .blue)
          }
          .swipeActions(edge: .trailing) {
            Button(role: .destructive) {
              deleteMovie(movie)
            } label: {
              Label("Delete", systemImage: "trash")
            }
          }
      }
    }
    .listStyle(.plain)
    .padding()
  }
}

#Preview {
  MovieList(movies: Binding.constant(Movie.previewData), hideSpoilers: Binding.constant(true))
}

struct MovieRow: View {
  let movie: Movie
  var body: some View {
    HStack(alignment: .top) {
      AsyncImage(url: movie.posterUrl) { image in
        image
          .resizable()
          .aspectRatio(contentMode: .fit)
      } placeholder: {
        if movie.posterUrl != nil {
          ProgressView()
        } else {
          Image(systemName: "film.fill")
        }
      }
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
