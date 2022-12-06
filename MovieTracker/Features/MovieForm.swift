import SwiftUI

struct MovieForm: View {
  @Binding var data: Movie.FormData
  @State var newPerformerName = ""
  
  var body: some View {
    Form {
      VStack {
        TextFieldWithLabel(label: "Title", text: $data.title, prompt: "Enter a Title")
        VStack(alignment: .leading) {
          Text("Synopsis")
            .modifier(FormLabel())
          TextEditor(text: $data.synopsis)
        }
        Picker(selection: $data.genre, label: Text("Genre").modifier(FormLabel())) {
          ForEach(Movie.Genre.allCases) { genre in
            Text(genre.rawValue)
          }
        }
        .pickerStyle(.menu)
        TextFieldWithLabel(label: "Directed By", text: $data.directedBy)
        
        Section(header:
                  HStack {
          Text("Performers").modifier(FormLabel())
          Spacer()
        }
        ) {
          ForEach(data.performers) { performer in
            Text(performer.name)
          }
          HStack {
            TextField("New Performer", text: $newPerformerName)
            Button(action: {
              withAnimation {
                let performer = Performer(name: newPerformerName)
                data.performers.append(performer)
                newPerformerName = ""
              }
            }) {
              Image(systemName: "plus.circle.fill")
            }
            .disabled(newPerformerName.isEmpty)
          }
        }
        TextFieldWithLabel(label: "PosterUrl", text: $data.posterUrl)
      }
    }
  }
}

struct TextFieldWithLabel: View {
  let label: String
  @Binding var text: String
  var prompt: String? = nil
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(label)
        .modifier(FormLabel())
      TextField(label, text: $text, prompt: nil)
        .padding(.bottom, 20)
    }
  }
}

struct FormLabel: ViewModifier {
  func body(content: Content) -> some View {
    content
      .bold()
      .font(.caption)
  }
}

struct MovieForm_Previews: PreviewProvider {
  static var previews: some View {
    MovieForm(data: Binding.constant(Movie.previewData[0].dataForForm))
  }
}
