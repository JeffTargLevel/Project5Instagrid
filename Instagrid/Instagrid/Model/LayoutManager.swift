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
    var images: [UIImage]
  
    var isReadyForShare: Bool {
        return images.count >= type.imageNeeded
        
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
    mutating func toImage() {
        let addImage = UIImage()
        
        if addImage != #imageLiteral(resourceName: "AddPhotoPortrait") {
        images.append(addImage)
        }
        
    }
}
    
    
    
    
    
    
    
    
    
    

