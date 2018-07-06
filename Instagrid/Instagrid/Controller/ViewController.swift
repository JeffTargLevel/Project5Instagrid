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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapSelectViewCenterLeftRightButton() {
        customImagesView.setStyleLayout(.layoutCenterLeftRight)
        selectViewCenterLeftRightButton.setImage(#imageLiteral(resourceName: "Selected"), for: .normal)
    }
    
    @IBAction func didTapSelectViewLeftRightCenterButton() {
        customImagesView.setStyleLayout(.layoutLeftRightCenter)
        selectViewLeftRightCenterButton.setImage(#imageLiteral(resourceName: "Selected"), for: .normal)
    }
    
    @IBAction func didTapSelectViewTwoLeftRightButton() {
        customImagesView.setStyleLayout(.layoutTwoLeftRight)
        selectViewTwoLeftRightButton.setImage(#imageLiteral(resourceName: "Selected"), for: .normal)
    }
    
}

