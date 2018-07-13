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
    @IBOutlet var addPhotoLeftBottomForWindowGridButton: [UIButton]!
    @IBOutlet var addPhotoRightBottomForWindowGridButton: [UIButton]!
    
    var selectFirstImage: UIButton?
    var selectSecondImage: UIButton?
    
    var photoManagement: PhotoManagement!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
        showAtStartup()
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragGridImagesView(_:)))
        gridImagesView.addGestureRecognizer(panGestureRecognizer)
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
        selectFirstImage = anyAddPhotoCenterButtons[0]
        selectSecondImage = anyAddPhotoCenterButtons[1]
    }
    
    @IBAction func didTapAnyAddPhotoRightButtons() {
        selectImagePicker()
        selectFirstImage = anyAddPhotoRightButtons[0]
        selectSecondImage = anyAddPhotoRightButtons[1]
    }
    
    @IBAction func didTapAnyAddPhotoLeftButtons() {
        selectImagePicker()
        selectFirstImage = anyAddPhotoLeftButtons[0]
        selectSecondImage = anyAddPhotoLeftButtons[1]
    }
    
    @IBAction func didTapAddPhotoLeftBottomForWindowGridButton() {
        selectImagePicker()
        selectFirstImage = addPhotoLeftBottomForWindowGridButton[0]
        selectSecondImage = anyAddPhotoLeftButtons[1]
    }
    
    @IBAction func didTapAddPhotoRightBottomForWindowGridButton() {
        selectImagePicker()
        selectFirstImage = addPhotoRightBottomForWindowGridButton[0]
        selectSecondImage = anyAddPhotoRightButtons[1]
    }
    
    func selectImagePicker() {
        let imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            selectFirstImage?.imageView?.contentMode = .scaleAspectFill
            selectSecondImage?.imageView?.contentMode = .scaleAspectFill
            selectFirstImage?.setImage(pickedImage, for: .normal)
            selectSecondImage?.setImage(pickedImage, for: .normal)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    @objc func dragGridImagesView(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began, .changed:
            transformGridImagesViewWith(gesture: sender)
        case .ended, .cancelled:
            gridImagesView.transform = .identity
        default:
            break
        }
    }
    
    private func transformGridImagesViewWith(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: gridImagesView)
        let translationTransform = CGAffineTransform(translationX: 0, y: translation.y)
        let transform = translationTransform
        gridImagesView.transform = transform
    
        if translation.y < -70 {
            shareGridImagesView()
        }
    }
    
    private func shareGridImagesView() {
        let gridImages = UIImage(view: gridImagesView)
        
        let shareScoreWriteWithText = UIActivityViewController(activityItems: [gridImages], applicationActivities: nil)
        present(shareScoreWriteWithText, animated: true, completion: nil)
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

