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
    
    func styleLayoutStandard() {
        setStyleLayout(.layoutLeftRightCenter)
    }
    
    func setStyleLayout(_ styleLayout: StyleLayout) {
        switch styleLayout {
        case .layoutCenterLeftRight:
            backgroundColor = #colorLiteral(red: 0.06274509804, green: 0.4, blue: 0.5960784314, alpha: 1)
            addPhotoCenterTopButton.isHidden = false
            addPhotoLeftLawsButton.isHidden = false
            addPhotoRightLawsButton.isHidden = false
            addPhotoLeftTopButton.isHidden = true
            addPhotoRightTopButton.isHidden = true
            addPhotoCenterLowsButton.isHidden = true
        case .layoutLeftRightCenter:
            backgroundColor = #colorLiteral(red: 0.06274509804, green: 0.4, blue: 0.5960784314, alpha: 1)
            addPhotoLeftTopButton.isHidden = false
            addPhotoRightTopButton.isHidden = false
            addPhotoCenterLowsButton.isHidden = false
            addPhotoCenterTopButton.isHidden = true
            addPhotoLeftLawsButton.isHidden = true
            addPhotoRightLawsButton.isHidden = true
        case .layoutTwoLeftRight:
            backgroundColor = #colorLiteral(red: 0.06274509804, green: 0.4, blue: 0.5960784314, alpha: 1)
            addPhotoLeftTopButton.isHidden = false
            addPhotoRightTopButton.isHidden = false
            addPhotoLeftLawsButton.isHidden = false
            addPhotoRightLawsButton.isHidden = false
            addPhotoCenterTopButton.isHidden = true
            addPhotoCenterLowsButton.isHidden = true
        
        }
    }
    
    func setColorAddPhotoButtonInModePortrait() {
        addPhotoCenterTopButton.setImage(#imageLiteral(resourceName: "AddPhotoPortrait"), for: .normal)
        addPhotoLeftLawsButton.setImage(#imageLiteral(resourceName: "AddPhotoPortrait"), for: .normal)
        addPhotoRightLawsButton.setImage(#imageLiteral(resourceName: "AddPhotoPortrait"), for: .normal)
        addPhotoLeftTopButton.setImage(#imageLiteral(resourceName: "AddPhotoPortrait"), for: .normal)
        addPhotoRightTopButton.setImage(#imageLiteral(resourceName: "AddPhotoPortrait"), for: .normal)
        addPhotoCenterLowsButton.setImage(#imageLiteral(resourceName: "AddPhotoPortrait"), for: .normal)
    }
    
    func setColorAddPhotoButtonInModeLandscape() {
        addPhotoCenterTopButton.setImage(#imageLiteral(resourceName: "AddPhotoLandscape"), for: .normal)
        addPhotoLeftLawsButton.setImage(#imageLiteral(resourceName: "AddPhotoLandscape"), for: .normal)
        addPhotoRightLawsButton.setImage(#imageLiteral(resourceName: "AddPhotoLandscape"), for: .normal)
        addPhotoLeftTopButton.setImage(#imageLiteral(resourceName: "AddPhotoLandscape"), for: .normal)
        addPhotoRightTopButton.setImage(#imageLiteral(resourceName: "AddPhotoLandscape"), for: .normal)
        addPhotoCenterLowsButton.setImage(#imageLiteral(resourceName: "AddPhotoLandscape"), for: .normal)
    }
}
