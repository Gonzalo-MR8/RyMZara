//
//  RyMZaraApp.swift
//  RyMZara
//
//  Created by GonzaloMR on 17/4/24.
//

import Foundation

final class NetworkManager {

    private let reachability = Reachability()
    private var reachabilityStarted = false

    static let shared = NetworkManager()

    private init() {}

    // MARK: - Reachability

    func startReachability() {
        guard !reachabilityStarted else { return }

        reachabilityStarted = true

        try? reachability?.startNotifier()

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(reachabilityChanged(_:)),
            name: .reachabilityChanged,
            object: reachability
        )
    }

    func stopReachability() {
        reachabilityStarted = false

        reachability?.stopNotifier()

        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: nil)
    }

    var isConnected: Bool {
        guard let reachConnection = reachability else { return false }

        return reachConnection.connection != .none
    }

    @objc func reachabilityChanged(_ notification: Notification) {
        guard let reachability = notification.object as? Reachability else { return }

        let isReachable = reachability.connection != .none

        NotificationCenter.default.post(name: .reachabilityChanged, object: isReachable)

        /// Manage NoInternetView
        if isReachable == false {
            // CustomNavigationController.instance.showAlertBlockView(alertType: .internet)
        } else {
            // CustomNavigationController.instance.closeAlertBlockView()
        }
    }
}
