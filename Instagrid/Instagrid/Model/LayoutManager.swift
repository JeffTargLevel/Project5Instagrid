//
//  LayoutManager.swift
//  Instagrid
//
//  Created by Jean-François Santolaria on 01/08/2018.
//  Copyright © 2018 OpenClassroomsFRSantolariaJF. All rights reserved.
//

import Foundation
import UIKit

class LayoutManager {
    
    var type: LayoutType!
    var listImages = [UIImage]()
    
    var isReadyForShare: Bool {
        return listImages.count >= type.imageNeeded
    }
}

//MARK: - Layout type and images needed before sharing

extension LayoutManager {
    
    enum LayoutType {
        case onePerTwo, twoPerOne, twoPerTwo
        
        var imageNeeded: Int {
            switch self {
            case .twoPerTwo:
                return 4
            default:
                return 3
            }
        }
    }
}

//MARK: - Current image of button before to add the image in listImages

extension LayoutManager {
    
    func currentImageOfButtonIs(_ imageButton: UIButton?) -> Bool {
        return imageButton?.currentImage == #imageLiteral(resourceName: "AddPhotoPortrait")
    }
    
    func toImage(_ image: UIImage) {
        listImages.append(image)
    }
}

//MARK: - Transform layout images view with gesture

extension LayoutManager {
    
    func transform(_ layoutImagesView: UIView, withGesture: UIPanGestureRecognizer) {
        let translation = withGesture.translation(in: layoutImagesView)
        
        if UIDeviceOrientationIsPortrait(UIDevice.current.orientation) {
            let translationTransform = CGAffineTransform(translationX: 0, y: translation.y)
            let transform = translationTransform
            layoutImagesView.transform = transform
            
            if translation.y < -70 && isReadyForShare {
                animateLayoutViewForSwipeUpToShare(layoutImagesView)
                shareLayoutImagesView(layoutImagesView)
            } else if translation.y > 0 || !isReadyForShare {
                shakeForBadSwipe(layoutImagesView)
            }
        }
        
        if UIDeviceOrientationIsLandscape(UIDevice.current.orientation) {
            let translationTransform = CGAffineTransform(translationX: translation.x, y: 0)
            let transform = translationTransform
            layoutImagesView.transform = transform
            
            if translation.x < -180 && isReadyForShare  {
                animateLayoutViewForSwipeLeftToShare(layoutImagesView)
                shareLayoutImagesView(layoutImagesView)
            } else if translation.x > 0 || !isReadyForShare {
                shakeForBadSwipe(layoutImagesView)
            }
        }
    }
}

//MARK: - Animation of the layout images view for the share

extension LayoutManager {
    
    private func animateLayoutViewForSwipeUpToShare(_ view: UIView) {
        let screenHeight = UIScreen.main.bounds.height
        var translationTransform: CGAffineTransform
        translationTransform = CGAffineTransform(translationX: 0, y: screenHeight.distance(to: -300))
        
        UIView.animate(withDuration: 1, animations: {
            view.transform = translationTransform
        })
    }
    
    private func animateLayoutViewForSwipeLeftToShare(_ view: UIView) {
        let screenWidth = UIScreen.main.bounds.width
        var translationTransform: CGAffineTransform
        translationTransform = CGAffineTransform(translationX: screenWidth.distance(to: 100), y: 0)
        
        UIView.animate(withDuration: 1, animations: {
            view.transform = translationTransform
        })
    }
    
//MARK: - Shake the layout images view for a bad swipe
    
    private func shakeForBadSwipe(_ view: UIView) {
        view.shake()
        view.transform = .identity
    }
    
//MARK: - Share layout images
    
    private func shareLayoutImagesView(_ view: UIView) {
        let viewController: UIViewController = ViewController()
        let layoutImages = UIImage(view: view)
        let shareLayoutImages = UIActivityViewController(activityItems: [layoutImages], applicationActivities: nil)
        viewController.present(shareLayoutImages, animated: true, completion: nil)
    }
}











