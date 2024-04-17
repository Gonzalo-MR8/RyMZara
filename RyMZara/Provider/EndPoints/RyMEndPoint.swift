//
//  RyMZaraApp.swift
//  RyMZara
//
//  Created by GonzaloMR on 17/4/24.
//

import Foundation

enum RyMEndPoint {
  case getCharacters
  case getCharactersNewPage(newPage: String)
}

extension RyMEndPoint: EndPoint {
  var basePath: String {
    return "https://rickandmortyapi.com/api/"
  }
  
  var path: String {
    switch self {
    case .getCharacters:
      return "character"
    case .getCharactersNewPage(newPage: let newPage):
      return "character?page=\(newPage)"
    }
  }
  
  var method: HttpMethod { .get }
  
  var postBody: [String : Any]? { nil }
  
  var urlParameters: [String: String]? { nil }
  
  var customHeaders: [String: String]? { nil }
}
