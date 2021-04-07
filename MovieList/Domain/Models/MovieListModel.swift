//
//  MovieListModel.swift
//  MovieList
//
//  Created by MacBook Pro on 6/4/21.
//


import Foundation


struct MovieListModel: Codable {
    let page: Int?
    let results: [Result]
    let totalPages, totalResults: Int?
}

// MARK: - Result
struct Result: Codable {
    let adult: Bool
    let backdrop_path: String
    let genre_ids: [Int]
    let id: Int
    let original_language, original_title, overview: String
    let popularity: Double
    let poster_path, release_date, title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
}
