import SwiftUI
import SwiftData

struct MovieList: View {
  @Environment(\.modelContext) private var modelContext
  @Query(sort: \Movie.title) private var movies: [Movie]
  @State var hideSpoilers: Bool = false

  var body: some View {
    NavigationStack {
      Toggle("No Spoilers!", isOn: $hideSpoilers)
        .padding(.horizontal)
      List(movies) { movie in
        NavigationLink(destination: MovieDetail(movie: movie, hideSpoilers: $hideSpoilers)) {
          MovieRow(movie: movie)
        }
      }
      .padding()
      .navigationTitle("Movies")
      .listStyle(.plain)
      .onAppear {
        if movies.isEmpty {
          for movie in Movie.previewData {
            modelContext.insert(movie)
          }
        }
      }
    }
    .listStyle(.plain)
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


#Preview {
  MovieList()
}
