import SwiftUI

struct PerformerList: View {
  var performers: [Performer] = Performer.previewData
  @State private var searchText: String = ""

  var body: some View {
    NavigationStack {
      List {
        ForEach(searchResults.sorted(by: Performer.nameSorter)) { performer in
          NavigationLink(performer.name) {
            PerformerDetail(performer: performer)
          }
        }
      }
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

struct PerformerList_Previews: PreviewProvider {
  static var previews: some View {
    PerformerList()
  }
}
