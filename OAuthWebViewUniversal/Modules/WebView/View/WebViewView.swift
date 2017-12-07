//
//  WebViewView.swift
//  OAuthWebViewUniversal
//
//  Created by Andrei Momot on 12/7/17.
//  Copyright © 2017 Andrey Momot. All rights reserved.
//

import UIKit

protocol WebViewViewDelegate: NSObjectProtocol {
    
    func viewSomeAction(view: WebViewViewProtocol)
}

protocol WebViewViewProtocol: NSObjectProtocol {
    
    weak var delegate: WebViewViewDelegate? { get set }
    weak var indicator: UIActivityIndicatorView! { get }
    weak var webView: UIWebView! { get }
}

class WebViewView: UIView, WebViewViewProtocol{
    
    // MARK: - WebViewView interface methods

    weak public var delegate: WebViewViewDelegate?
    
    @IBOutlet var indicator: UIActivityIndicatorView!
    @IBOutlet var webView: UIWebView!
    // MARK: - Overrided methods

    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - IBActions
    
    func someButtonAction() {

        self.delegate?.viewSomeAction(view: self)
    }
}
