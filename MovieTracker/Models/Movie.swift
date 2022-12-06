import Foundation

struct Movie: Identifiable, Hashable {
  var id: UUID = UUID()
  var title: String
  var synopsis: String?
  var directedBy: String?
  var genre: Genre
  var performers: [Performer] = []
  var posterUrl: URL?

  var viewed: Bool = false
}

extension Movie {
  enum Genre:String, CaseIterable, Identifiable {
    var id: Self { self }
    
    case action
    case comedy
    case drama
    case sff
    case western
  }
}

extension Movie {
  struct FormData {
    var title: String = ""
    var synopsis: String = ""
    var directedBy: String = ""
    var genre: Genre = .drama
    var performers: [Performer] = []
    var posterUrl: String = ""
    var viewed: Bool = false
  }

  var dataForForm: FormData {
    FormData(
      title: title,
      synopsis: synopsis ?? "",
      directedBy: directedBy ?? "",
      genre: genre,
      performers: performers,
      posterUrl: posterUrl?.absoluteString ?? "",
      viewed: viewed
    )
  }

  static func create(from formData: FormData) -> Movie {
    let movie = Movie(title: formData.title, genre: formData.genre)
    return Movie.update(movie, from: formData)
  }

  static func update(_ movie: Movie, from formData: FormData) -> Movie {
//    guard validate(name: formData.name) else { throw ValidationError.emptyName }
//    guard formData.bathroomsUnknown || validate(bathroomCount: formData.bathrooms) else { throw ValidationError.zeroBathroom }

    var movie = movie
    movie.title = formData.title
    movie.synopsis = formData.synopsis.isEmpty ? nil : formData.synopsis
    movie.directedBy = formData.directedBy.isEmpty ? nil : formData.directedBy
    movie.genre = formData.genre
    movie.performers = formData.performers
    movie.posterUrl = URL(string: formData.posterUrl)
    print(movie)
    return movie
  }
}

extension Movie {
  static let previewData = [
    Movie(title: "Everything Everywhere All at Once", synopsis: "When an interdimensional rupture unravels reality, an unlikely hero must channel her newfound powers to fight bizarre and bewildering dangers from the multiverse as the fate of the world hangs in the balance.", directedBy: "Daniel Kwan and Daniel Scheinert", genre: .drama, performers: [.cumberbatch], posterUrl: PU.everythingUrl),
    Movie(title: "The Power of the Dog", directedBy: "Jane Campion", genre: .drama, performers: [.cumberbatch], posterUrl: PU.powerUrl),
    Movie(title: "Dune", directedBy: "Denis Villeneuve", genre: .sff, performers: [.chalamet, .zendaya], posterUrl: PU.duneUrl),
    Movie(title: "Little Women", directedBy: "Greta Gerwig", genre: .drama, performers: [.ronan, .chalamet], posterUrl: PU.littleUrl),
    Movie(title: "NOPE", directedBy: "Jordan Peele", genre: .sff, performers: [.kaluuya, .palmer, .yeun], posterUrl: PU.nopeUrl),
    Movie(title: "The Harder They Fall", genre: .western, performers: [.elba, .king], posterUrl: PU.harderUrl),
    Movie(title: "Spider-Man: No Way Home", genre: .sff, performers: [.zendaya, .holland], posterUrl: PU.spiderUrl),
    Movie(title: "The Farewell", synopsis: "A Chinese family discovers their grandmother has only a short while left to live and decide to keep her in the dark, scheduling a wedding to gather before she dies.", genre: .drama, performers: [.awkwafina], posterUrl: PU.farewellUrl),
    Movie(title: "Minari", synopsis: "In 1983, the Korean immigrant Yi family moves from California to their new plot of land in rural Arkansas, where father Jacob hopes to grow Korean produce to sell to vendors in Dallas. ", genre: .drama, performers: [.yeun], posterUrl: PU.minariUrl)
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
