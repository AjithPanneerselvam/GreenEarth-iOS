//
//  ButtonWithImage.swift
//  GreenyEarth
//
//  Created by Ajith Panneerselvam on 05/02/18.
//  Copyright © 2018 Team United. All rights reserved.
//

import UIKit

class ButtonWithImage: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 5, left: (bounds.width - 35), bottom: 5, right: 5)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (imageView?.frame.width)!)
        }
    }
}
