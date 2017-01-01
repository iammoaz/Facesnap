//
//  PhotoMetadataVC.swift
//  Facesnap
//
//  Created by Muhammad Moaz on 1/1/17.
//  Copyright © 2017 Muhammad Moaz. All rights reserved.
//

import UIKit
import CoreLocation

class PhotoMetadataVC: UITableViewController {
    
    fileprivate let photo: UIImage
//    fileprivate var locationManager: LocationManager!
    fileprivate var location: CLLocation?
    
    init(photo: UIImage) {
        self.photo = photo
        super.init(style: .grouped)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Metadata Fields
    fileprivate lazy var photoImageView: UIImageView = {
        let imageView = UIImageView(image: self.photo)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    fileprivate lazy var imageViewHeight: CGFloat = {
        let imgFactor = self.photoImageView.frame.size.height / self.photoImageView.frame.size.width
        let screenWidth = UIScreen.main.bounds.size.width
        return screenWidth * imgFactor
    }()
    
    fileprivate lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Tap to add location"
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    fileprivate lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    fileprivate lazy var tagsTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "summer, vacation"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
