//
//  Pselection.swift
//  Idolit
//
//  Created by Mohamed Osman on 20.09.20.
//  Copyright © 2020 MO&FAR. All rights reserved.
//

import SwiftUI


enum Pselection: Int, CaseIterable, Identifiable {
    
    // In order
    case All
    case Top
    case Info
    
    var id: UUID {
        return UUID()
    }
    
    var image: Image {
        switch self {

        case .All:
            return Image(systemName: "play.rectangle")
        case .Top:
            return Image(systemName: "speedometer")
        case .Info:
        return Image(systemName: "info.circle")
        }
    }
}
