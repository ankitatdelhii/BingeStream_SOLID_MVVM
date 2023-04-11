//
//  DataFetchingStrategy.swift
//  BingeStream
//
//  Created by Ankit Saxena on 12/04/23.
//

import Foundation

enum DataFetchingStrategy {
    case defaultFetch // Fetch from Cache if not present then api
    case remoteOnlyFetch
}
