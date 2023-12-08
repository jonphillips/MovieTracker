import SwiftUI
import SwiftData

struct MovieList: View {
  @Environment(\.modelContext) private var modelContext
  var movies: [Movie]
  @State var hideSpoilers: Bool = false
  @State var isPresentingMovieForm: Bool = false
  @State var newMovieFormData = Movie.FormData()
  
  var body: some View {
    NavigationStack {
      Toggle("No Spoilers!", isOn: $hideSpoilers)
        .padding(.horizontal)
      List(movies) { movie in
        NavigationLink(destination: MovieDetail(movie: movie, hideSpoilers: $hideSpoilers)) {
          MovieRow(movie: movie)
        }
      }
      .padding()
      .navigationTitle("Movies")
      .listStyle(.plain)
      .onAppear {
        if movies.isEmpty {
          for movie in Movie.previewData {
            modelContext.insert(movie)
          }
        }
      }
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Add") {
            isPresentingMovieForm.toggle()
          }
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
                  Movie.create(from: newMovieFormData, context: modelContext)
                  newMovieFormData = Movie.FormData()
                  isPresentingMovieForm.toggle()                }
              }
            }
            .navigationTitle("Add Movie")
        }
      }
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


#Preview {
  do {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: Movie.self, configurations: config)
    return MovieList(movies: Movie.previewData)
      .modelContainer (container)
  } catch {
    fatalError("Failed to create model container.")
  }
}
