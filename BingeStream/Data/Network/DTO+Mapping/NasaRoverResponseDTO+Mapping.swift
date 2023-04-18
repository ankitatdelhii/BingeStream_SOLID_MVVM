//
//  NasaRoverResponse.swift
//  BingeStream
//
//  Created by Ankit Saxena on 14/04/23.
//

import Foundation
//DTO means Data Transfer Object
struct NasaRoverResponseDTO: Codable {
    let photos : [Photos]?
}

struct Photos : Codable {
    let id : Int?
    let sol : Int?
    let camera : Camera?
    let img_src : String?
    let earth_date : String?
    let rover : Rover?
}

struct Camera : Codable {
    let id : Int?
    let name : String?
    let rover_id : Int?
    let full_name : String?

}

struct Rover : Codable {
    let id : Int?
    let name : String?
    let landing_date : String?
    let launch_date : String?
    let status : String?

}


//MARK : - Mappings to Domain
extension Array where Element == Photos {
    
    func toNasaImagesListModel() -> [NasaImagesListModel] {
        return self.map({
            NasaImagesListModel(id: $0.id ?? 0, roverImage: $0.img_src ?? "", earthDate: $0.earth_date ?? "", status: $0.rover?.status ?? "")
        })
    }
    
}
