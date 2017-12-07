//
//  WebViewViewController.swift
//  OAuthWebViewUniversal
//
//  Created by Andrei Momot on 12/7/17.
//  Copyright © 2017 Andrey Momot. All rights reserved.
//

import UIKit
import WebKit

typealias WebViewViewControllerType = BaseViewController<WebViewModelProtocol, WebViewViewProtocol, WebViewRouter>

class WebViewViewController: WebViewViewControllerType, WKNavigationDelegate  {
    
    // MARK: Initializers
    
    required public init(withView view: WebViewViewProtocol!, model: WebViewModelProtocol!, router: WebViewRouter?) {
        super.init(withView: view, model: model, router: router)
    }
    
    // MARK: - View life cycle

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        customView.delegate = self
        model.delegate = self
        self.customView.webView.navigationDelegate = self
        unSignedRequest()
    }
    
    func unSignedRequest () {
        let urlRequest =  URLRequest(url: self.model.url)
        self.customView.webView.load(urlRequest)
    }
    
    func checkRequestForCallbackURL(action: WKNavigationAction) {
        
        let requestURLString = (action.request.url?.absoluteString)! as String
    //    let requestURLString = (request.url?.absoluteString)! as String
        
        if requestURLString.hasPrefix(SOCIAL.REDIRECT_URI) {
            let range: Range<String.Index> = requestURLString.range(of: "#access_token=")!
            handleAuth(authToken: requestURLString.substring(from: range.upperBound))
        }
    }
    
    func handleAuth(authToken: String)  {
        showAlert(title: "Authorized with token:", message: authToken)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - UIWebViewDelegate
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if (navigationAction.navigationType == .linkActivated) {
            decisionHandler(.cancel)
        } else {
            decisionHandler(.allow)
            checkRequestForCallbackURL(action: navigationAction)

        }
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        self.customView.indicator.isHidden = false
        self.customView.indicator.startAnimating()
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.customView.indicator.isHidden = true
        self.customView.indicator.stopAnimating()
    }
    
//    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
//        webView(webView, didFinish: navigation)
//    }
}

// MARK: - WebViewViewDelegate

extension WebViewViewController: WebViewViewDelegate {

    public func viewSomeAction(view: WebViewViewProtocol) {
    }
}

// MARK: - WebViewModelDelegate

extension WebViewViewController: WebViewModelDelegate {
}
