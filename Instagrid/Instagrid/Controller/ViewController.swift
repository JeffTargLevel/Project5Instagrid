//
//  ViewController.swift
//  Instagrid
//
//  Created by Jean-François Santolaria on 26/06/2018.
//  Copyright © 2018 OpenClassroomsFRSantolariaJF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customImagesView: CustomImagesView!
    @IBOutlet weak var selectViewCenterLeftRightButton: UIButton!
    @IBOutlet weak var selectViewLeftRightCenterButton: UIButton!
    @IBOutlet weak var selectViewTwoLeftRightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        startAppli()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func startAppli() {
        customImagesView.styleLayoutStandard()
        selectViewLeftRightCenterButton.setImage(#imageLiteral(resourceName: "Selected"), for: .normal)
    }
    
    @IBAction func didTapSelectViewCenterLeftRightButton() {
        customImagesView.setStyleLayout(.layoutCenterLeftRight)
        selectViewCenterLeftRightButton.setImage(#imageLiteral(resourceName: "Selected"), for: .normal)
        selectViewLeftRightCenterButton.setImage(#imageLiteral(resourceName: "Layout2"), for: .normal)
        selectViewTwoLeftRightButton.setImage(#imageLiteral(resourceName: "Layout3"), for: .normal)
        
    }
    
    @IBAction func didTapSelectViewLeftRightCenterButton() {
        customImagesView.setStyleLayout(.layoutLeftRightCenter)
        selectViewLeftRightCenterButton.setImage(#imageLiteral(resourceName: "Selected"), for: .normal)
        selectViewTwoLeftRightButton.setImage(#imageLiteral(resourceName: "Layout3"), for: .normal)
        selectViewCenterLeftRightButton.setImage(#imageLiteral(resourceName: "Layout1"), for: .normal)
    }
    
    @IBAction func didTapSelectViewTwoLeftRightButton() {
        customImagesView.setStyleLayout(.layoutTwoLeftRight)
        selectViewTwoLeftRightButton.setImage(#imageLiteral(resourceName: "Selected"), for: .normal)
        selectViewCenterLeftRightButton.setImage(#imageLiteral(resourceName: "Layout1"), for: .normal)
        selectViewLeftRightCenterButton.setImage(#imageLiteral(resourceName: "Layout2"), for: .normal)
        
    }
    
    @objc func rotated() {
        if UIDeviceOrientationIsLandscape(UIDevice.current.orientation) {
            customImagesView.setColorAddPhotoButtonInModeLandscape()
        }
        
        if UIDeviceOrientationIsPortrait(UIDevice.current.orientation) {
            customImagesView.setColorAddPhotoButtonInModePortrait()
        }
    }
}

