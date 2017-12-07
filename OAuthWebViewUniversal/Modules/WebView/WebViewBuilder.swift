//
//  WebViewBuilder.swift
//  OAuthWebViewUniversal
//
//  Created by Andrei Momot on 12/7/17.
//  Copyright © 2017 Andrey Momot. All rights reserved.
//

import UIKit

class WebViewBuilder: NSObject {

    class func viewController(url: URL) -> WebViewViewController {

        let view: WebViewViewProtocol = WebViewView.create() as  WebViewViewProtocol
        let model: WebViewModelProtocol = WebViewModel()
        model.url = url
        let router = WebViewRouter()
        
        let viewController = WebViewViewController(withView: view, model: model, router: router)
        return viewController
    }
}
