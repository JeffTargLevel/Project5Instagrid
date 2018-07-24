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
    
    private var selectFirstImageButton: UIButton?
    private var selectSecondImageButton: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        recognizeTheGesture()
    }
    
    private func setupUI() {
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
        openImagePicker()
        selectFirstImageButton = anyAddPhotoCenterButtons[0]
        selectSecondImageButton = anyAddPhotoCenterButtons[1]
    }
    
    @IBAction func didTapAnyAddPhotoRightButtons() {
        openImagePicker()
        selectFirstImageButton = anyAddPhotoRightButtons[0]
        selectSecondImageButton = anyAddPhotoRightButtons[1]
    }
    
    @IBAction func didTapAnyAddPhotoLeftButtons() {
        openImagePicker()
        selectFirstImageButton = anyAddPhotoLeftButtons[0]
        selectSecondImageButton = anyAddPhotoLeftButtons[1]
    }
    
    @IBAction func didTapAddPhotoLeftBottomForWindowGridButton() {
        openImagePicker()
        selectFirstImageButton = addPhotoLeftBottomForWindowGridButton[0]
        selectSecondImageButton = anyAddPhotoLeftButtons[1]
    }
    
    @IBAction func didTapAddPhotoRightBottomForWindowGridButton() {
        openImagePicker()
        selectFirstImageButton = addPhotoRightBottomForWindowGridButton[0]
        selectSecondImageButton = anyAddPhotoRightButtons[1]
    }
    
    private func openImagePicker() {
        let imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            selectFirstImageButton?.setImage(pickedImage, for: .normal)
            selectSecondImageButton?.setImage(pickedImage, for: .normal)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    private func recognizeTheGesture() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragGridImagesView(_:)))
        gridImagesView.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc private func dragGridImagesView(_ sender: UIPanGestureRecognizer) {
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
        var translationTransform = CGAffineTransform(translationX: 0, y: translation.y)
        var transform = translationTransform
        gridImagesView.transform = transform
        
        if UIDeviceOrientationIsPortrait(UIDevice.current.orientation) {
            if translation.y < -70 && gridImagesView.isComplete {
                shareGridImagesView()
            } else if translation.y > 0 || gridImagesView.isComplete == false {
                shakeForBadSwipe()
            }
        }
        
        if UIDeviceOrientationIsLandscape(UIDevice.current.orientation) {
            translationTransform = CGAffineTransform(translationX: translation.x, y: 0)
            transform = translationTransform
            gridImagesView.transform = transform
            
            if translation.x < -180 && gridImagesView.isComplete {
                shareGridImagesView()
            } else if translation.x > 0 || gridImagesView.isComplete == false {
                shakeForBadSwipe()
            }
        }
    }
    
    private func shareGridImagesView() {
        let gridImages = UIImage(view: gridImagesView)
        let shareGridImages = UIActivityViewController(activityItems: [gridImages], applicationActivities: nil)
        present(shareGridImages, animated: true, completion: nil)
    }
    
    private func shakeForBadSwipe() {
        gridImagesView.shake()
        gridImagesView.transform = .identity
    }
}



