//
//  NasaImagesListUseCase.swift
//  BingeStream
//
//  Created by Ankit Saxena on 15/04/23.
//

import Foundation

protocol NasaImagesListUseCase {
    func execute(
        cachedImages: (Result<[NasaImagesListModel], Error>)-> Void,
        apiImages: @escaping (Result<[NasaImagesListModel], Error>)-> Void
    )
}


final class NasaImagesListUseCaseImpl {
    
    private let nasaImagesListRepository: NasaImagesListRepository
    
    init(nasaImagesListRepository: NasaImagesListRepository) {
        self.nasaImagesListRepository = nasaImagesListRepository
    }
    
    private func mapToNasaImagesList(nasaDTO: NasaRoverResponseDTO) -> [NasaImagesListModel] {
        return nasaDTO.photos?.toNasaImagesListModel() ?? []
    }
    
}

extension NasaImagesListUseCaseImpl: NasaImagesListUseCase {
    
    func execute(cachedImages: (Result<[NasaImagesListModel], Error>) -> Void, apiImages: @escaping (Result<[NasaImagesListModel], Error>) -> Void) {
        nasaImagesListRepository.fetchImages { cachedResult in
            switch cachedResult {
            case .success(let success):
                let mappedData = mapToNasaImagesList(nasaDTO: success)
                cachedImages(.success(mappedData))
            case .failure(let failure):
                cachedImages(.failure(failure))
            }
        } apiImages: { apiResult in
            switch apiResult {
            case .success(let success):
                let mappedData = self.mapToNasaImagesList(nasaDTO: success)
                apiImages(.success(mappedData))
            case .failure(let failure):
                apiImages(.failure(failure))
            }
        }

    }
    
}
