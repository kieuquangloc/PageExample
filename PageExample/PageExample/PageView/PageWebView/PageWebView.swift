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
    
    var item = PageItem(text: "", color: ""){
        didSet{
            if self.didLoad {
                self.changeText(text: self.item.text)
                self.changeColor(color: self.item.color)
            }
        }
    }
    var didLoad = false
    
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
        
        self.didLoad = true
        // self.changeFontSize(size: 200)
        
        self.changeText(text: self.item.text)
        self.changeColor(color: self.item.color)
        
    }
    
}


extension PageWebView {
    func changeText(text: String){
        print("\(self.className) \(#function)")
        let str = "changeText('\(text)')"
        self.webview.evaluateJavaScript(str) { [weak self] (response, error) in
            guard let `self` = self else { return }
            if error != nil {
                print("\(self.className) \(#function): \n\n\(error.debugDescription) \n\n")
            }
//            self.didShowChar = true
        }
    }
    
    func changeColor(color: String){
        print("\(self.className) \(#function)")
        let str = "changeColor('\(color)')"
        self.webview.evaluateJavaScript(str) { [weak self] (response, error) in
            guard let `self` = self else { return }
            if error != nil {
                print("\(self.className) \(#function): \n\n\(error.debugDescription) \n\n")
            }
//            self.didShowChar = true
        }
    }
    
    func changeFontSize(size: Int){
        print("\(self.className) \(#function)")
        let str = "changeFontSize('\(size)')"
        self.webview.evaluateJavaScript(str) { [weak self] (response, error) in
            guard let `self` = self else { return }
            if error != nil {
                print("\(self.className) \(#function): \n\n\(error.debugDescription) \n\n")
            }
//            self.didShowChar = true
        }
    }
    
    
}

