//
//  File.swift
//  
//
//  Created by Praveen Sharma on 30/10/23.
//

import Foundation

public class DSTracker{
  public static let shared =  DSTracker()
  private init() { }
  
// here managable to console logs
  public var toBeConsoleLogs = true
  
  public func addPreFixWord(str:String = "")->String{
    return "Hello " + str
  }
  public func configure(){
    ReachabilityHandler()
  }
}
