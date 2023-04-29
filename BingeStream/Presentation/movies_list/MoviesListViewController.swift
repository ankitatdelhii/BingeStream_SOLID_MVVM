//
//  MoviesListViewController.swift
//  BingeStream
//
//  Created by Ankit Saxena on 14/04/23.
//

import UIKit

final class MoviesListViewController: UIViewController {
    
    //MARK: Outelets
    @IBOutlet private weak var moviesCollection: UICollectionView!
    
    //MARK: Properties
    static let controllerName = String(describing: MoviesListViewController.self)
    private var viewmodel: MoviesListViewModel!
    
    //MARK: UI Properties
    
    //MARK: Constants
    static let collectionMargin: CGFloat = 30.0
    
    //MARK: Lifecycle
    
    class func instance(controller: MoviesListViewController, viewModel: MoviesListViewModel) -> MoviesListViewController {
        controller.viewmodel = viewModel
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMoviesCollection()
    }
    
    //MARK: Helpers
    
    
    //MARK: Selectors
    
    
    
}

//MARK: - ViewModel Output Delegate
extension MoviesListViewController: MoviesListViewModelOutput {
    
    func didFetchMovies() {
//        print("Got movies in VC \(viewmodel.filmsModel)")
    }
    
}

//MARK: - Movies Collection
extension MoviesListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private func configureMoviesCollection() {
        
        moviesCollection.register(UINib(nibName: MoviesCollectionViewCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: MoviesCollectionViewCell.reuseIdentifier)
        moviesCollection.delegate = self
        moviesCollection.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewmodel.filmsModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesCollectionViewCell.reuseIdentifier, for: indexPath) as! MoviesCollectionViewCell
        cell.configureCell(model: viewmodel.filmsModel[indexPath.item])
        cell.configure(width: PresentationConstants.fullscreenWidth - MoviesListViewController.collectionMargin)
        return cell
    }
    
}
