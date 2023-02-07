//
//  MovieGrid.swift
//  MovieTracker
//
//  Created by Jon on 2/6/23.
//

import SwiftUI

struct MovieGrid: View {
  @Binding var movies: [Movie]

  var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

  var body: some View {
    NavigationStack {
      LazyVGrid(columns: threeColumnGrid) {
        ForEach($movies) { $movie in
          NavigationLink(destination: MovieDetail(movie: $movie)) {
            Text(movie.title).foregroundColor(.black)
              .font(.headline)
              .padding()
          }
        }
      }
      .navigationTitle("Movies")
    }
  }
}

struct MovieGrid_Previews: PreviewProvider {
  static var previews: some View {
    MovieGrid(movies: Binding.constant(Movie.previewData))
  }
}
