//
//  HomeViewController.swift
//  DemoApp
//
//  Created by Derlys Hector Benito Baldeon on 04/09/24.
//

import Foundation
import UIKit

class HomeViewController: UIViewController{
    
    var presenter: HomePresenterProtocol?

    @IBOutlet weak var collectionView: UICollectionView!
    
    var currentPage = 1
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        setupNavigationBar()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: - Setup
    
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.collectionViewLayout.invalidateLayout()

    }
    
    private func setupNavigationBar(){
        self.title = "Películas"
        self.navigationItem.backButtonTitle = ""
    }
    
}

//MARK: - HomeViewProtocol

extension HomeViewController: HomeViewProtocol{
    
    func reloadCollectionView() {
        collectionView.reloadData()
    }
    
}

//MARK: - HomeCollectionViewCellActionDelegate

extension HomeViewController: HomeCollectionViewCellActionDelegate{
    
    func didSelectCell(model: MovieCoreDataModel) {
        presenter?.goToDetailModule(movie: model)
    }
    
}
