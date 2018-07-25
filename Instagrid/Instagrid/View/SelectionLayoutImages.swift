//
//  SelectionGridImages.swift
//  Instagrid
//
//  Created by Jean-François Santolaria on 10/07/2018.
//  Copyright © 2018 OpenClassroomsFRSantolariaJF. All rights reserved.
//

import UIKit

class SelectionLayoutImages: UIStackView {
    
    @IBOutlet weak var selectLayout1X2Button: UIButton!
    @IBOutlet weak var selectLayout2X1Button: UIButton!
    @IBOutlet weak var selectLayout2X2Button: UIButton!
    
    func showTheSelectedButtonAtStartup() {
       selectLayout2X1Button.isSelected = true
    }
    
    func selectGridImagesCenterTopLeftBottomRightBottom() {
        selectLayout1X2Button.isSelected = true
        selectLayout2X1Button.isSelected = false
        selectLayout2X2Button.isSelected = false
    }
    
    func selectGridImagesLeftTopRightTopCenterBottom() {
        selectLayout2X1Button.isSelected = true
        selectLayout2X2Button.isSelected = false
        selectLayout1X2Button.isSelected = false
    }
    
    func selectGridImagesLeftRightTopAndLeftRightBottom() {
        selectLayout2X2Button.isSelected = true
        selectLayout1X2Button.isSelected = false
        selectLayout2X1Button.isSelected = false
    }
}
