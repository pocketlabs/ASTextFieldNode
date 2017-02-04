//
//  ASTextFieldView.swift
//  ASTextFieldNode
//
//  Created by Kyle Shank on 2/3/17.
//  Copyright © 2017 Kyle Shank. All rights reserved.
//

import AsyncDisplayKit

public class ASTextFieldView : UITextField {
    var contentInset : UIEdgeInsets = UIEdgeInsets.zero
    
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + self.contentInset.left, y: bounds.origin.y + self.contentInset.top, width: bounds.size.width - self.contentInset.left - self.contentInset.right, height: bounds.size.height - self.contentInset.top - self.contentInset.bottom)
    }
    
    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        return self.textRect(forBounds: bounds)
    }
}
