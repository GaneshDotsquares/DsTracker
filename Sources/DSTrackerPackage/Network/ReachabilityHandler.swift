//
//  File.swift
//
//
//  Created by Praveen Sharma on 06/11/23.
//

import Foundation
final class ReachabilityHandler {
  
  private var reachability: Reachability? = try? Reachability()
  
  // MARK: - LifeCycle
  
  init() {
    configure()
  }
  
  deinit {
    NotificationCenter.default.removeObserver(self)
    reachability?.stopNotifier()
  }
  
  // MARK: - Private
  
  private func configure() {
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(ReachabilityHandler.checkForReachability(notification:)),
                                           name: Notification.Name.reachabilityChanged,
                                           object: nil)
    try? reachability?.startNotifier()
    
  }
  
  @objc private func checkForReachability(notification: NSNotification) {
    let networkReachability = notification.object as? Reachability
    if let remoteHostStatus = networkReachability?.connection {
      switch remoteHostStatus {
        
      case .wifi:
        Console.message("Wifi connection")
        
        break
      case .cellular:
        Console.message("cellular connection")

        break
        
      case .unavailable:
        Console.message("No connection")
        break
      }
    }
  }
}
