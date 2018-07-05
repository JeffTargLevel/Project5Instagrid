//
//  CustomImagesView.swift
//  Instagrid
//
//  Created by Jean-François Santolaria on 05/07/2018.
//  Copyright © 2018 OpenClassroomsFRSantolariaJF. All rights reserved.
//

import UIKit

class CustomImagesView: UIView {

    @IBOutlet private var addPhotoCenterTopButton: UIButton!
    @IBOutlet private var addPhotoRightTopButton: UIButton!
    @IBOutlet private var addPhotoLeftTopButton: UIButton!
    @IBOutlet private var addPhotoCenterLowsButton: UIButton!
    @IBOutlet private var addPhotoLeftLawsButton: UIButton!
    @IBOutlet private var addPhotoRightLawsButton: UIButton!
    
    enum StyleLayout {
        case layoutCenterLeftRight, layoutLeftRightCenter, layoutTwoLeftRight
    }
    
    private func setStyleLayout(styleLayout: StyleLayout) {
        switch styleLayout {
        case .layoutCenterLeftRight:
            backgroundColor = #colorLiteral(red: 0.06274509804, green: 0.4, blue: 0.5960784314, alpha: 1)
            addPhotoCenterTopButton.isHidden = false
            addPhotoLeftLawsButton.isHidden = false
            addPhotoRightLawsButton.isHidden = false
            addPhotoLeftTopButton.isHidden = true
            addPhotoRightTopButton.isHidden = true
            addPhotoCenterLowsButton.isHidden = true
        default:
            <#code#>
        }
    }

}
