import SwiftUI

struct MovieDetail: View {
  @Bindable var movie: Movie
  @Binding var hideSpoilers: Bool
  @State private var isPresentingMovieForm: Bool = false
  @State private var editMovieFormData: Movie.FormData = Movie.FormData()

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
      Toggle("Have Seen", isOn: Bindable(movie).viewed)
        .fixedSize()
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
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button("Edit") {
          editMovieFormData = movie.dataForForm
          isPresentingMovieForm.toggle()
        }
      }
    }
    .sheet(isPresented: $isPresentingMovieForm) {
      NavigationStack {
        MovieForm(data: $editMovieFormData)
          .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
              Button("Cancel") { isPresentingMovieForm.toggle() }

            }
            ToolbarItem(placement: .navigationBarTrailing) {
              Button("Save") {
                Movie.update(movie, from: editMovieFormData)
                isPresentingMovieForm.toggle()
              }
            }
          }
      }
    }
  }
}

#Preview {
  let preview = PreviewContainer([Movie.self])
  let movie = Movie.previewData[0]
  return NavigationStack {
    MovieDetail(movie: movie, hideSpoilers: Binding.constant(true))
      .modelContainer (preview.container)
  }
}

