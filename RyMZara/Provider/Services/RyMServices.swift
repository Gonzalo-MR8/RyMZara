//
//  RyMZaraApp.swift
//  RyMZara
//
//  Created by GonzaloMR on 17/4/24.
//

import Foundation

/// It conforms to the Serviceable protocol, which is critical for testing and dependency injection.
protocol RyMServiceable {
  func getCharacters()  async throws -> RyMResults
  func getCharactersNewPage(newPage: String) async throws -> RyMResults
}

struct RyMServices: NetworkClient, RyMServiceable {
  func getCharacters() async throws -> RyMResults {
    return try await sendRequest(endPoint: RyMEndPoint.getCharacters, responseModel: RyMResults.self)
  }

  func getCharactersNewPage(newPage: String) async throws -> RyMResults {
    return try await sendRequest(endPoint: RyMEndPoint.getCharactersNewPage(newPage: newPage), responseModel: RyMResults.self)
  }
}
