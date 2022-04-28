//
//  UIViewExtension.swift
//  webmark
//
//  Created by Julyo  on 29/04/22.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get{ return cornerRadius }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
