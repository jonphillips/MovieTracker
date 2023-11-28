import SwiftUI

struct MovieDetail: View {
  let movie: Movie

  var body: some View {
    ScrollView {
      AsyncImage(url: movie.posterUrl)
      Text(movie.title)
        .font(.largeTitle)
      if movie.viewed {
        Text("I have seen")
      } else {
        Text("Not yet seen")
      }
//      Text(movie.viewed ? "I have seen" : "Not yet seen")
      if let synopsis = movie.synopsis {
        Text(synopsis)
          .font(.caption)
          .padding()
      }
      Text("Starring")
        .font(.headline)
        .padding(.top, 20)
      ForEach(movie.performers) { performer in
        Text(performer.name)
      }
      if let directedBy = movie.directedBy {
        Text("Directed By")
          .font(.headline)
          .padding(.top, 20)
        Text(directedBy)
      }
    }
  }
}

#Preview {
  VStack {
    MovieDetail(movie: Movie.previewData[1])
    MovieDetail(movie: Movie.previewData[2])
    MovieDetail(movie: Movie.previewData[3])
  }
}
