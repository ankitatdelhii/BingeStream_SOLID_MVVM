//
//  MoviesListViewModel.swift
//  BingeStream
//
//  Created by Ankit Saxena on 14/04/23.
//

import Foundation

class MoviesListViewModel {
    
    let nasaImagesListUseCase: NasaImagesListUseCase
    
    init(nasaImagesListUseCase: NasaImagesListUseCase) {
        self.nasaImagesListUseCase = nasaImagesListUseCase
    }
    
    func executeUseCase() {
        nasaImagesListUseCase.execute { cachedResult in
            switch cachedResult {
                
            case .success(let cachedData):
                print("Got Cached Data \(cachedData)")
            case .failure(let failure):
                print("Got Cached Data failure \(failure)")
            }
        } apiImages: { apiResult in
            switch apiResult {
                
            case .success(let apiData):
                print("Got Api Data \(apiData)")
            case .failure(let failure):
                print("Got Api Data failure \(failure)")
            }
        }

    }
    
    
}
