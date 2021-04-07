//
//  File.swift
//  MovieList
//
//  Created by MacBook Pro on 6/4/21.
//

import Foundation
import UIKit


extension MovieListVC: UICollectionViewDataSource,UICollisionBehaviorDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesInfo.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieListCell.identifier, for: indexPath) as! MovieListCell
        
        let item = getMovieInfo()
        
        
        cell.layer.cornerRadius = 10
        cell.movieNameUL.text = " \(item[indexPath.row]?.title ?? "")"
        cell.imgUrl = item[indexPath.row]?.poster_path ?? ""
        
        if let rating = item[indexPath.row]?.vote_average {
//            cell.ratingUL.text = "\(rating)"
            let ratingString = String(rating)
            let attributeString = NSMutableAttributedString(string: ratingString)
            attributeString.addAttribute(.font, value: UIFont.systemFont(ofSize: 15), range: NSRange(location: 0, length: 1))
            cell.ratingUL.attributedText = attributeString
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsperRow = 2
        let spacingbetweencells = 16
        
        
        let totalSpacing = (2 * Int(self.spacing)) + ((numberOfItemsperRow - 1) * spacingbetweencells)
        
        if let collection = self.collectionview{
            let width = (Int(collection.bounds.width) - totalSpacing)/numberOfItemsperRow
            return CGSize(width: width, height: width + 100)
        }else{
            return CGSize(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
}
