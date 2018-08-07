//
//  LayoutImagesView.swift
//  Instagrid
//
//  Created by Jean-François Santolaria on 05/07/2018.
//  Copyright © 2018 OpenClassroomsFRSantolariaJF. All rights reserved.
//

import UIKit

class LayoutImagesView: UIView {
    
    @IBOutlet private var addPhotoCenterTopButton: UIButton!
    @IBOutlet private var addPhotoRightTopButton: UIButton!
    @IBOutlet private var addPhotoLeftTopButton: UIButton!
    @IBOutlet private var addPhotoCenterBottomButton: UIButton!
    @IBOutlet private var addPhotoLeftBottomButton: UIButton!
    @IBOutlet private var addPhotoRightBottomButton: UIButton!
    @IBOutlet private var addPhotoLeftBottomForLayout2X2Button: UIButton!
    @IBOutlet private var addPhotoRightBottomForLayout2X2Button: UIButton!
    
    enum Layout {
        case centerTopLeftBottomRightBottom, leftTopRightTopCenterBottom, leftRightTopAndleftRightBottom
    }
    
    var setLayoutStandard: Layout = .leftTopRightTopCenterBottom {
        didSet {
            setLayout(setLayoutStandard)
        }
    }
    
    func showLayout1X2Buttons(_ isInactive: Bool) {
        addPhotoCenterTopButton.isHidden = isInactive
        addPhotoLeftBottomButton.isHidden = isInactive
        addPhotoRightBottomButton.isHidden = isInactive
    }
    
    func showLayout2X1Buttons(_ isInactive: Bool) {
        addPhotoLeftTopButton.isHidden = isInactive
        addPhotoRightTopButton.isHidden = isInactive
        addPhotoCenterBottomButton.isHidden = isInactive
    }
    
    func showLayout2X2Buttons(_ isInactive: Bool) {
        addPhotoLeftBottomForLayout2X2Button.isHidden = isInactive
        addPhotoRightBottomForLayout2X2Button.isHidden = isInactive
    }
    
    func setLayout(_ styleLayout: Layout) {
        switch styleLayout {
        case .centerTopLeftBottomRightBottom:
            showLayout1X2Buttons(false)
            showLayout2X1Buttons(true)
            showLayout2X2Buttons(true)
            
        case .leftTopRightTopCenterBottom:
            showLayout2X1Buttons(false)
            showLayout1X2Buttons(true)
            showLayout2X2Buttons(true)
            
        case .leftRightTopAndleftRightBottom:
            showLayout2X2Buttons(false)
            addPhotoLeftTopButton.isHidden = false
            addPhotoRightTopButton.isHidden = false
            showLayout1X2Buttons(true)
            addPhotoCenterBottomButton.isHidden = true
        }
    }
}


