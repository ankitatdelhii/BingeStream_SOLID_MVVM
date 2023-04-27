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
    
    //MARK: Lifecycle
    
    class func instance(controller: MoviesListViewController, viewModel: MoviesListViewModel) -> MoviesListViewController {
        controller.viewmodel = viewModel
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindCollection()
    }
    
    //MARK: Helpers
    private func bindCollection() {
        
    }
    
    
    //MARK: Selectors
    
    
    
}

//MARK: ViewModel Output Delegate
extension MoviesListViewController: MoviesListViewModelOutput {
    
    func didFetchMovies() {
        print("Got movies in VC \(viewmodel.filmsModel)")
    }
    
}
