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

// You would need this code if you were going to use .navigationDestination
//  .navigationDestination(for: Binding<Movie>.self) { movieBinding in
//    MovieDetail(movie: movieBinding)
//  }
//extension Binding: Equatable where Value: Equatable {
//    public static func == (lhs: Binding<Value>, rhs: Binding<Value>) -> Bool {
//        return lhs.wrappedValue == rhs.wrappedValue
//    }
//}
//
//extension Binding: Hashable where Value: Hashable {
//    public func hash(into hasher: inout Hasher) {
//        self.wrappedValue.hash(into: &hasher)
//    }
//}

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
