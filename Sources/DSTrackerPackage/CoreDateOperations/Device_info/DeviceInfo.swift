//
//  File.swift
//  
//
//  Created by Praveen Sharma on 07/11/23.
//

import Foundation
import UIKit
internal struct DeviceInfo{
 let appVersion : String?
 let deviceId : String?
 let deviceName : String?
 let networkOnnection : String?
 let osVersion : String?
 let territory : String?
 let model : String?
  
  init() {
    let currentDevice = UIDevice.current
    appVersion =  Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
 ?? ""
    deviceId =  currentDevice.identifierForVendor?.description ?? ""
    deviceName = currentDevice.name
    networkOnnection = currentDevice.systemName
    osVersion = currentDevice.systemVersion
    model = currentDevice.localizedModel
    territory = Locale.current.regionCode ?? ""
  }
  
  internal func toDictionary() -> [String:Any]{
    return [
      "appVersion":appVersion!,
      "device_id":deviceId!,
      "device_name":deviceName!,
      "os_version":osVersion!,
      "device_type":"ios"
    ]
  }
}
 
