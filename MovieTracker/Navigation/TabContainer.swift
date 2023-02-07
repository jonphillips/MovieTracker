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
        NavigationView {
          MovieContainer()
        }
        .tabItem {
          Label("Movies", systemImage: "film")
            .accessibility(label: Text("Movies"))
        }
        .tag(Tab.movies)
        
        NavigationView {
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

struct TabContainer_Previews: PreviewProvider {
  static var previews: some View {
    TabContainer()
  }
}
