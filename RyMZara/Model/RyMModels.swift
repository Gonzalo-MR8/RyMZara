//
//  RyMModels.swift
//  RyMZara
//
//  Created by GonzaloMR on 17/4/24.
//

import Foundation


// MARK: - Welcome
struct RyMResults: Decodable {
    let info: Info
    let results: [RyMResult]
}

// MARK: - Info
struct Info: Decodable {
    let count, pages: Int
    let next: String
    let prev: String?
}

// MARK: - Result
struct RyMResult: Decodable, Hashable {
    let id: Int
    let name, species, type: String
    let status: Status
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: RyMResult, rhs: RyMResult) -> Bool {
        return lhs.id == rhs.id && rhs.id == lhs.id
    }

}

// MARK: - Status
enum Status: String, Decodable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}


// MARK: - Location
struct Location: Decodable {
    let name: String
    let url: String
}
