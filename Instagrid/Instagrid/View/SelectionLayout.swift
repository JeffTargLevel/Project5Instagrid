//
//  SelectionLayout.swift
//  Instagrid
//
//  Created by Jean-François Santolaria on 10/07/2018.
//  Copyright © 2018 OpenClassroomsFRSantolariaJF. All rights reserved.
//

import UIKit

class SelectionLayout: UIStackView {
    
    @IBOutlet private var selectLayout1X2Button: UIButton!
    @IBOutlet private var selectLayout2X1Button: UIButton!
    @IBOutlet private var selectLayout2X2Button: UIButton!
    
    func showTheSelectedButtonAtStartup() {
       selectLayout2X1Button.isSelected = true
    }
    
    func selectLayout1X2() {
        selectLayout1X2Button.isSelected = true
        selectLayout2X1Button.isSelected = false
        selectLayout2X2Button.isSelected = false
    }
    
    func selectLayout2X1() {
        selectLayout2X1Button.isSelected = true
        selectLayout2X2Button.isSelected = false
        selectLayout1X2Button.isSelected = false
    }
    
    func selectLayout2X2() {
        selectLayout2X2Button.isSelected = true
        selectLayout1X2Button.isSelected = false
        selectLayout2X1Button.isSelected = false
    }
}
