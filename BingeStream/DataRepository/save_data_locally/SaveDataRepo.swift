//
//  SaveDataRepo.swift
//  BingeStream
//
//  Created by Ankit Saxena on 12/04/23.
//

import Foundation

protocol SaveDataRepo {
    func saveData<T:Encodable>(data: T, storageKey: String) throws
}
