import Foundation

class Movie: Identifiable {
  let id: Int
  let title: String
  let synopsis: String?
  let directedBy: String?
  let genre: Genre
  let performers: [Performer]
  let posterUrl: URL?

  var viewed: Bool

  init(id: Int, title: String, synopsis: String?, directedBy: String?, genre: Genre, performers: [Performer] = [], posterUrl: URL?, viewed: Bool = false) {
    self.id = id
    self.title = title
    self.synopsis = synopsis
    self.directedBy = directedBy
    self.genre = genre
    self.performers = performers
    self.posterUrl = posterUrl
    self.viewed = viewed
  }
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

