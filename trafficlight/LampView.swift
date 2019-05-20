//
//  LampView.swift
//  trafficlight
//
//  Created by Damien Laughton on 30/04/2019.
//  Copyright © 2019 Damien Laughton. All rights reserved.
//

import UIKit

@IBDesignable public class LampView: UIView {

    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.configure()
    }

    func configure() {
        self.accessibilityIdentifier = "LampView"
    }

    override public func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = 0.5 * bounds.size.width
    }

    func on() {
        self.isHidden = false
    }

    func off() {
        self.isHidden = true
    }
}
