//
//  NasaImagesListRepository.swift
//  BingeStream
//
//  Created by Ankit Saxena on 15/04/23.
//

import Foundation
protocol NasaImagesListRepository {
//    associatedtype NasaImages = (Result<[NasaRoverResponseDTO], Error>)-> Void

    func fetchImages(
        cachedImages: (Result<NasaRoverResponseDTO, Error>)-> Void, apiImages: @escaping (Result<NasaRoverResponseDTO, Error>)-> Void
    )
}
