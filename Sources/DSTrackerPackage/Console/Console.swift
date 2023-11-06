 

import Foundation

internal enum DebugType{
    case Debug
    case Warning
    case error
    case Apis
 
}

internal struct Console{
    static internal func message(_ value:Any, type:DebugType = .Debug){
        var symbol = ""
        switch type {
        case .Debug:
            symbol = "DS Tracker DEBUG Message *********************************************** \n"
        case .Warning:
            symbol = "🤨🤨🤨🤨🤨🤨🤨🤨🤨🤨🤨🤨🤨🤨🤨🤨🤨🤨🤨🤨🤨🤨🤨🤨\n"
        case .error:
            symbol = "🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴\n"
        case .Apis:
            symbol = "🅰️🅰️🅰️🅰️🅰️🅰️🅰️🅰️🅰️🅰️🅰️🅰️🅰️🅰️🅰️🅰️🅰️🅰️🅰️🅰️🅰️🅰️\n"
       
        }
 
      if DSTracker.shared.toBeConsoleLogs == true{
        print("\(symbol) \(Date()) \n \(value) \n\n")
      }
//        log("\(symbol) \n \(value) \n\n")
    }
    /*
    static var logFile: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let dateString = formatter.string(from: Date())
        let fileName = "\(dateString).text"
        return documentsDirectory.appendingPathComponent(fileName)
    }
    
    static func log(_ message: String) {
        guard let logFile = logFile else {
            return
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        let timestamp = formatter.string(from: Date())
        guard let data = (timestamp + ": " + message + "\n").data(using: String.Encoding.utf8) else { return }
        
        if FileManager.default.fileExists(atPath: logFile.path) {
            if let fileHandle = try? FileHandle(forWritingTo: logFile) {
                fileHandle.seekToEndOfFile()
                fileHandle.write(data)
                fileHandle.closeFile()
            }
        } else {
            try? data.write(to: logFile, options: .atomicWrite)
        }
    }
    
    static  func readLogs(){
        if   let fileURL = Console.logFile{
            DispatchQueue.global(qos: .background).async {
                //reading
                do {
                    let text2 = try String(contentsOf: fileURL, encoding: .utf8)
                    DispatchQueue.main.async {
                        AppDelegate.shared.window?.rootViewController?.topMostController()?.presentActionsheetWith(title: "Please select", message: "", firstTitle: "Share", firstAction: {
                            DispatchQueue.main.async {
                          AppDelegate.shared.window?.rootViewController?.topMostController()?.socialShare(with: fileURL.lastPathComponent, image: nil, url: fileURL)
                            }
                        }, secondTitle: "Remove", secondAction: {
                            Self.removeOldLogsFile()
                        })
 
                    }
                }
                catch {/* error handling here */
                    Console.tobePrint(error, type: .error)
                    DispatchQueue.main.async {
                    AppDelegate.shared.window?.rootViewController?.topMostController()?.presentAlertWith(message: error.localizedDescription)
                    }
                }
            }
        }
        
    }
    
    static func removeOldLogsFile(){
         // check if file exists
        // fileUrl.path converts file path object to String by stripping out `file://`
        if let url  = Console.logFile{
            if FileManager.default.fileExists(atPath: url.path) {
                // delete file
                do {
                    try FileManager.default.removeItem(atPath: url.path)
                } catch {
                    print("Could not delete file, probably read-only filesystem")
                }
            }
        }
    }
    */
}
