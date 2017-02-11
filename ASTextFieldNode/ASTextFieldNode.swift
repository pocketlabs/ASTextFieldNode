//
//  ASTextFieldNode.swift
//  ASTextFieldNode
//
//  Created by Kyle Shank on 2/3/17.
//  Copyright © 2017 Kyle Shank. All rights reserved.
//

import AsyncDisplayKit

public class ASTextFieldNode : ASDisplayNode, UITextInputTraits {
    public let textFieldNode : ASDisplayNode
    public var textField : ASTextFieldView {
        if self.textFieldNode.view is ASTextFieldView {
            return self.textFieldNode.view as! ASTextFieldView
        }
        return ASTextFieldView()
    }
    
    public var text : String? {
        get {
            return textField.text
        }
        set {
            textField.text = newValue
        }
    }
    
    public var attributedText : NSAttributedString? {
        get {
            return textField.attributedText
        }
        set {
            textField.attributedText = newValue
        }
    }
    
    public var autocapitalizationType: UITextAutocapitalizationType {
        get {
            return textField.autocapitalizationType
        }
        set {
            textField.autocapitalizationType = newValue
        }
    }
    
    public var autocorrectionType: UITextAutocorrectionType  {
        get {
            return textField.autocorrectionType
        }
        set {
            textField.autocorrectionType = newValue
        }
    }
    
    public var spellCheckingType: UITextSpellCheckingType {
        get {
            return textField.spellCheckingType
        }
        set {
            textField.spellCheckingType = newValue
        }
    }
    
    public var keyboardType: UIKeyboardType {
        get {
            return textField.keyboardType
        }
        set {
            textField.keyboardType = newValue
        }
    }
    
    public var keyboardAppearance: UIKeyboardAppearance {
        get {
            return textField.keyboardAppearance
        }
        set {
            textField.keyboardAppearance = newValue
        }
    }
    
    public var returnKeyType: UIReturnKeyType {
        get {
            return textField.returnKeyType
        }
        set {
            textField.returnKeyType = newValue
        }
    }
    
    public var enablesReturnKeyAutomatically: Bool {
        get {
            return textField.enablesReturnKeyAutomatically
        }
        set {
            textField.enablesReturnKeyAutomatically = newValue
        }
    }
    
    public var isSecureTextEntry: Bool {
        get {
            return textField.isSecureTextEntry
        }
        @objc(setSecureTextEntry:) set {
            textField.isSecureTextEntry = newValue
        }
    }
    
    public var contentInset : UIEdgeInsets {
        get {
            return textField.contentInset
        }
        set {
            textField.contentInset = newValue
            let currentFont = textField.font ?? UIFont.systemFont(ofSize: 17.0)
            self.style.height = ASDimension(unit: .points, value: currentFont.lineHeight + textField.contentInset.top + textField.contentInset.bottom)
        }
    }
    
    public var font : UIFont? {
        get {
            return textField.font
        }
        set {
            textField.font = newValue
            if let currentFont = newValue {
                self.style.height = ASDimension(unit: .points, value: currentFont.lineHeight + self.contentInset.top + self.contentInset.bottom)
            }
        }
    }
    
    override public init(){
        textFieldNode = ASDisplayNode(viewBlock: { () -> UIView in
            return ASTextFieldView()
        })
        super.init()
        self.automaticallyManagesSubnodes = true
        self.style.height = ASDimension(unit: .points, value: 31.0)
    }
    
    override public func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        textFieldNode.style.minLayoutSize = ASLayoutSize(width: ASDimension(unit: .points, value: constrainedSize.min.width), height: ASDimension(unit: .points, value: constrainedSize.min.height))
        textFieldNode.style.maxLayoutSize = ASLayoutSize(width: ASDimension(unit: .points, value: constrainedSize.max.width), height: ASDimension(unit: .points, value: constrainedSize.max.height))
        textFieldNode.style.preferredLayoutSize = textFieldNode.style.maxLayoutSize
        return ASAbsoluteLayoutSpec(children: [textFieldNode])
    }
}
