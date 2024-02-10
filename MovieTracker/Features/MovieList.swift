import SwiftUI
import SwiftData

struct MovieList: View {
  @Environment(\.modelContext) private var modelContext
  var movies: [Movie]
  @Binding var hideSpoilers: Bool
  @State private var isPresentingMovieForm: Bool = false
  @State private var newMovieFormData = Movie.FormData()
  
  var body: some View {
    Toggle("No Spoilers!", isOn: $hideSpoilers)
      .padding(.horizontal)
    List(movies) { movie in
      NavigationLink(destination: MovieDetail(movie: movie, hideSpoilers: $hideSpoilers)) {
        MovieRow(movie: movie)
      }
    }
    .listStyle(.plain)
    .navigationTitle("Movies")
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



#Preview {
  let preview = PreviewContainer([Movie.self])
  preview.add(items: Movie.previewData)
  return NavigationView {
    MovieList(movies: Movie.previewData, hideSpoilers: Binding.constant(true))
      .modelContainer (preview.container)
  }}
