import Foundation

struct Performer: Identifiable {
  var id: UUID = UUID()
  var name: String
  var birthDate: Date?
}

extension Performer {
  static func birthDate(_ date: String) -> Date {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM/dd/yyyy"
    return formatter.date(from: date)!
  }
  
  static let awkwafina = Performer(name: "Awkwafina", birthDate: birthDate("06/02/1988"))
  static let bacon = Performer(name: "Kevin Bacon", birthDate: nil)
  static let chalamet = Performer(name: "Timothée Chalamet", birthDate: birthDate("12/27/1995"))
  static let cumberbatch = Performer(name: "Benedict Cumberbatch", birthDate: birthDate("07/19/1976"))
  static let elba = Performer(name: "Idris Elba", birthDate: birthDate("09/06/1972"))
  static let holland = Performer(name: "Tom Holland", birthDate: birthDate("06/01/1996"))
  static let kaluuya = Performer(name: "Daniel Kaluuya", birthDate: birthDate("02/24/1989"))
  static let king = Performer(name: "Regina King", birthDate: birthDate("01/15/1971"))
  static let palmer = Performer(name: "Keke Palmer", birthDate: birthDate("08/26/1993"))
  static let ronan = Performer(name: "Saoirse Ronan", birthDate: birthDate("04/12/1994"))
  static let yeoh = Performer(name: "Michelle Yeoh", birthDate: birthDate("08/06/1962"))
  static let yeun = Performer(name: "Steven Yeun", birthDate: birthDate("12/21/1983"))
  static let zendaya = Performer(name: "Zendaya", birthDate: birthDate("09/01/1996"))
}
