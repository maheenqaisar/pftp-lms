//
//  UICornerRadius+Extension.swift
//  pftp-lms
//
//  Created by Maheen on 04/05/2023.
//

import UIKit

extension UIView{
   @IBInspectable var cornerRadius: CGFloat {
       get{return self.cornerRadius }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
