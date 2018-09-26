//
//  ViewController.swift
//  Instagrid
//
//  Created by Jean-François Santolaria on 26/06/2018.
//  Copyright © 2018 OpenClassroomsFRSantolariaJF. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var layoutImagesView: LayoutImagesView!
    @IBOutlet private var selectionLayout: SelectionLayout!
    
    @IBOutlet private var swipeUpToShareLabel: UILabel!
    @IBOutlet private var swipeLeftToShareLabel: UILabel!
    
    @IBOutlet private var anyAddPhotoCenterButtons: [UIButton]!
    @IBOutlet private var anyAddPhotoRightButtons: [UIButton]!
    @IBOutlet private var anyAddPhotoLeftButtons: [UIButton]!
    @IBOutlet private var addPhotoLeftBottomForLayout2X2Button: [UIButton]!
    @IBOutlet private var addPhotoRightBottomForLayout2X2Button: [UIButton]!
    
    private var selectFirstImageButton: UIButton?
    private var selectSecondImageButton: UIButton?
    private var selectThirdImageButton: UIButton?
    
    private var layoutManager = LayoutManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setStatusSwipeLabel()
        recognizeTheGesture()
    }
    
    private func setupUI() {
        layoutImagesView.setLayoutStandard = .leftTopRightTopCenterBottom
        selectionLayout.showTheSelectedButtonAtStartup()
        layoutManager.type = .twoPerOne
    }
    
    private func setStatusSwipeLabel() {
        if layoutManager.isReadyForShare {
            swipeUpToShareLabel.text = "⇧\nSwipe up to share"
            swipeLeftToShareLabel.text = "⇦\nSwipe left to share"
        } else {
            swipeUpToShareLabel.text = "Add your photos"
            swipeLeftToShareLabel.text = "Add your photos"
        }
    }
}

//MARK: - Select layout

extension ViewController {
    
    @IBAction func didTapSelectLayout1X2Button() {
        layoutImagesView.setLayout(.centerTopLeftBottomRightBottom)
        selectionLayout.selectLayout1X2()
        layoutManager.type = .onePerTwo
        setStatusSwipeLabel()
    }
    
    @IBAction func didTapSelectLayout2X1Button() {
        layoutImagesView.setLayout(.leftTopRightTopCenterBottom)
        selectionLayout.selectLayout2X1()
        layoutManager.type = .twoPerOne
        setStatusSwipeLabel()
    }
    
    @IBAction func didTapSelectLayout2X2Button() {
        layoutImagesView.setLayout(.leftRightTopAndleftRightBottom)
        selectionLayout.selectLayout2X2()
        layoutManager.type = .twoPerTwo
        setStatusSwipeLabel()
    }
}

//MARK: - Add photo with button

extension ViewController {
    
    @IBAction func didTapAnyAddPhotoCenterButtons() {
        openImagePicker()
        selectFirstImageButton = anyAddPhotoCenterButtons[0]
        selectSecondImageButton = anyAddPhotoCenterButtons[1]
        selectThirdImageButton = addPhotoLeftBottomForLayout2X2Button[0]
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
        selectSecondImageButton = anyAddPhotoCenterButtons[0]
        selectThirdImageButton = anyAddPhotoCenterButtons[1]
    }
    
    @IBAction func didTapAddPhotoRightBottomForLayout2X2Button() {
        openImagePicker()
        selectFirstImageButton = addPhotoRightBottomForLayout2X2Button[0]
        selectSecondImageButton = anyAddPhotoCenterButtons[0]
        selectThirdImageButton = anyAddPhotoCenterButtons[1]
    }
}

//MARK: - Open photo library and pick photo

extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    private func openImagePicker() {
        let imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if layoutManager.currentImageOfButtonIs(selectFirstImageButton) {
            let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            selectFirstImageButton?.setImage(pickedImage, for: .normal)
            selectSecondImageButton?.setImage(pickedImage, for: .normal)
            selectThirdImageButton?.setImage(pickedImage, for: .normal)
            layoutManager.listImages.append(pickedImage!)
        } else if !layoutManager.currentImageOfButtonIs(selectFirstImageButton) {
            let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            selectFirstImageButton?.setImage(pickedImage, for: .normal)
            selectSecondImageButton?.setImage(pickedImage, for: .normal)
            selectThirdImageButton?.setImage(pickedImage, for: .normal)
        }
        picker.dismiss(animated: true, completion: nil)
        setStatusSwipeLabel()
    }
}

//MARK: - Transform layout images view with gesture

extension ViewController {
    
    private func transformLayoutImagesView(_ withGesture: UIPanGestureRecognizer) {
        let translation = withGesture.translation(in: layoutImagesView)
        
        if UIDevice.current.orientation.isPortrait {
            let translationTransform = CGAffineTransform(translationX: 0, y: translation.y)
            let transform = translationTransform
            layoutImagesView.transform = transform
            
            if translation.y < -70 && layoutManager.isReadyForShare {
                animateLayoutViewForSwipeUpToShare()
                shareLayoutImagesView()
            } else if translation.y > 0 || !layoutManager.isReadyForShare {
                shakeForBadSwipe()
            }
        }
        
        if UIDevice.current.orientation.isLandscape {
            let translationTransform = CGAffineTransform(translationX: translation.x, y: 0)
            let transform = translationTransform
            layoutImagesView.transform = transform
            
            if translation.x < -180 && layoutManager.isReadyForShare  {
                animateLayoutViewForSwipeLeftToShare()
                shareLayoutImagesView()
            } else if translation.x > 0 || !layoutManager.isReadyForShare {
                shakeForBadSwipe()
            }
        }
    }
    
    private func recognizeTheGesture() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragLayoutImagesView(_:)))
        layoutImagesView.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc private func dragLayoutImagesView(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began, .changed:
            transformLayoutImagesView(sender)
        case .ended, .cancelled:
            layoutImagesView.transform = .identity
        default:
            break
        }
    }
}

//MARK: - Animation of the layout images view for the share

extension ViewController {
    
    private func animateLayoutViewForSwipeUpToShare() {
        let screenHeight = UIScreen.main.bounds.height
        var translationTransform: CGAffineTransform
        translationTransform = CGAffineTransform(translationX: 0, y: screenHeight.distance(to: -300))
        
        UIView.animate(withDuration: 1, animations: {
            self.layoutImagesView.transform = translationTransform
        })
    }
    
    private func animateLayoutViewForSwipeLeftToShare() {
        let screenWidth = UIScreen.main.bounds.width
        var translationTransform: CGAffineTransform
        translationTransform = CGAffineTransform(translationX: screenWidth.distance(to: 100), y: 0)
        
        UIView.animate(withDuration: 1, animations: {
            self.layoutImagesView.transform = translationTransform
        })
    }
    
//MARK: - Shake the layout images view for a bad swipe
    
    private func shakeForBadSwipe() {
        layoutImagesView.shake()
        layoutImagesView.transform = .identity
    }
    
//MARK: - Share layout images
    
    private func shareLayoutImagesView() {
        let layoutImages = UIImage(view: layoutImagesView)
        let shareLayoutImages = UIActivityViewController(activityItems: [layoutImages], applicationActivities: nil)
        present(shareLayoutImages, animated: true, completion: nil)
    }
}















