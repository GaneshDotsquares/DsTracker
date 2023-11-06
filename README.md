 
DS tracker sdk 
1. Download app token
First step is to download the app token. Download this file and put into the root of your Xcode project. If prompted, select to add the config file to all targets.

2. Install SDK
The second step is to install SDK. DSTrackerSdk  provides only one integration method for iOS developers: Pass through SwiftPackage Manager integrated.

3. Initialize SDK
The third step is to Initialize SDK and Set it up
Add configuration file
a. Download the DsTrcker-app-token.json file, Add to targets to the project.
b. Select Copy Items if needed.
c. Create groups.
d. Add to targets.

import header file
Import the header file in the project's AppDelegate file
import DsTrckerSDK

Setup
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//DsTrckerSDK initialization
DsTrcker.shared.configure()
return true
}


Enable SDK log (optional)
You can enable SDK log output before initializing the SDK


func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
// Override point for customization after application launch.
//DsTrckerSDK initialization
DsTrcker.shared.configure()
return true
}


