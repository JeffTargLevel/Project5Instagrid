//
//  ViewController.swift
//  Instagrid
//
//  Created by Jean-François Santolaria on 26/06/2018.
//  Copyright © 2018 OpenClassroomsFRSantolariaJF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gridImagesView: GridImagesView!
    @IBOutlet weak var selectionGridImagesCenterTopLeftBottomRightBottomButton: UIButton!
    @IBOutlet weak var selectionGridImagesLeftTopRightTopCenterBottomButton: UIButton!
    @IBOutlet weak var selectionGridImagesLeftRightTopAndLeftRightBottomButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        showAtStartup()
    }

    func showAtStartup() {
        gridImagesView.setLayoutStandard = .leftTopRightTopCenterBottom
        selectionGridImagesLeftTopRightTopCenterBottomButton.isSelected = true
    }
    
    @IBAction func didTapSelectViewCenterLeftRightButton() {
        gridImagesView.setLayout(.centerTopLeftBottomRightBottom)
        selectionGridImagesCenterTopLeftBottomRightBottomButton.isSelected = true
        selectionGridImagesLeftTopRightTopCenterBottomButton.isSelected = false
        selectionGridImagesLeftRightTopAndLeftRightBottomButton.isSelected = false
        
    }
    
    @IBAction func didTapSelectViewLeftRightCenterButton() {
        gridImagesView.setLayout(.leftTopRightTopCenterBottom)
        selectionGridImagesLeftTopRightTopCenterBottomButton.isSelected = true
        selectionGridImagesLeftRightTopAndLeftRightBottomButton.isSelected = false
        selectionGridImagesCenterTopLeftBottomRightBottomButton.isSelected = false
    }
    
    @IBAction func didTapSelectViewTwoLeftRightButton() {
        gridImagesView.setLayout(.leftRightTopAndleftRightBottom)
        selectionGridImagesLeftRightTopAndLeftRightBottomButton.isSelected = true
        selectionGridImagesCenterTopLeftBottomRightBottomButton.isSelected = false
        selectionGridImagesLeftTopRightTopCenterBottomButton.isSelected = false
    }
    
    @objc func rotated() {
        if UIDeviceOrientationIsLandscape(UIDevice.current.orientation) {
            gridImagesView.setColorAddPhotoButtonInModeLandscape()
        }
        
        if UIDeviceOrientationIsPortrait(UIDevice.current.orientation) {
            gridImagesView.setColorAddPhotoButtonInModePortrait()
        }
    }
}

