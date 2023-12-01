import SwiftUI

struct MovieDetail: View {
  var movie: Movie

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
      Toggle("Have Seen", isOn: Bindable(movie).viewed)
        .fixedSize()
//      Text(movie.viewed ? "I have seen" : "Not yet seen")

      if let synopsis = movie.synopsis {
        Text(synopsis)
      }
      Text("Starring")
        .font(.headline)
        .padding(.top, 20)
      ForEach(movie.performers.sorted(by: Performer.nameSorter)) { performer in
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

struct MovieDetail_Previews: PreviewProvider {
  static var previews: some View {
    MovieDetail(movie: Movie.previewData[0])
  }
}
