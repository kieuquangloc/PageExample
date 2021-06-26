//
//  PageWebView.swift
//  PageExample
//
//  Created by QuangLoc on 26/06/2021.
//

import UIKit
import WebKit

class PageWebView: UIView {
    
    @IBOutlet weak var webview: WKWebView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureWebview()
        self.loadWebview()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func configureWebview(){
        self.webview.backgroundColor = .white
        self.webview.uiDelegate = self
        self.webview.navigationDelegate = self
    }
    
    func loadWebview(){
        let url = Bundle.main.url(forResource: "PageWebViewSource", withExtension: "html", subdirectory: "PageWebViewSource")!
        self.webview.loadFileURL(url, allowingReadAccessTo: url)
    }
}

extension PageWebView {
    static func create() -> PageWebView {
        let obj = Bundle.main.loadNibNamed("PageWebView", owner: nil, options: nil)?.first as! PageWebView
        return obj
    }
}

extension PageWebView: WKUIDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        print("\(self.className) \(#function)")
        
        decisionHandler(.allow)
    }
}

extension PageWebView: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("\(self.className) \(#function)")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("\(self.className) \(#function)")
    }
    
}

