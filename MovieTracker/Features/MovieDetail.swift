import SwiftUI

struct MovieDetail: View {
  @Binding var movie: Movie
  @EnvironmentObject var movieStore: MovieStore
  @State var isPresentingMovieForm: Bool = false
  @State var editMovieFormData: Movie.FormData = Movie.FormData()

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
      Toggle("Have Seen", isOn: $movie.viewed)
        .fixedSize()
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
                let editedMovie = Movie.update(movie, from: editMovieFormData)
                movieStore.updateMovie(editedMovie)
                isPresentingMovieForm.toggle()
              }
            }
          }
      }
    }

  }
}

struct MovieDetail_Previews: PreviewProvider {
  static var previews: some View {
    MovieDetail(movie: Binding.constant(Movie.previewData[0]))
  }
}
