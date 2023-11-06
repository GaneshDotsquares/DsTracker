
import UIKit
import Foundation
import SystemConfiguration

private enum apiEnvirenment:String{
  case live = "dad"
  case staging = "dsdsd"
  case debug = "dddd"
}


internal class WebServiceHelper: NSObject
{
  
  private var rechabilityObserver: ReachabilityHandler?

  private override init() {
    rechabilityObserver = ReachabilityHandler()
  }
  //MARK:- //***** POST Request ***** /
  
  /*
   *  Below method is used to send Post request to server.
   */
  internal static func postRequest(method: String = "POST",endPoint:String, params: AnyObject, completionHandler: @escaping (_ status: Bool, _ response: AnyObject, _ error: NSError?) -> ()){
    guard isInternetAvailable()==true else {
      Console.message(Constant.NoInternet)
      return
    }
    
    // Set up create URL Session
    let session = URLSession.shared
    let endURL  = apiEnvirenment.live.rawValue+endPoint
    Console.message("endPointURL %@\(endURL)")
    
    //NSLog json request
    /*
     *  Below method is used to NSLog request in JSON Format.
     */
    NSLogJsonRequest(params: params)
    guard let url = URL(string: endURL) else {   NSLog("Get an error");  return  }
    
    let urlRequest = NSMutableURLRequest(url: url)
    
    //Call method
    setUpHeader(urlRequest: urlRequest, method: method)
    
    do {
      let jsonObject = try JSONSerialization.data(withJSONObject: params, options: [])
      urlRequest.httpBody = jsonObject
    } catch {
      NSLog(error.localizedDescription)
    }
    
    // **** Make the request **** //
    let task = session.dataTask(with: urlRequest as URLRequest, completionHandler: { (data, response, error) in
      // make sure we got data
      
      if data != nil
      {
        var jsonResult: NSDictionary!
        jsonResult = nil
        // parse the result as JSON, since that's what the API provides
        do {
 
          jsonResult  = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
          //  Got data
          //MARK:-  Parsed received json using helper method
          /*
           *  Below method is used to parse received JSON Data .
           */
          WebServiceHelper.jsonParsing(jsonResult: jsonResult, completionHandler: completionHandler)
        } catch let error {
          Console.message(error)
        }
        
      }else {
        //    NSLog("Something went wrong")
        Console.message(Constant.NoProperApiResponse)
       }
    })
    task.resume()
    
  }
  
  //MARK:- Set up Header
  private  static func setUpHeader(urlRequest:NSMutableURLRequest,method:String)
  {
    urlRequest.httpMethod = method//"POST"
    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
    urlRequest.timeoutInterval = 120
    
    let seconds = TimeZone.current.secondsFromGMT()
    let second_string="\(seconds)"
    //        urlRequest.setValue(BaseURL.ApiServiceToken.rawValue, forHTTPHeaderField: "ApiServiceToken")
    //        urlRequest.setValue(second_string, forHTTPHeaderField: "Offset")
    //        urlRequest.setValue(Utility.appVersion(), forHTTPHeaderField: "AppVersion")
    
    //        if Utility.shared.isUserLoginBefore{
    //            urlRequest.setValue( "bearer " + (Utility.getLoginModel()?.authorizationToken ?? ""), forHTTPHeaderField: "Authorization")
    //            urlRequest.setValue( ("\(Utility.getLoginModel()?.businessId ?? 0)" ), forHTTPHeaderField: "BusinessId")
    //        }
    
    //        Utility.shared.DLog(object: "all header value === \(urlRequest.allHTTPHeaderFields!)")
    
  }
  
  
  
  private  class func generateBoundaryString() -> String {
    return "************"
  }
  
  //MARK:- //***** NSLog json request ***** //
  private  class func NSLogJsonRequest(params:AnyObject)
  {
    do {
      if let postData : NSData = try JSONSerialization.data(withJSONObject: params, options: JSONSerialization.WritingOptions.prettyPrinted) as NSData?{
        
        let json = NSString(data: postData as Data, encoding: String.Encoding.utf8.rawValue)! as String
        Console.message("*********** json request ---->>>>>>> \(json)")
        
      }
      
    }
    catch {
      Console.message("\(error)")
    }
  }
  /*
   *  Below method is used to parse response received from server.
   */
  //MARK:-  Parsed received json using helper method
  private static func jsonParsing(jsonResult: NSDictionary?, completionHandler: @escaping (_ status: Bool, _ response: AnyObject, _ error: NSError?) -> ())
  {
    if let jsonResult = jsonResult
    {
      if let responseCode = jsonResult["ResponseCode"] as? Int
      {
        
        if responseCode == 204 // session has been expired
        {
          
          if let error = jsonResult["FailureMsg"] as? String
          {
            Console.message(error)
          }
        }
        
        else if responseCode == 211 //App version not match
        {
          if let error = jsonResult["FailureMsg"] as? String
          {
            Console.message(error)
          }
        }
        else if responseCode == 200 //Success
        {
          DispatchQueue.main.async(execute: {
            completionHandler(true, jsonResult, nil)
          });
        }
        else{
          if let arrValidation = jsonResult["ValidationErrors"] as? [String]
          {
            let validationError = arrValidation.joined(separator: "\n")
            Console.message(validationError)
          }
        }
      }
    }else{ // json is nil
      Console.message(Constant.NoProperApiResponse)
    }
    
  }
  
  //MARK:- //***** Check Internet ***** //
  private class func isInternetAvailable() -> Bool {
    var zeroAddress = sockaddr_in()
    zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
    zeroAddress.sin_family = sa_family_t(AF_INET)
    
    let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
      $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
        SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
      }
    }
    var flags = SCNetworkReachabilityFlags()
    if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
      return false
    }
    let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
    let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
    return (isReachable && !needsConnection)
  }
  
}
