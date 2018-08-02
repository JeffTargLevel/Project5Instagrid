//
//  CustomImagesView.swift
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
    
    var isReadyForTheShare: Bool {
        
        return addPhotoCenterTopButton.currentImage != #imageLiteral(resourceName: "AddPhotoPortrait") && addPhotoRightTopButton.currentImage != #imageLiteral(resourceName: "AddPhotoPortrait") && addPhotoLeftTopButton.currentImage != #imageLiteral(resourceName: "AddPhotoPortrait") && addPhotoCenterBottomButton.currentImage != #imageLiteral(resourceName: "AddPhotoPortrait") && addPhotoLeftBottomButton.currentImage != #imageLiteral(resourceName: "AddPhotoPortrait") && addPhotoRightBottomButton.currentImage != #imageLiteral(resourceName: "AddPhotoPortrait") || addPhotoLeftTopButton.currentImage != #imageLiteral(resourceName: "AddPhotoPortrait") && addPhotoRightTopButton.currentImage != #imageLiteral(resourceName: "AddPhotoPortrait") && addPhotoLeftBottomForLayout2X2Button.currentImage != #imageLiteral(resourceName: "AddPhotoPortrait") && addPhotoRightBottomForLayout2X2Button != #imageLiteral(resourceName: "AddPhotoPortrait")
    }
    
    enum Layout {
        case centerTopLeftBottomRightBottom, leftTopRightTopCenterBottom, leftRightTopAndleftRightBottom
    }
    
    var setLayoutStandard: Layout = .leftTopRightTopCenterBottom {
        didSet {
            setLayout(setLayoutStandard)
        }
    }
    
    func showLayout1Buttons(_ isInactive: Bool) {
        addPhotoCenterTopButton.isHidden = isInactive
        addPhotoLeftBottomButton.isHidden = isInactive
        addPhotoRightBottomButton.isHidden = isInactive
    }
    
    func showLayout2Buttons(_ isInactive: Bool) {
        addPhotoLeftTopButton.isHidden = isInactive
        addPhotoRightTopButton.isHidden = isInactive
        addPhotoCenterBottomButton.isHidden = isInactive
    }
    
    func showLayout3Buttons(_ isInactive: Bool) {
        addPhotoLeftBottomForLayout2X2Button.isHidden = isInactive
        addPhotoRightBottomForLayout2X2Button.isHidden = isInactive
    }
    
    func setLayout(_ styleLayout: Layout) {
        switch styleLayout {
        case .centerTopLeftBottomRightBottom:
            showLayout1Buttons(false)
            showLayout2Buttons(true)
            showLayout3Buttons(true)
            
        case .leftTopRightTopCenterBottom:
            showLayout2Buttons(false)
            showLayout1Buttons(true)
            showLayout3Buttons(true)
            
        case .leftRightTopAndleftRightBottom:
            showLayout3Buttons(false)
            addPhotoLeftTopButton.isHidden = false
            addPhotoRightTopButton.isHidden = false
            showLayout1Buttons(true)
            addPhotoCenterBottomButton.isHidden = true
        }
    }
}


