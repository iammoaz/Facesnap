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
    
    static func defaultFilters() -> [CIFilter] {
        let colorClamp = CIFilter(name: self.colorClamp)!
        colorClamp.setValue(CIVector(x: 0.2, y: 0.2, z: 0.2, w: 0.2), forKey: "inputMinComponents")
        colorClamp.setValue(CIVector(x: 0.9, y: 0.9, z: 0.9, w: 0.9), forKey: "inputMaxComponents")
        return [colorClamp]
    }
}
