//
//  LoginController.swift
//  GreenyEarth
//
//  Created by Ajith Panneerselvam on 05/02/18.
//  Copyright © 2018 Team United. All rights reserved.
//

import UIKit
import FBSDKLoginKit


class LoginController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}
