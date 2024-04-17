//
//  DashboardViewModel.swift
//  RyMZara
//
//  Created by GonzaloMR on 17/4/24.
//

import Foundation

@MainActor
class DashboardViewModel: ObservableObject {
  @Published var rymResults = [RyMResult]()

  public var isCalling = false

  private var currentPage = 1
  private var maxPages = 42

  private let rymServices: RyMServiceable = RyMServices()

  func initialize() async throws {
    isCalling = true

    let rymResult = try await rymServices.getCharacters()

    maxPages = rymResult.info.pages
    rymResults = rymResult.results

    isCalling = false
  }

  func getNextPage() async throws {
    guard currentPage <= maxPages, !isCalling else { return }

    isCalling = true
    currentPage += 1

    let rymResult = try await rymServices.getCharactersNewPage(newPage: String(currentPage))

    maxPages = rymResult.info.pages
    rymResults.append(contentsOf: rymResult.results)

    isCalling = false
  }
}
