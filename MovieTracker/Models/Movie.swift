import Foundation

struct Movie: Identifiable {
  let id: Int
  let title: String
  let synopsis: String?
  let genre: Genre
  let actors: [Actor] = []
  let posterUrl: URL?

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

