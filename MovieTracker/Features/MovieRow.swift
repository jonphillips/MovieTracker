import SwiftUI

struct MovieRow: View {
  @Environment(\.modelContext) private var modelContext
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
        modelContext.delete(movie)
      } label: {
        Label("Delete", systemImage: "trash")
      }
    }
  }
}

#Preview {
  let preview = PreviewContainer([Movie.self])
  let movie = Movie.previewData[0]
  return
    MovieRow(movie: movie).modelContainer (preview.container)
    .padding()

}
