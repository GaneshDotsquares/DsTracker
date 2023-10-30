// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import UIKit
import WebKit

public class DSTrackerWebView: WKWebView {
    
    public init() {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.preferences.javaScriptEnabled = true
        super.init(frame: .zero, configuration: webConfiguration)
        self.scrollView.isScrollEnabled = true
        self.isMultipleTouchEnabled = false
 
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    @discardableResult
  public func load(view:UIView, url:String =  "https://medium.com/") -> WKNavigation? {
        if let url = URL(string:url) {
            let req = URLRequest(url: url)
//            addaConstraint(view: view)
            return super.load(req)
          
        }
        return nil
    }
  
 private func addaConstraint(view:UIView){
    view.addSubview(self)
    self.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    self.topAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    self.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }
}
