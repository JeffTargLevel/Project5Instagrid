//
//  CustomImagesView.swift
//  Instagrid
//
//  Created by Jean-François Santolaria on 05/07/2018.
//  Copyright © 2018 OpenClassroomsFRSantolariaJF. All rights reserved.
//

import UIKit

class GridImagesView: UIView {

    @IBOutlet private var addPhotoCenterTopButton: UIButton!
    @IBOutlet private var addPhotoRightTopButton: UIButton!
    @IBOutlet private var addPhotoLeftTopButton: UIButton!
    @IBOutlet private var addPhotoCenterBottomButton: UIButton!
    @IBOutlet private var addPhotoLeftBottomButton: UIButton!
    @IBOutlet private var addPhotoRightBottomButton: UIButton!
    
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
        case .leftTopRightTopCenterBottom:
            addPhotoLeftTopButton.isHidden = false
            addPhotoRightTopButton.isHidden = false
            addPhotoCenterBottomButton.isHidden = false
            addPhotoCenterTopButton.isHidden = true
            addPhotoLeftBottomButton.isHidden = true
            addPhotoRightBottomButton.isHidden = true
        case .leftRightTopAndleftRightBottom:
            addPhotoLeftTopButton.isHidden = false
            addPhotoRightTopButton.isHidden = false
            addPhotoLeftBottomButton.isHidden = false
            addPhotoRightBottomButton.isHidden = false
            addPhotoCenterTopButton.isHidden = true
            addPhotoCenterBottomButton.isHidden = true
        }
    }
    
    func setColorAddPhotoButtonInModePortrait() {
        addPhotoCenterTopButton.setImage(#imageLiteral(resourceName: "AddPhotoPortrait"), for: .normal)
        addPhotoLeftBottomButton.setImage(#imageLiteral(resourceName: "AddPhotoPortrait"), for: .normal)
        addPhotoRightBottomButton.setImage(#imageLiteral(resourceName: "AddPhotoPortrait"), for: .normal)
        addPhotoLeftTopButton.setImage(#imageLiteral(resourceName: "AddPhotoPortrait"), for: .normal)
        addPhotoRightTopButton.setImage(#imageLiteral(resourceName: "AddPhotoPortrait"), for: .normal)
        addPhotoCenterBottomButton.setImage(#imageLiteral(resourceName: "AddPhotoPortrait"), for: .normal)
    }
    
    func setColorAddPhotoButtonInModeLandscape() {
        addPhotoCenterTopButton.setImage(#imageLiteral(resourceName: "AddPhotoLandscape"), for: .normal)
        addPhotoLeftBottomButton.setImage(#imageLiteral(resourceName: "AddPhotoLandscape"), for: .normal)
        addPhotoRightBottomButton.setImage(#imageLiteral(resourceName: "AddPhotoLandscape"), for: .normal)
        addPhotoLeftTopButton.setImage(#imageLiteral(resourceName: "AddPhotoLandscape"), for: .normal)
        addPhotoRightTopButton.setImage(#imageLiteral(resourceName: "AddPhotoLandscape"), for: .normal)
        addPhotoCenterBottomButton.setImage(#imageLiteral(resourceName: "AddPhotoLandscape"), for: .normal)
    }
}
