//
//  FDBaseViewController.swift
//  FaceDetection
//
//  Created by Alex Korygin on 12.09.17.
//  Copyright © 2017 DBBest. All rights reserved.
//

import Foundation
import UIKit

public class BaseViewController<ModelType, ViewType, RouterType>: MVCViewController<ModelType, ViewType, RouterType> {
    
    typealias ClosureType = () -> Void
    var closure:ClosureType?
    
     override public func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "close"), style: .plain, target: self, action: #selector(closeButtonAction))
    }
    
    func closeButtonAction()  {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
}
