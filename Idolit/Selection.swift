//
//  Selection.swift
//  Idolit
//
//  Created by Mohamed Osman on 13.08.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import Foundation
import SwiftUI

enum Selection: Int, CaseIterable,Identifiable {
    
    // In order
    case world
    case country
    case city
    
    var id: UUID {
        return UUID()
    }
    
    var image: Image {
        switch self {
        
        case .world:
            return Image(systemName: "globe")
        case .country:
            return Image(systemName: "flag")
        case .city:
            return Image(systemName: "mappin.and.ellipse")
        }
    }
}
