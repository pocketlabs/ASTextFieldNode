//
//  ViewController.swift
//  ASTextFieldNodeExample
//
//  Created by Kyle Shank on 2/11/17.
//  Copyright © 2017 Pocket Labs. All rights reserved.
//

import UIKit
import AsyncDisplayKit
import ASTextFieldNode

class ViewController: ASViewController<LoginViewNode> {

    init(){
        super.init( node : LoginViewNode() )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

class LoginViewNode : ASDisplayNode {
    let loginField = ASTextFieldNode()
    let passwordField = ASTextFieldNode()
    let emailLabel = ASTextNode()
    let passwordLabel = ASTextNode()
    
    override init(){
        super.init()
        
        self.automaticallyManagesSubnodes = true
    }
    
    override func didLoad() {
        super.didLoad()
        
        self.backgroundColor = UIColor.white
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 3.0
        
        emailLabel.attributedText = NSAttributedString(string: "Email address", attributes: [NSForegroundColorAttributeName : UIColor.black, NSFontAttributeName : UIFont.boldSystemFont(ofSize: 14.0)])
        passwordLabel.attributedText = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName : UIColor.black, NSFontAttributeName : UIFont.boldSystemFont(ofSize: 14.0)])
        
        loginField.autocapitalizationType = .none
        loginField.autocorrectionType = .no
        loginField.keyboardType = .emailAddress
        
        passwordField.isSecureTextEntry = true
        passwordField.keyboardType = .asciiCapable
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let verticalStack = ASStackLayoutSpec.vertical()
        
        let verticalStack1 = ASStackLayoutSpec.vertical()
        verticalStack1.children = [emailLabel, loginField]
        verticalStack1.spacing = 8.0
        let verticalStack1Layout = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0), child: verticalStack1)
        
        let verticalStack2 = ASStackLayoutSpec.vertical()
        verticalStack2.children = [passwordLabel, passwordField]
        verticalStack2.spacing = 8.0
        let verticalStack2Layout = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0), child: verticalStack2)
        
        verticalStack.children = [verticalStack1Layout, verticalStack2Layout]
        verticalStack.style.width = ASDimension(unit: .points, value: 180.0)
        
        return ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: verticalStack)
    }
}
