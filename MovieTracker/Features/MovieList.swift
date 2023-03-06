import SwiftUI

struct MovieList: View {
  @State var movies: [Movie] = Movie.previewData
  @EnvironmentObject var movieStore: MovieStore
  @State var isPresentingMovieForm: Bool = false
  @State var newMovieFormData = Movie.FormData()

  @Environment(\.scenePhase) private var scenePhase
  let saveAction: () -> Void

  var body: some View {
    NavigationStack {
      List($movieStore.movies) { $movie in
        NavigationLink(destination: MovieDetail(movie: $movie)) {
          MovieRow(movie: movie)
        }
      }
      .padding()
      .navigationTitle("Movies")
      .listStyle(.plain)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Add") { isPresentingMovieForm.toggle() }
        }
      }
      .sheet(isPresented: $isPresentingMovieForm) {
        NavigationStack {
          MovieForm(data: $newMovieFormData)
            .toolbar {
              ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") { isPresentingMovieForm.toggle()
                    newMovieFormData = Movie.FormData()
                }

              }
              ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                  let newMovie = Movie.create(from: newMovieFormData)
                  movieStore.createMovie(newMovie)
                  isPresentingMovieForm.toggle()
                  newMovieFormData = Movie.FormData()
                }
              }
            }
        }
      }
    }
    .onChange(of: scenePhase) { phase in
        if phase == .inactive { saveAction() }
    }

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

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MovieList() {}
      .environmentObject(MovieStore())
  }
}
