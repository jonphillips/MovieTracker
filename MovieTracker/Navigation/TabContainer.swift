import SwiftUI

struct TabContainer: View {
  
  var body: some View {
    TabView {
      NavigationStack {
        MovieContainer()
      }
      .tabItem {
        Label("Movies", systemImage: "film")
      }
      
      NavigationStack {
        PerformerList()
      }
      .badge(Performer.previewData.count)
      .tabItem {
        Label("Performers", systemImage: "person")
      }
    }
  }
}

#Preview {
  TabContainer()
}

