//
//  ViewController.swift
//  Instagrid
//
//  Created by Jean-François Santolaria on 26/06/2018.
//  Copyright © 2018 OpenClassroomsFRSantolariaJF. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var gridImagesView: GridImagesView!
    @IBOutlet weak var selectionGridImages: SelectionGridImages!
    
    @IBOutlet var anyAddPhotoCenterButtons: [UIButton]!
    @IBOutlet var anyAddPhotoRightButtons: [UIButton]!
    @IBOutlet var anyAddPhotoLeftButtons: [UIButton]!
    
    var selectButtons: [UIButton]?
    
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
    
    @IBAction func didTapAnyAddPhotoCenterButtons() {
        selectImagePicker()
        selectButtons = anyAddPhotoCenterButtons
    }
    
    
    @IBAction func didTapAnyAddPhotoRightButtons() {
        selectImagePicker()
        selectButtons = anyAddPhotoRightButtons
    }
    
    @IBAction func didTapAnyAddPhotoLeftButtons() {
        selectImagePicker()
        selectButtons = anyAddPhotoLeftButtons
    }
    
    func selectImagePicker() {
        let imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            selectButtons?[0].imageView?.contentMode = .scaleAspectFill
            selectButtons?[1].imageView?.contentMode = .scaleAspectFill
            selectButtons?[0].setImage(pickedImage, for: .normal)
            selectButtons?[1].setImage(pickedImage, for: .normal)
        }
        picker.dismiss(animated: true, completion: nil)
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

