import SwiftUI

struct PerformerList: View {
  let performers: [Performer] = Performer.previewData
  @State var searchText: String = ""
  
  var body: some View {
    List(searchResults.sorted(by: Performer.nameSorter)) { performer in
      Text(performer.name)
    }
    .searchable(text: $searchText)
  }
  
  var searchResults: [Performer] {
    if searchText.isEmpty {
      return performers
    } else {
      return performers.filter { $0.name.contains(searchText) }
    }
  }
}

#Preview {
  NavigationStack {
    PerformerList()
  }
}
