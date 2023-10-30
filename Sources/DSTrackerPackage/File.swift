//
//  File.swift
//  
//
//  Created by Praveen Sharma on 30/10/23.
//

import Foundation

public class DSTracker{
  static let shared =  DSTracker()
  
  func addPreFixWord(str:String = "")->String{
    return "Hello " + str
  }
}
