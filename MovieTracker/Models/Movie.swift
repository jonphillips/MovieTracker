import Foundation

struct Movie: Identifiable {
  var id: Int
  var title: String
  var synopsis: String?
  var directedBy: String?
  var genre: Genre
  var performers: [Performer] = []
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

extension Movie {
  static let previewData = [
    Movie(id: 1, title: "Everything Everywhere All at Once", synopsis: "When an interdimensional rupture unravels reality, an unlikely hero must channel her newfound powers to fight bizarre and bewildering dangers from the multiverse as the fate of the world hangs in the balance.", directedBy: "Daniel Kwan and Daniel Scheinert", genre: .drama, performers: [.cumberbatch], posterUrl: PU.everythingUrl),
    Movie(id: 2, title: "The Power of the Dog", synopsis: nil, directedBy: "Jane Campion", genre: .drama, performers: [.cumberbatch], posterUrl: PU.powerUrl),
    Movie(id: 3, title: "Dune", synopsis: nil, directedBy: "Denis Villeneuve", genre: .sff, performers: [.chalamet, .zendaya], posterUrl: PU.duneUrl),
    Movie(id: 4, title: "Little Women", synopsis: nil, directedBy: "Greta Gerwig", genre: .drama, performers: [.ronan, .chalamet], posterUrl: PU.littleUrl),
    Movie(id: 5, title: "NOPE", synopsis: nil, directedBy: "Jordan Peele", genre: .sff, performers: [.kaluuya, .palmer, .yeun], posterUrl: PU.nopeUrl),
    Movie(id: 6, title: "The Harder They Fall", synopsis: nil, directedBy: nil, genre: .western, performers: [.elba, .king], posterUrl: PU.harderUrl),
    Movie(id: 7, title: "Spider-Man: No Way Home", synopsis: nil, directedBy: nil, genre: .sff, performers: [.zendaya, .holland], posterUrl: PU.spiderUrl),
    Movie(id: 8, title: "The Farewell", synopsis: "A Chinese family discovers their grandmother has only a short while left to live and decide to keep her in the dark, scheduling a wedding to gather before she dies.", directedBy: nil, genre: .drama, performers: [.awkwafina], posterUrl: PU.farewellUrl),
    Movie(id: 9, title: "Minari", synopsis: "In 1983, the Korean immigrant Yi family moves from California to their new plot of land in rural Arkansas, where father Jacob hopes to grow Korean produce to sell to vendors in Dallas. ", directedBy: nil, genre: .drama, performers: [.yeun], posterUrl: PU.minariUrl)
  ]
}

// This is silly; no one would ever do it like this. PU = "Poster Url"
// I'm shoving these "constants" here to make the above dummyData creation easier to read
struct PU {
  static let everythingUrl = URL(string: "https://education-jrp.s3.amazonaws.com/MovieImages/EverythingEverywhereAllAtOnce.jpg")
  static let powerUrl = URL(string: "https://education-jrp.s3.amazonaws.com/MovieImages/ThePowerOfTheDog.jpeg")
  static let nopeUrl = URL(string: "https://education-jrp.s3.amazonaws.com/MovieImages/Nope.jpg")
  static let duneUrl = URL(string: "https://education-jrp.s3.amazonaws.com/MovieImages/Dune.jpeg")
  static let littleUrl = URL(string: "https://education-jrp.s3.amazonaws.com/MovieImages/LittleWomen.jpeg")
  static let harderUrl = URL(string: "https://education-jrp.s3.amazonaws.com/MovieImages/TheHarderTheyFall.jpeg")
  static let minariUrl = URL(string: "https://education-jrp.s3.amazonaws.com/MovieImages/Minari.png")
  static let spiderUrl = URL(string: "https://education-jrp.s3.amazonaws.com/MovieImages/SpiderMan.jpeg")
  static let farewellUrl = URL(string: "https://education-jrp.s3.amazonaws.com/MovieImages/TheFarewell.jpeg")
}

