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
    @IBOutlet weak var selectionGridImages: SelectionGridImages!
    
    var photoManagement: PhotoManagement!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        showAtStartup()
    }

    func showAtStartup() {
        gridImagesView.setLayoutStandard = .leftTopRightTopCenterBottom
        selectionGridImages.showTheSelectedButtonAtStartup()
    }
    
    @IBAction func didTapSelectionGridImagesCenterTopLeftBottomRightBottomButton() {
        gridImagesView.setLayout(.centerTopLeftBottomRightBottom)
        selectionGridImages.selectGridImagesCenterTopLeftBottomRightBottom()
    }
    
    @IBAction func didTapSelectionGridImagesLeftTopRightTopCenterBottomButton() {
        gridImagesView.setLayout(.leftTopRightTopCenterBottom)
        selectionGridImages.selectGridImagesLeftTopRightTopCenterBottom()
    }
    
    @IBAction func didTapSelectionGridImagesLeftRightTopAndLeftRightBottomButton() {
        gridImagesView.setLayout(.leftRightTopAndleftRightBottom)
        selectionGridImages.selectGridImagesLeftRightTopAndLeftRightBottom()
    }
    
    @IBAction func didTapAddPhotoCenterTopButton() {
      
        
    }
    
    
    @IBAction func didTapAddPhotoRightTopButton() {
        
        
    }
    
    @IBAction func didTapAddPhotoLeftTopButton() {
        
        
    }
    
    @IBAction func didTapAddPhotoCenterBottomButton() {
        
        
    }
    
    @IBAction func didTapAddPhotoLeftBottomButton() {
        
        
    }
    
    @IBAction func didTapAddPhotoRightBottomButton() {
        
        
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

