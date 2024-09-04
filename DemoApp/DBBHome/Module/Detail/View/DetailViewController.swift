//
//  DetailViewController.swift
//  DemoApp
//
//  Created by Derlys Hector Benito Baldeon on 04/09/24.
//

import Foundation
import UIKit
import SDWebImage

class DetailViewController: UIViewController{
    
    var presenter: DetailPresenterProtocol?
    
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: - NavigationController
    
    private func setupNavigationBar(){
        self.title = "Película Detalle"
    }
}

extension DetailViewController: DetailViewProtocol{
    func displaInfo(movie: MovieCoreDataModel?) {
        guard let imageURL = movie?.posterPath else { return }
        imageMovie.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(imageURL)"))
        
        titleLabel.text = movie?.title
        ratingLabel.text = "\(movie?.rating ?? 0)"
        dateLabel.text = movie?.releaseDate
        overviewLabel.text = movie?.overview
    }

}
