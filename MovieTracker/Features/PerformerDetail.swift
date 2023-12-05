
import SwiftUI

struct PerformerDetail: View {
  let performer: Performer

  var body: some View {
    Text(performer.name)
  }
}

struct PerformerDetail_Previews: PreviewProvider {
  static var previews: some View {
    PerformerDetail(performer: Performer.previewData[0])
  }
}
