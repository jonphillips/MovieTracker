import SwiftUI

struct TabContainer: View {
  @State private var selectedTab: Tab = .movies
  
  enum Tab {
    case movies
    case performers
  }
  
  var body: some View {
    Group {
      TabView(selection: $selectedTab) {
        NavigationStack {
          MovieContainer()
        }
        .tabItem {
          Label("Movies", systemImage: "film")
            .accessibility(label: Text("Movies"))
        }
        .tag(Tab.movies)
        
        NavigationStack {
          PerformerList()
        }
        .tabItem {
          Label("Performers", systemImage: "person")
            .accessibility(label: Text("Performers"))
        }
        .tag(Tab.performers)
      }
    }
  }
}

#Preview {
  let preview = PreviewContainer([Movie.self])
  preview.add(items: Movie.previewData)
  return
    TabContainer()
      .modelContainer (preview.container)
}

