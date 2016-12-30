//
//  MediaPickerManager.swift
//  Facesnap
//
//  Created by Muhammad Moaz on 12/30/16.
//  Copyright © 2016 Muhammad Moaz. All rights reserved.
//

import UIKit
import MobileCoreServices

class MediaPickerManager: NSObject {
    private let imagePickerController = UIImagePickerController()
    private let presetingViewController: UIViewController
    
    init(presetingViewController: UIViewController) {
        self.presetingViewController = presetingViewController
        super.init()
//        imagePickerController.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePickerController.sourceType = .camera
            imagePickerController.cameraDevice = .front
        } else {
            imagePickerController.sourceType = .photoLibrary
        }
        
        imagePickerController.mediaTypes = [kUTTypeImage as String]
    }
    
    func presentImagePickerController(animated: Bool) {
        presetingViewController.present(imagePickerController, animated: animated, completion: nil)
    }
    
    func dismissImagePickerController(animated: Bool, completion: @escaping () -> Void) {
        imagePickerController.dismiss(animated: animated, completion: completion)
    }
}
