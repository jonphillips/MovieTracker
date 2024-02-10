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
          .frame(height: 200)
      }
      TextFieldWithLabel(label: "Directed By", text: $data.directedBy, prompt: "Directed By")
    }
  }
}

#Preview {
  let preview = PreviewContainer([Movie.self])
  let data = Binding.constant(Movie.previewData[0].dataForForm)
  return MovieForm(data: data)
      .modelContainer(preview.container)
}
