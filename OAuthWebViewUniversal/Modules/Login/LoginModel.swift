//
//  LoginModel.swift
//  OAuthWebViewUniversal
//
//  Created by Andrei Momot on 12/7/17.
//  Copyright © 2017 Andrey Momot. All rights reserved.
//

import UIKit

protocol LoginModelDelegate: NSObjectProtocol {
    
}

protocol LoginModelProtocol: NSObjectProtocol {
    
    weak var delegate: LoginModelDelegate? { get set }
}

class LoginModel: NSObject, LoginModelProtocol {
    
    // MARK: - LoginModel methods

    weak public var delegate: LoginModelDelegate?
    
    /** Implement LoginModel methods here */
    
    
    // MARK: - Private methods
    
    /** Implement private methods here */
    
}
