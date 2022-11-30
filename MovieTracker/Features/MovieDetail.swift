import SwiftUI

struct MovieDetail: View {
  @Binding var movie: Movie

  func seenCheckmark(_ viewed: Bool) -> some View {
    Image(systemName: viewed ? "checkmark.circle.fill" : "circle")
        .foregroundColor(viewed ? .green : .black)
        .font(.largeTitle)
        .scaleEffect(viewed ? 1.5 : 1)
        .animation(.easeInOut(duration: 2), value: viewed)
  }

  var body: some View {
    ScrollView {
      AsyncImage(url: movie.posterUrl)
      Text(movie.title)
        .font(.largeTitle)
      Text(movie.viewed ? "I have seen" : "Not yet seen")
      if movie.viewed {
        Text("I have seen")
      } else {
        Text("Not yet seen")
      }

      seenCheckmark(movie.viewed)
        .frame(maxWidth: .infinity, alignment: movie.viewed ? .leading : .trailing)

      if movie.viewed {
        seenCheckmark(movie.viewed)
          .frame(maxWidth: .infinity, alignment: .leading)
      } else {
        seenCheckmark(movie.viewed)
          .frame(maxWidth: .infinity, alignment: .trailing)
      }


      Toggle("Viewed?", isOn: withAnimation { $movie.viewed })
        .fixedSize()
//        .padding(.horizontal, 30)
      Button { movie.viewed = (self.movie.viewed ? false : true) } label: {
        Text(movie.viewed ? "Change to Unviewed" : "Change to Viewed")
          .foregroundColor(.white)
          .font(.title)
          .padding()
          .background(
            RoundedRectangle(cornerRadius: 10)
              .fill(Color.blue)
          )
      }
      Text("Starring")
        .font(.headline)
        .padding(.top, 20)
      ForEach(movie.performers) { performer in
        Text(performer.name)
      }
    }
  }
}

struct MovieDetail_Previews: PreviewProvider {
  static var previews: some View {
    MovieDetail(movie: Binding.constant(Movie.previewData[0]))
  }
}
