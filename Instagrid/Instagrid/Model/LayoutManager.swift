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
    var type: LayoutType
    var layoutOneAndTwoImages: [UIImage]
    var layout3Images: [UIImage]
    
    var layoutOneAndTwoAreReadyForShare: Bool {
        return layoutOneAndTwoImages.count >= type.imageNeeded
    }
    
    var layout3IsReadyForShare: Bool {
        return layout3Images.count >= type.imageNeeded
    }
}

extension LayoutManager {
    enum LayoutType {
        case onePerTwo
        case twoPerOne
        case twoPerTwo
        
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

extension LayoutManager {
    
    func currentImageOfButtonIs(_ imageButton: UIButton?) -> Bool {
        return imageButton?.currentImage == #imageLiteral(resourceName: "AddPhotoPortrait")
    }
    
    mutating func toImage(_ image: UIImage) {
        
        if type == .onePerTwo || type == .twoPerOne {
            layoutOneAndTwoImages.append(image)
            print("Add \(image)")
        } else if type == .twoPerTwo {
            layout3Images.append(image)
            print("add other \(image)")
        }
    }
}









