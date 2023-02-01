import Foundation

struct Movie: Identifiable {
  var id: Int
  var title: String
  var synopsis: String?
  var directedBy: String?
  var genre: Genre
  var actors: [Actor] = []
  var posterUrl: URL?

  var viewed: Bool = false
}

extension Movie {
  enum Genre {
    case action
    case comedy
    case drama
    case sff
    case western
  }
}

