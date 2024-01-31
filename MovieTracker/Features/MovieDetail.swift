import SwiftUI

struct MovieDetail: View {
  @Bindable var movie: Movie
  @Binding var hideSpoilers: Bool

  var body: some View {
    ScrollView {
      Toggle("No Spoilers!", isOn: $hideSpoilers)
      AsyncImage(url: movie.posterUrl)

      Text(movie.title)
        .font(.largeTitle)
      if movie.viewed {
        Text("I have seen")
      } else {
        Text("Not yet seen")
      }
      Button { movie.viewed.toggle() } label: { Text(movie.viewed ? "I have seen" : "Not yet seen") }
//      Toggle("Have Seen", isOn: $movie.viewed)
//        .fixedSize()
//      Text(movie.viewed ? "I have seen" : "Not yet seen")
      if !hideSpoilers {
        if let synopsis = movie.synopsis {
          Text(synopsis)
        }
        Text("Starring")
          .font(.headline)
          .padding(.top, 20)
        ForEach(movie.performers) { performer in
          Text(performer.name)
        }
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
  MovieDetail(movie: Movie.previewData[0], hideSpoilers: Binding.constant(false))
  }

