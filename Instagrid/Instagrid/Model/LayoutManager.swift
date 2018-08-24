//
//  LayoutManager.swift
//  Instagrid
//
//  Created by Jean-François Santolaria on 01/08/2018.
//  Copyright © 2018 OpenClassroomsFRSantolariaJF. All rights reserved.
//

import Foundation
import UIKit

struct LayoutManager {
    
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
    
//MARK: - Current image of button before to add the image in listImages
    
    func currentImageOfButtonIs(_ imageButton: UIButton?) -> Bool {
        return imageButton?.currentImage == #imageLiteral(resourceName: "AddPhotoPortrait")
    }
}


















