//
//  MovieListCell.swift
//  MovieList
//
//  Created by MacBook Pro on 6/4/21.
//

import UIKit

class MovieListCell: UICollectionViewCell {

    @IBOutlet weak var ratingBackView: UIView!
    @IBOutlet weak var ratingUL: UILabel!
    @IBOutlet weak var movieNameUL: UILabel!
    @IBOutlet weak var poster_Img: UIImageView!
    
//    var item:MovieListModel! {
//        didSet {
////            ratingUL.text = "\(item.results[0].popularity)"
//            
////            poster_Img.image = item.results
//        }
//    }
//
    var imgBaseUrl = "https://image.tmdb.org/t/p/w200"
    
    var imgUrl: String! {
        didSet {
            let finalImgUrl = imgBaseUrl + imgUrl
            
            imgDownload(imgUrl: finalImgUrl)
        }
    }
    
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        ratingBackView.layer.cornerRadius = ratingBackView.frame.width / 2
        
    }
    
    func imgDownload(imgUrl: String) {

        if let url = URL(string: imgUrl) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async { /// execute on main thread
                    self.poster_Img.image = UIImage(data: data)
                }
            }
            
            task.resume()
        }
    }
    

    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }

}
