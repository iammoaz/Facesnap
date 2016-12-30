//
//  ViewController.swift
//  Facesnap
//
//  Created by Muhammad Moaz on 12/30/16.
//  Copyright © 2016 Muhammad Moaz. All rights reserved.
//

import UIKit

class PhotoListVC: UIViewController {
    
    // MARK: - UI Elements
    lazy var cameraButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Camera", for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 254/255, green: 123/255, blue: 135/255, alpha: 1.0)
        button.addTarget(self, action: #selector(self.presentImagePickerController), for: .touchUpInside)
        return button
    }()
    
    lazy var mediaPickerManager: MediaPickerManager = {
        let manager = MediaPickerManager(presetingViewController: self)
        manager.delegate = self
        return manager
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Layout
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(cameraButton)
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cameraButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            cameraButton.rightAnchor.constraint(equalTo: view.rightAnchor),
            cameraButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cameraButton.heightAnchor.constraint(equalToConstant: 56.0)
            ])
        
    }
    
    // MARK: - Image Picker
    func presentImagePickerController() {
        mediaPickerManager.presentImagePickerController(animated: true)
    }
}

// MARK: - Media Picker Manager Delegate

extension PhotoListVC: MediaPickerImageDelegate {
    func mediaPickerManager(manager: MediaPickerManager, didFinishPickingImage image: UIImage) {
    }
}

