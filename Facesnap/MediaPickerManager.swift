//
//  MediaPickerManager.swift
//  Facesnap
//
//  Created by Muhammad Moaz on 12/30/16.
//  Copyright © 2016 Muhammad Moaz. All rights reserved.
//

import UIKit
import MobileCoreServices

protocol MediaPickerImageDelegate: class {
    func mediaPickerManager(manager: MediaPickerManager, didFinishPickingImage image: UIImage)
}

class MediaPickerManager: NSObject {
    private let imagePickerController = UIImagePickerController()
    private let presetingViewController: UIViewController
    
    weak var delegate: MediaPickerImageDelegate?
    
    init(presetingViewController: UIViewController) {
        self.presetingViewController = presetingViewController
        super.init()
        
        imagePickerController.delegate = self
        
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

extension MediaPickerManager: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            return
        }
        delegate?.mediaPickerManager(manager: self, didFinishPickingImage: image)
    }
}
