//
//  FilteredImageBuilder.swift
//  Facesnap
//
//  Created by Muhammad Moaz on 12/31/16.
//  Copyright © 2016 Muhammad Moaz. All rights reserved.
//

import UIKit
import CoreImage

final class FilteredImageBuilder {
    
    private struct PhotoFilter {
        static let colorClamp = "CIColorClamp"
        static let colorControls = "CIColorControls"
        static let photoEffectInstant = "CIPhotoEffectInstant"
        static let photoEffectProcess = "CIPhotoEffectProcess"
        static let photoEffectNoir = "CIPhotoEffectNoir"
        static let photoEffectSepia = "CISepiaTone"
        
        static func defaultFilters() -> [CIFilter] {
            // Color Clamp
            let colorClamp = CIFilter(name: PhotoFilter.colorClamp)!
            colorClamp.setValue(CIVector(x: 0.2, y: 0.2, z: 0.2, w: 0.2), forKey: "inputMinComponents")
            colorClamp.setValue(CIVector(x: 0.9, y: 0.9, z: 0.9, w: 0.9), forKey: "inputMaxComponents")
            
            // Color Controls
            let colorControls = CIFilter(name: PhotoFilter.colorControls)!
            colorControls.setValue(0.2, forKey: kCIInputSaturationKey)
            
            // Photo Effects
            let photoEffectInstant = CIFilter(name: PhotoFilter.photoEffectInstant)!
            let photoEffectProcess = CIFilter(name: PhotoFilter.photoEffectProcess)!
            let photoEffectNoir = CIFilter(name: PhotoFilter.photoEffectNoir)!
            let photoEffectSepia = CIFilter(name: PhotoFilter.photoEffectSepia)!
            photoEffectSepia.setValue(0.7, forKey: kCIInputIntensityKey)
            
            return [colorClamp, colorControls, photoEffectInstant, photoEffectProcess, photoEffectNoir, photoEffectSepia]
        }
    }
    
    fileprivate let image: UIImage
    
    init(image: UIImage) {
        self.image = image
    }
    
    func imageWithDefaultFilters() -> [UIImage] {
        return image(withFilters: PhotoFilter.defaultFilters())
    }
    
    func image(withFilters filters: [CIFilter]) -> [UIImage] {
        return filters.map { image(self.image, withFilter: $0) }
    }
    
    func image(_ image: UIImage, withFilter filter: CIFilter) -> UIImage {
        let inputImage = image.ciImage ?? CIImage(image: image)!
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        
        let outputImage = filter.outputImage!
        return UIImage(ciImage: outputImage)
    }
}
