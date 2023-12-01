import Foundation

class Movie: Identifiable {
  let id: Int
  let title: String
  let synopsis: String?
  let directedBy: String?
  let genre: Genre
  let actors: [Actor]
  let posterUrl: URL?

  var viewed: Bool = false

  init(id: Int, title: String, synopsis: String?, directedBy: String?, genre: Genre, actors: [Actor] = [], posterUrl: URL?, viewed: Bool) {
    self.id = id
    self.title = title
    self.synopsis = synopsis
    self.directedBy = directedBy
    self.genre = genre
    self.actors = actors
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

