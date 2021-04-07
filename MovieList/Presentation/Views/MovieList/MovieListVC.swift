//
//  MovieListVC.swift
//  MovieList
//
//  Created by MacBook Pro on 6/4/21.
//

import UIKit

class MovieListVC: UIViewController, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionview: UICollectionView!

   public var movies: MovieListModel?
    var vm = MovieListViewModel()
    let defaults = UserDefaults.standard
    
    var moviesInfo = [Result?]()
    let spacing:CGFloat = 10
    override func viewDidLoad() {
        super.viewDidLoad()

      
        
       // vm.getMovieListData()
        // Do any additional setup after loading the view.
//        debugPrint("Get Value ", test)
        
        collectionview.dataSource = self
        collectionview.delegate = self
//        collectionview.
        
        setUPView()
    }
    
    func setUPView() {
        self.collectionview.register(MovieListCell.nib, forCellWithReuseIdentifier: MovieListCell.identifier)
        getMovieInfo()
        collectionVieeDesign()
    }
    
    func getMovieInfo() {
        if let saveMoviesInfo = defaults.object(forKey: "movieInfo") as? Data {
            let decoder = JSONDecoder()
            moviesInfo = try! decoder.decode([Result].self, from: saveMoviesInfo) as! [Result?]
        }
    }
    
    func collectionVieeDesign() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        self.collectionview.collectionViewLayout = layout
    }
    
    
    


}
