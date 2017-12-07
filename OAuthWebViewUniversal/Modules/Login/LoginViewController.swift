//
//  LoginViewController.swift
//  OAuthWebViewUniversal
//
//  Created by Andrei Momot on 12/7/17.
//  Copyright © 2017 Andrey Momot. All rights reserved.
//

import UIKit

typealias LoginViewControllerType = BaseViewController<LoginModelProtocol, LoginViewProtocol, LoginRouter>

class LoginViewController: LoginViewControllerType {
    
    // MARK: Initializers
    
    required public init(withView view: LoginViewProtocol!, model: LoginModelProtocol!, router: LoginRouter?) {
        super.init(withView: view, model: model, router: router)
    }
    
    // MARK: - View life cycle

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        customView.delegate = self
        model.delegate = self
    }
}

// MARK: - LoginViewDelegate

extension LoginViewController: LoginViewDelegate {
    func viewFacebookLogin(view: LoginViewProtocol) {
        let authURL = String(format: "%@?client_id=%@&redirect_uri=%@&response_type=token&scope=%@&DEBUG=True", arguments: [SOCIAL.FACEBOOK_AUTHURL,SOCIAL.FACEBOOK_CLIENT_ID,SOCIAL.REDIRECT_URI, SOCIAL.FACEBOOK_SCOPE ])
        self.router?.navigateToWebViewVC(from: self, withUrl: URL(string: authURL)!)    }
    
    func viewTwitterLogin(view: LoginViewProtocol) {
        let authURL = String(format: "%@?client_id=%@&redirect_uri=%@&response_type=token&scope=%@&DEBUG=True", arguments: [SOCIAL.TWITTER_AUTHURL,SOCIAL.TWITTER_CLIENT_ID,SOCIAL.REDIRECT_URI, SOCIAL.TWITTER_SCOPE ])
        self.router?.navigateToWebViewVC(from: self, withUrl: URL(string: authURL)!)    }
    
    func viewGoogleLogin(view: LoginViewProtocol) {
        let authURL = String(format: "%@?client_id=%@&redirect_uri=%@&response_type=token&scope=%@&DEBUG=True", arguments: [SOCIAL.GOOGLE_AUTHURL,SOCIAL.GOOGLE_CLIENT_ID,SOCIAL.REDIRECT_URI, SOCIAL.GOOGLE_SCOPE ])
        self.router?.navigateToWebViewVC(from: self, withUrl: URL(string: authURL)!)
    }
    
    func viewInstagramLogin(view: LoginViewProtocol) {
        let authURL = String(format: "%@?client_id=%@&redirect_uri=%@&response_type=token&scope=%@&DEBUG=True", arguments: [SOCIAL.INSTAGRAM_AUTHURL,SOCIAL.INSTAGRAM_CLIENT_ID,SOCIAL.REDIRECT_URI, SOCIAL.INSTAGRAM_SCOPE ])
        self.router?.navigateToWebViewVC(from: self, withUrl: URL(string: authURL)!)    }
}

// MARK: - LoginModelDelegate

extension LoginViewController: LoginModelDelegate {
}
