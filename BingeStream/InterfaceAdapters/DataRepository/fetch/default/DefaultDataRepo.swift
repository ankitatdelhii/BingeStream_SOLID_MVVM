//
//  DataRepo.swift
//  BingeStream
//
//  Created by Ankit Saxena on 11/04/23.
//
/*
import Foundation

 protocol DataRepository {
     func fetchData<T: Decodable>(endpoint: APIEndpoint, storageKey: String, completion: @escaping (Result<T, Error>) -> Void)
 }

 // MARK: - DataRepository Implementation

 class DefaultDataRepository: DataRepository {
     private let networkClient: NetworkClient
     private let dataStorage: LocalDataStorage

     init(networkClient: NetworkClient, dataStorage: LocalDataStorage) {
         self.networkClient = networkClient
         self.dataStorage = dataStorage
     }

     func fetchData<T: Decodable>(endpoint: APIEndpoint, storageKey: String, completion: @escaping (Result<T, Error>) -> Void) {
         if let localData: T = try? dataStorage.load(forKey: storageKey) {
             completion(.success(localData))
         } else {
             networkClient.request(endpoint: endpoint) { (result: Result<Data, Error>) in
                 switch result {
                 case .success(let data):
                     do {
                         let decodedObject = try JSONDecoder().decode(T.self, from: data)
                         try dataStorage.save(object: decodedObject, forKey: storageKey)
                         completion(.success(decodedObject))
                     } catch {
                         completion(.failure(error))
                     }
                 case .failure(let error):
                     completion(.failure(error))
                 }
             }
         }
     }
 }

 // Usage
 let networkClient = NetworkClient(dispatcher: URLSessionNetworkDispatcher())
 let dataStorage = UserDefaultsLocalDataStorage()
 let dataRepository = DefaultDataRepository(networkClient: networkClient, dataStorage: dataStorage)

 let endpoint = APIEndpoint(path: "https://api.example.com/data", method: .get, parameters: ["key": "value"], headers: ["Content-Type": "application/json"])

 dataRepository.fetchData(endpoint: endpoint, storageKey: "exampleData") { (result: Result<User, Error>) in
     switch result {
     case .success(let user):
         print("User fetched: \(user)")
     case .failure(let error):
         print("Error: \(error.localizedDescription)")
     }
 }
*/
