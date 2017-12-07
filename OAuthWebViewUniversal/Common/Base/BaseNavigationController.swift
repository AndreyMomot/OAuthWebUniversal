//
//  FDBaseNavigationController.swift
//  FaceDetection
//
//  Created by Alex Korygin on 19.09.17.
//  Copyright © 2017 DBBest. All rights reserved.
//

import Foundation
import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.setBackgroundImage(UIImage.imageTemplateWithColor(color: UIColor.clear), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.tintColor = UIColor.black
    }
}
