//
//  Common.swift
//  Chami
//
//  Created by Serg Smyk on 28/04/2017.
//  Copyright © 2017 Chami Apps Limited. All rights reserved.
//

import UIKit

extension UIImage {
    
    public class func imageTemplateWithColor(color:UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image!;
    }
}

