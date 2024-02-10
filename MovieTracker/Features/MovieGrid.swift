import SwiftUI

struct MovieGrid: View {
  var movies: [Movie]
  @Binding var hideSpoilers: Bool
  
  var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
  
  var body: some View {
    ScrollView {
      LazyVGrid(columns: threeColumnGrid) {
        ForEach(movies) { movie in
          NavigationLink(destination: MovieDetail(movie: movie, hideSpoilers: Binding.constant(true))) {
            MovieGridCell(movie: movie)
          }
        }
      }
    }
    .navigationTitle("Movies")
  }
}

struct MovieGridCell: View {
  let movie: Movie
  
  var body: some View {
    ZStack(alignment: .topTrailing) {
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
      if movie.viewed {
        Image(systemName: "checkmark.circle.fill")
          .foregroundColor(Color.green)
          .font(.largeTitle)
          .padding(5)
          .background(Circle().foregroundColor(.white))
      }
    }
  }
}

#Preview {
  let preview = PreviewContainer([Movie.self])
  preview.add(items: Movie.previewData)
  return NavigationStack {
    MovieGrid(movies: Movie.previewData, hideSpoilers: Binding.constant(true))
      .modelContainer (preview.container)
  }
}

