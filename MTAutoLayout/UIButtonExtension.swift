//
//  UIButtonExtension.swift
//  MTAutoLayout
//
//  Created by Minh Thang on 11/22/15.
//  Copyright © 2015 Minh Thang. All rights reserved.
//

import UIKit

extension UIButton {
    
    convenience init(title: String, bgColor: UIColor = UIColor.lightGray) {
        self.init(frame: CGRectZero)
        
        setTitle(title, for: UIControl.State.Normal)
        setTitleColor(UIColor.black, for: UIControl.State.Normal)
        backgroundColor = bgColor
        titleLabel?.font = UIFont.systemFont(ofSize: 11)
    }
}
