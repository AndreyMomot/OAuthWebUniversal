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

class WebViewViewController: WebViewViewControllerType, UIWebViewDelegate  {
    
    // MARK: Initializers
    
    required public init(withView view: WebViewViewProtocol!, model: WebViewModelProtocol!, router: WebViewRouter?) {
        super.init(withView: view, model: model, router: router)
    }
    
    // MARK: - View life cycle

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        customView.delegate = self
        model.delegate = self
        registerDefaults()
        self.customView.webView.delegate = self
        unSignedRequest()
    }
    
    func registerDefaults() {
        let dictionaty = NSDictionary(object: "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36", forKey: "UserAgent" as NSCopying)
        UserDefaults.standard.register(defaults: dictionaty as! [String : Any])
    }
    
    func unSignedRequest () {
        let urlRequest =  URLRequest(url: self.model.url)
        self.customView.webView.loadRequest(urlRequest)
    }
    
    func checkRequestForCallbackURL(request: URLRequest) -> Bool {
        
        let requestURLString = (request.url?.absoluteString)! as String
        
        if requestURLString.hasPrefix(SOCIAL.REDIRECT_URI) {
            let range: Range<String.Index> = requestURLString.range(of: "#access_token=")!
            handleAuth(authToken: requestURLString.substring(from: range.upperBound))
            return false;
        }
        return true
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
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return checkRequestForCallbackURL(request: request)
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        self.customView.indicator.isHidden = false
        self.customView.indicator.startAnimating()
    }

    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.customView.indicator.isHidden = true
        self.customView.indicator.stopAnimating()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        webViewDidFinishLoad(webView)
    }
}

// MARK: - WebViewViewDelegate

extension WebViewViewController: WebViewViewDelegate {

    public func viewSomeAction(view: WebViewViewProtocol) {
    }
}

// MARK: - WebViewModelDelegate

extension WebViewViewController: WebViewModelDelegate {
}
