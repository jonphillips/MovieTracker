import SwiftUI

struct MovieForm: View {
  @Binding var data: Movie.FormData

  var body: some View {
    Form {
      VStack(alignment: .leading) {
        Text("Title")
          .bold()
          .font(.caption)
        TextField("Title", text: $data.title, prompt: Text("Enter a Title"))
      }
      Picker(selection: $data.genre, label: Text("Genre")) {
        ForEach(Movie.Genre.allCases) { genre in
          Text(genre.rawValue)
        }
      }
      .pickerStyle(.menu)
      VStack(alignment: .leading) {
        Text("Poster URL")
          .bold()
          .font(.caption)
        TextField("Poster URL", text: $data.posterUrl, prompt: Text("Enter a URL"))
      }
      VStack(alignment: .leading) {
        Text("Synopsis")
          .bold()
          .font(.caption)
        TextEditor(text: $data.synopsis)
      }
      VStack(alignment: .leading) {
        Text("Directed By")
          .bold()
          .font(.caption)
        TextField("Directed By", text: $data.directedBy, prompt: Text("Who yelled 'Action!'"))
      }
    }
  }
}


#Preview {
  MovieForm(data: Binding.constant(Movie.FormData()))
}
