//
//  FilteredImageCell.swift
//  Facesnap
//
//  Created by Muhammad Moaz on 12/31/16.
//  Copyright © 2016 Muhammad Moaz. All rights reserved.
//

import UIKit
import GLKit

class FilteredImageCell: UICollectionViewCell {
    static let resuseIdentifier = String(describing: FilteredImageCell.self)
    
    var eaglContext: EAGLContext!
    var ciContext: CIContext!
    
    lazy var glkView: GLKView = {
        let view = GLKView(frame: self.contentView.frame, context: self.eaglContext)
        view.delegate = self
        return view
    }()
    
    var image: CIImage!
    
    override func layoutSubviews() {
        contentView.addSubview(glkView)
        glkView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            glkView.topAnchor.constraint(equalTo: contentView.topAnchor),
            glkView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            glkView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            glkView.leftAnchor.constraint(equalTo: contentView.leftAnchor)
            ])
    }
}

extension FilteredImageCell: GLKViewDelegate {
    func glkView(_ view: GLKView, drawIn rect: CGRect) {
        ciContext.draw(image, in: rect, from: image.extent)
    }
}
