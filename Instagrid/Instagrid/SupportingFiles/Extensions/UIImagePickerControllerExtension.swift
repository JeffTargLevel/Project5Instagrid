//
//  UIImagePickerControllerExtension.swift
//  Instagrid
//
//  Created by Jean-François Santolaria on 17/09/2018.
//  Copyright © 2018 OpenClassroomsFRSantolariaJF. All rights reserved.
//

import Foundation
import UIKit

extension UIImagePickerController {
    override open var shouldAutorotate: Bool {
        return true
    }
    override open var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return .all
    }
}
