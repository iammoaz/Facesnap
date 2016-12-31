//
//  FilteredImageBuilder.swift
//  Facesnap
//
//  Created by Muhammad Moaz on 12/31/16.
//  Copyright © 2016 Muhammad Moaz. All rights reserved.
//

import Foundation
import CoreImage

struct PhotoFilter {
    static let colorClamp = "UIColorClamp"
    static let colorControls = "UIColorControls"
    static let photoEffectInstant = "CIPhotoEffectInstant"
    static let photoEffectProcess = "CIPhotoEffectProcess"
    static let photoEffectNoir = "CIPhotoEffectNoir"
    static let photoEffectSepia = "CIPhotoEffectSepia"
    
    static func defaultFilters() -> [CIFilter] {
        // Color Clamp
        let colorClamp = CIFilter(name: self.colorClamp)!
        colorClamp.setValue(CIVector(x: 0.2, y: 0.2, z: 0.2, w: 0.2), forKey: "inputMinComponents")
        colorClamp.setValue(CIVector(x: 0.9, y: 0.9, z: 0.9, w: 0.9), forKey: "inputMaxComponents")
        
        // Color Controls
        let colorControls = CIFilter(name: self.colorControls)!
        colorControls.setValue(0.2, forKey: kCIInputSaturationKey)
        
        // Photo Effects
        let photoEffectInstant = CIFilter(name: self.photoEffectInstant)!
        let photoEffectProcess = CIFilter(name: self.photoEffectProcess)!
        let photoEffectNoir = CIFilter(name: self.photoEffectNoir)!
        let photoEffectSepia = CIFilter(name: self.photoEffectSepia)!
        photoEffectSepia.setValue(0.7, forKey: kCIInputIntensityKey)
        
        return [colorClamp, colorControls, photoEffectInstant, photoEffectProcess, photoEffectNoir, photoEffectSepia]
    }
    
    
}
