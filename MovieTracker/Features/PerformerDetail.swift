
import SwiftUI

struct PerformerDetail: View {
  let performer: Performer

  var body: some View {
    Text(performer.name)
  }
}

#Preview {
  NavigationStack {
    PerformerDetail(performer: Performer.previewData[0])
  }
}
