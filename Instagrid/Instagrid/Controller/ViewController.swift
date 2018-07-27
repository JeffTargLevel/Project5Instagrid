//
//  ViewController.swift
//  Instagrid
//
//  Created by Jean-François Santolaria on 26/06/2018.
//  Copyright © 2018 OpenClassroomsFRSantolariaJF. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var layoutImagesView: LayoutImagesView!
    @IBOutlet weak var selectionLayoutImages: SelectionLayoutImages!
    
    @IBOutlet weak var swipeUpToShareLabel: UILabel!
    @IBOutlet weak var swipeLeftToShareLabel: UILabel!
    
    @IBOutlet var anyAddPhotoCenterButtons: [UIButton]!
    @IBOutlet var anyAddPhotoRightButtons: [UIButton]!
    @IBOutlet var anyAddPhotoLeftButtons: [UIButton]!
    @IBOutlet var addPhotoLeftBottomForLayout2X2Button: [UIButton]!
    @IBOutlet var addPhotoRightBottomForLayout2X2Button: [UIButton]!
    
    
    
    private var selectFirstImageButton: UIButton?
    private var selectSecondImageButton: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        recognizeTheGesture()
    }
    
    private func setupUI() {
        layoutImagesView.setLayoutStandard = .leftTopRightTopCenterBottom
        selectionLayoutImages.showTheSelectedButtonAtStartup()
    }
    
    /*private func setStatusSwipeLabel() {
        if !layoutImagesView.isComplete {
            swipeUpToShareLabel.text = "Add your photos"
        }
    }*/
    
//MARK: - Select layout
    
    @IBAction func didTapSelectLayout1X2Button() {
        layoutImagesView.setLayout(.centerTopLeftBottomRightBottom)
        selectionLayoutImages.selectGridImagesCenterTopLeftBottomRightBottom()
    }
    
    @IBAction func didTapSelectLayout2X1Button() {
        layoutImagesView.setLayout(.leftTopRightTopCenterBottom)
        selectionLayoutImages.selectGridImagesLeftTopRightTopCenterBottom()
    }
    
    @IBAction func didTapSelectLayout2X2Button() {
        layoutImagesView.setLayout(.leftRightTopAndleftRightBottom)
        selectionLayoutImages.selectGridImagesLeftRightTopAndLeftRightBottom()
    }
    
//MARK: - Add photo with button
    
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
    
    @IBAction func didTapAddPhotoLeftBottomForLayout2X2Button() {
        openImagePicker()
        selectFirstImageButton = addPhotoLeftBottomForLayout2X2Button[0]
        selectSecondImageButton = anyAddPhotoLeftButtons[1]
    }
    
    @IBAction func didTapAddPhotoRightBottomForLayout2X2Button() {
        openImagePicker()
        selectFirstImageButton = addPhotoRightBottomForLayout2X2Button[0]
        selectSecondImageButton = anyAddPhotoRightButtons[1]
    }
   
//MARK: - Open photo library and pick photo
    
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
    
//MARK: - Transform layout images view with gesture
    
    private func recognizeTheGesture() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragGridImagesView(_:)))
        layoutImagesView.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc private func dragGridImagesView(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began, .changed:
            transformLayoutImagesViewWith(gesture: sender)
       case .ended, .cancelled:
            layoutImagesView.transform = .identity
        default:
            break
        }
    }
    
    func transformLayoutImagesViewWith(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: layoutImagesView)
        
        if UIDeviceOrientationIsPortrait(UIDevice.current.orientation) {
            let translationTransform = CGAffineTransform(translationX: 0, y: translation.y)
            let transform = translationTransform
            layoutImagesView.transform = transform
            
            if translation.y < -70 && layoutImagesView.isReadyForTheShare {
                animateLayoutViewForTheShare()
                shareLayoutImagesView()
            } else if translation.y > 0 || !layoutImagesView.isReadyForTheShare {
                shakeForBadSwipe()
            }
        }
        
        if UIDeviceOrientationIsLandscape(UIDevice.current.orientation) {
            let translationTransform = CGAffineTransform(translationX: translation.x, y: 0)
            let transform = translationTransform
            layoutImagesView.transform = transform
            
            if translation.x < -180 && layoutImagesView.isReadyForTheShare {
                shareLayoutImagesView()
            } else if translation.x > 0 || !layoutImagesView.isReadyForTheShare {
                shakeForBadSwipe()
            }
        }
    }
    
//MARK: - Animation of the layout images view for the share
    
    func animateLayoutViewForTheShare() {
        let screenHeight = UIScreen.main.bounds.height
        var translationTransform: CGAffineTransform
        translationTransform = CGAffineTransform(translationX: 0, y: screenHeight.distance(to: -300))
        
        UIView.animate(withDuration: 1, animations: {
            self.layoutImagesView.transform = translationTransform
        })
    }
    
//MARK: - Share layout images view with app
    
    private func shareLayoutImagesView() {
        let layoutImages = UIImage(view: layoutImagesView)
        let shareLayoutImages = UIActivityViewController(activityItems: [layoutImages], applicationActivities: nil)
        present(shareLayoutImages, animated: true, completion: nil)
    }
    
//MARK: - Shake the layout images view for a bad swipe
    
    private func shakeForBadSwipe() {
        layoutImagesView.shake()
        layoutImagesView.transform = .identity
    }
}



