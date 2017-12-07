//
//  LoginView.swift
//  OAuthWebViewUniversal
//
//  Created by Andrei Momot on 12/7/17.
//  Copyright © 2017 Andrey Momot. All rights reserved.
//

import UIKit

protocol LoginViewDelegate: NSObjectProtocol {
    
    func viewFacebookLogin(view: LoginViewProtocol)
    func viewTwitterLogin(view: LoginViewProtocol)
    func viewGoogleLogin(view: LoginViewProtocol)
    func viewInstagramLogin(view: LoginViewProtocol)
}

protocol LoginViewProtocol: NSObjectProtocol {
    
    weak var delegate: LoginViewDelegate? { get set }
}

class LoginView: UIView, LoginViewProtocol{
    
    // MARK: - LoginView interface methods

    weak public var delegate: LoginViewDelegate?
    
    // MARK: - Overrided methods

    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - IBActions
    @IBAction func onPressedFacebookLogin(_ sender: Any) {
        self.delegate?.viewFacebookLogin(view: self)
    }
    
    @IBAction func onPressedTwitterLogin(_ sender: Any) {
        self.delegate?.viewTwitterLogin(view: self)
    }
    
    @IBAction func onPressedGoogleLogin(_ sender: Any) {
        self.delegate?.viewGoogleLogin(view: self)
    }
    
    @IBAction func onPressedInstagramLogin(_ sender: Any) {
        self.delegate?.viewInstagramLogin(view: self)
    }
}
