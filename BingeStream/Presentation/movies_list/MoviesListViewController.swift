//
//  MoviesListViewController.swift
//  BingeStream
//
//  Created by Ankit Saxena on 14/04/23.
//

import UIKit

class MoviesListViewController: UIViewController {
    
    //MARK: Outelets
    
    //MARK: Properties
    private var viewmodel: MoviesListViewModel!
    
    //MARK: UI Properties
    
    //MARK: Lifecycle
    
    class func instance() -> MoviesListViewController {
        
        let controller = MoviesListViewController.init(nibName: "MoviesListViewController", bundle: nil)
        
        let localDataCordinator = LocalDataCoordinatorImpl(localDataStorage: UserDefaultsLocalDataStorage())
        let nasaImagesListRepo = NasaImagesListRepositoryImpl(localDataCordinator: localDataCordinator, networkClient: NetworkClient(dispatcher: URLSessionNetworkDispatcher()))
        let nasaImagesListUseCase = NasaImagesListUseCaseImpl(nasaImagesListRepository: nasaImagesListRepo)
        let viewmodel = MoviesListViewModel(nasaImagesListUseCase: nasaImagesListUseCase)
        
        controller.viewmodel = viewmodel
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewmodel.executeUseCase()
    }
    
    //MARK: Helpers
    
    //MARK: Selectors
    
    
    
}
