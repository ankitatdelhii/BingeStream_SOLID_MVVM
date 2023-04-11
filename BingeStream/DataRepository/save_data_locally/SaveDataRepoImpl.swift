//
//  SaveDataRepoImpl.swift
//  BingeStream
//
//  Created by Ankit Saxena on 12/04/23.
//

import Foundation

class SaveDataRepoImpl: SaveDataRepo {
    
    let localDataStorage: LocalDataStorage
    
    init(localDataStorage: LocalDataStorage) {
        self.localDataStorage = localDataStorage
    }
    
    func saveData<T: Encodable>(data: T, storageKey: String) throws {
        try localDataStorage.save(object: data, forKey: storageKey)
    }
    
}
