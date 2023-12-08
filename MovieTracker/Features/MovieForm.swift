import SwiftUI

struct MovieForm: View {
  @Binding var data: Movie.FormData

  var body: some View {
    Form {
      TextFieldWithLabel(label: "Title", text: $data.title, prompt: "Enter a Title")
      Picker(selection: $data.genre, label: Text("Genre")) {
        ForEach(Movie.Genre.allCases) { genre in
          Text(genre.rawValue)
        }
      }
      .pickerStyle(.menu)
      TextFieldWithLabel(label: "Poster URL", text: $data.posterUrl, prompt: "Enter a URL")
      VStack(alignment: .leading) {
        Text("Synopsis")
          .modifier(FormLabel())
        TextEditor(text: $data.synopsis)
      }
      TextFieldWithLabel(label: "Directed By", text: $data.directedBy, prompt: "Who yelled 'Action!'")
    }
  }
}

#Preview {
  MovieForm(data: Binding.constant(Movie.FormData()))
}
