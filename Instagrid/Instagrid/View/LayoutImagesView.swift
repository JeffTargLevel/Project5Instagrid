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
    
    var isComplete: Bool {
       return addPhotoCenterTopButton.currentImage != #imageLiteral(resourceName: "AddPhotoPortrait") && addPhotoRightTopButton.currentImage != #imageLiteral(resourceName: "AddPhotoPortrait") && addPhotoLeftTopButton.currentImage != #imageLiteral(resourceName: "AddPhotoPortrait") && addPhotoCenterBottomButton.currentImage != #imageLiteral(resourceName: "AddPhotoPortrait") && addPhotoLeftBottomButton.currentImage != #imageLiteral(resourceName: "AddPhotoPortrait") && addPhotoRightBottomButton.currentImage != #imageLiteral(resourceName: "AddPhotoPortrait") 
    }

    enum Layout {
        case centerTopLeftBottomRightBottom, leftTopRightTopCenterBottom, leftRightTopAndleftRightBottom
    }
    
    var setLayoutStandard: Layout = .leftTopRightTopCenterBottom {
        didSet {
            setLayout(setLayoutStandard)
        }
    }
    
    func setLayout(_ styleLayout: Layout) {
        switch styleLayout {
        case .centerTopLeftBottomRightBottom:
            addPhotoCenterTopButton.isHidden = false
            addPhotoLeftBottomButton.isHidden = false
            addPhotoRightBottomButton.isHidden = false
            addPhotoLeftTopButton.isHidden = true
            addPhotoRightTopButton.isHidden = true
            addPhotoCenterBottomButton.isHidden = true
            addPhotoLeftBottomForLayout2X2Button.isHidden = true
            addPhotoRightBottomForLayout2X2Button.isHidden = true
            
        case .leftTopRightTopCenterBottom:
            addPhotoLeftTopButton.isHidden = false
            addPhotoRightTopButton.isHidden = false
            addPhotoCenterBottomButton.isHidden = false
            addPhotoCenterTopButton.isHidden = true
            addPhotoLeftBottomButton.isHidden = true
            addPhotoRightBottomButton.isHidden = true
            addPhotoLeftBottomForLayout2X2Button.isHidden = true
            addPhotoRightBottomForLayout2X2Button.isHidden = true
            
        case .leftRightTopAndleftRightBottom:
            addPhotoLeftTopButton.isHidden = false
            addPhotoRightTopButton.isHidden = false
            addPhotoLeftBottomForLayout2X2Button.isHidden = false
            addPhotoRightBottomForLayout2X2Button.isHidden = false
            addPhotoLeftBottomButton.isHidden = true
            addPhotoRightBottomButton.isHidden = true
            addPhotoCenterTopButton.isHidden = true
            addPhotoCenterBottomButton.isHidden = true
        }
    }
}
