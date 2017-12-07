//
//  WebViewModel.swift
//  OAuthWebViewUniversal
//
//  Created by Andrei Momot on 12/7/17.
//  Copyright © 2017 Andrey Momot. All rights reserved.
//

import UIKit

protocol WebViewModelDelegate: NSObjectProtocol {
    
}

protocol WebViewModelProtocol: NSObjectProtocol {
    
    weak var delegate: WebViewModelDelegate? { get set }
    var url: URL! { get set }
}

class WebViewModel: NSObject, WebViewModelProtocol {
    var url: URL!
    
    // MARK: - WebViewModel methods

    weak public var delegate: WebViewModelDelegate?
    
    /** Implement WebViewModel methods here */
    
    
    // MARK: - Private methods
    
    /** Implement private methods here */
    
}
