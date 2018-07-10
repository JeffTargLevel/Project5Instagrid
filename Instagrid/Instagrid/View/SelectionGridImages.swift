//
//  SelectionGridImages.swift
//  Instagrid
//
//  Created by Jean-François Santolaria on 10/07/2018.
//  Copyright © 2018 OpenClassroomsFRSantolariaJF. All rights reserved.
//

import UIKit

class SelectionGridImages: UIStackView {
    
    @IBOutlet weak var selectionGridImagesCenterTopLeftBottomRightBottomButton: UIButton!
    @IBOutlet weak var selectionGridImagesLeftTopRightTopCenterBottomButton: UIButton!
    @IBOutlet weak var selectionGridImagesLeftRightTopAndLeftRightBottomButton: UIButton!
    
    func showTheSelectedButtonAtStartup() {
       selectionGridImagesLeftTopRightTopCenterBottomButton.isSelected = true
    }
    
    func selectGridImagesCenterTopLeftBottomRightBottom() {
        selectionGridImagesCenterTopLeftBottomRightBottomButton.isSelected = true
        selectionGridImagesLeftTopRightTopCenterBottomButton.isSelected = false
        selectionGridImagesLeftRightTopAndLeftRightBottomButton.isSelected = false
    }
    
    func selectGridImagesLeftTopRightTopCenterBottom() {
        selectionGridImagesLeftTopRightTopCenterBottomButton.isSelected = true
        selectionGridImagesLeftRightTopAndLeftRightBottomButton.isSelected = false
        selectionGridImagesCenterTopLeftBottomRightBottomButton.isSelected = false
    }
    
    func selectGridImagesLeftRightTopAndLeftRightBottom() {
        selectionGridImagesLeftRightTopAndLeftRightBottomButton.isSelected = true
        selectionGridImagesCenterTopLeftBottomRightBottomButton.isSelected = false
        selectionGridImagesLeftTopRightTopCenterBottomButton.isSelected = false
    }
}
