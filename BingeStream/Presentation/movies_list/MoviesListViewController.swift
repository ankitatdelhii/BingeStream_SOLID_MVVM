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
    private var viewmodel: MoviesListViewModel!
    
    //MARK: UI Properties
    
    //MARK: Lifecycle
    
    class func instance(viewModel: MoviesListViewModel) -> MoviesListViewController {
        
        let controller = MoviesListViewController.init(nibName: "MoviesListViewController", bundle: nil)
        controller.viewmodel = viewModel
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewmodel.executeUseCase()
    }
    
    //MARK: Helpers
    
    //MARK: Selectors
    
    
    
}
