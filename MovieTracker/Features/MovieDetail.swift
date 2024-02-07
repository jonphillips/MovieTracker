import SwiftUI

struct MovieDetail: View {
  @Bindable var movie: Movie
  @Binding var hideSpoilers: Bool
  
  var body: some View {
    ScrollView {
      Toggle("No Spoilers!", isOn: $hideSpoilers)
        .padding(.horizontal)
      AsyncImage(url: movie.posterUrl)
      Text(movie.genre.rawValue.uppercased())
        .font(.headline)
        .padding(.bottom, 20)
      Text(movie.title)
        .font(.largeTitle)
      Button { movie.viewed.toggle() } label : {
        Text(movie.viewed ? "I have seen" : "Not yet seen")
      }
      Toggle("Have Seen", isOn: $movie.viewed)
        .fixedSize()
      if !hideSpoilers {
        Text("Starring")
          .font(.headline)
          .padding(.top, 20)
        if let synopsis = movie.synopsis {
          Text(synopsis)
        }
      }
      ForEach(movie.performers) { performer in
        Text(performer.name)
      }
    }
  }
}

#Preview {
  MovieDetail(movie: Movie.previewData[0], hideSpoilers: Binding.constant(false))
}
