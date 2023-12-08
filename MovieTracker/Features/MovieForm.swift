import SwiftUI

struct MovieForm: View {
  @Binding var data: Movie.FormData
  @State var newPerformerName: String = ""

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
        Text("Performers").modifier(FormLabel())
        ForEach(data.performers) { Text($0.name) }
        HStack {
          TextField("New Performer", text: $newPerformerName)
          Button { addPerformer(newPerformerName) } label: {
            Image(systemName: "plus.circle.fill")
          }
        }
      }
      TextFieldWithLabel(label: "Poster URL", text: $data.posterUrl, prompt: "Enter a URL")
      VStack(alignment: .leading) {
        Text("Synopsis")
          .modifier(FormLabel())
        TextEditor(text: $data.synopsis)
      }
      TextFieldWithLabel(label: "Directed By", text: $data.directedBy, prompt: "Who yelled 'Action!'")
    }
  }

  func addPerformer(_ name: String) {
    data.performers.append(Performer(name: name))
    newPerformerName = ""
  }
}

#Preview {
  MovieForm(data: Binding.constant(Movie.FormData()))
}
