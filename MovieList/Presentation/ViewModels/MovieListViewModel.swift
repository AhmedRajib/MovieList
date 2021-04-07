//
//  MovieListViewModel.swift
//  MovieList
//
//  Created by MacBook Pro on 6/4/21.
//

import Foundation
import UIKit

class MovieListViewModel {
    
    func getMovieListData() {
        
        var jsonValue:MovieListModel!
        
        var movieVC = MovieListVC()
        
        var test = [Result]()
        
        let url = URL(string: "http://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&page=1&api_key=3fa9058382669f72dcb18fb405b7a831")
        
        if Reachability.isConnectedToNetwork() {
            URLSession.shared.dataTask(with: url!) { [self] (data, response, err) in
                
                do {
                    if err == nil {
                        jsonValue = try! JSONDecoder().decode(MovieListModel.self, from: data!)
                        
                        saveMovieInfo(movieInfo: jsonValue.results)
                    }
                }catch {
                    debugPrint(err?.localizedDescription)
                }
                
//                movieVC.test.append(contentsOf: test)
                print("Test ", test)
            }.resume()
        }else {
            
        }
  
        
        
    }
    
    func saveMovieInfo(movieInfo: [Result]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(movieInfo) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "movieInfo")
        }
    }
}
