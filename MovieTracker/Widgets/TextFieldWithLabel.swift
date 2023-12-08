import SwiftUI

struct TextFieldWithLabel: View {
  let label: String
  @Binding var text: String
  var prompt: String? = nil

  var body: some View {
    VStack(alignment: .leading) {
      Text(label)
        .modifier(FormLabel())
      TextField(label, text: $text, prompt: Text(prompt ?? ""))
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

#Preview {
  Form {
    TextFieldWithLabel(label: "Provide the Data", text: Binding.constant("Input"), prompt: "Start typing!")
  }
}
