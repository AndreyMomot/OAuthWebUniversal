//
//  MVCViewController.swift
//  Stadio
//
//  Created by Igor Markov on 5/8/16.
//  Copyright © 2016 DB Best Technologies LLC. All rights reserved.
//

import UIKit

/**
 @class MVCViewController
 @brief Base class for MVC modules.
 @discussion This class is to be used with MVC module templates for Xcode.
 */
public class MVCViewController<ModelType, ViewType, RouterType>: UIViewController {
    
    /* @brief A model from MVC */
    var model: ModelType!
    
    /* @brief A view from MVC */
    var customView: ViewType! {
        return self.view as! ViewType
    }
    
    /* @brief A router from MVC, optional */
    var router: RouterType?
    
    /** @brief temp view for setting a view in -loadView */
    fileprivate var tempView: ViewType?
    
    // MARK: - Initializers
    
    /**
     @brief Designated initializer. Allows you to pass a view and a model
     via constructor in order to respect dependency injection concept.
     */
    required public init(withView view: ViewType!, model: ModelType!, router: RouterType?) {
        self.model = model
        self.tempView = view
        self.router = router
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    convenience init(withView view: ViewType!, model: ModelType!) {
        self.init(withView: view, model: model, router: nil)
    }
    
    convenience override init(nibName: String?, bundle: Bundle?) {
        fatalError("This class needs to be initialized with init(withView:model:router) method")
    }
    
    required convenience public init?(coder aDecoder: NSCoder) {
        fatalError("This class needs to be initialized with init(withView:model:router) method")
    }
    
    override public func loadView() {
        super.loadView()

        guard let view = self.tempView as? UIView else {
            fatalError("tempView must be UIView instance")
        }
        
        self.view = view
        self.tempView = nil
    }
}

extension UIView {
    
    class func create<T>() -> T {
        let viewNibName = String(describing: self)
        let nibContent = Bundle(for: self).loadNibNamed(viewNibName, owner: nil, options: nil)
        guard
            let view = nibContent?.first,
            type(of:view) == self
            else {
                fatalError("Nib \(viewNibName) does not contain \(viewNibName) View as first object")
        }
        return view as! T
    }
    
}
