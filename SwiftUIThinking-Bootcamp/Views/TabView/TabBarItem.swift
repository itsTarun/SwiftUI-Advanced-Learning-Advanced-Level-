//
//  TabBarItem.swift
//  SwiftUIThinking-Bootcamp
//
//  Created by Tarun on 25/04/23.
//

import Foundation
import SwiftUI

enum TabBarItem: Hashable {
    case home, favorites, profile
    
    var iconName: String {
        switch self {
        case .home: return "house"
        case .favorites: return "heart"
        case .profile: return "person"
        }
    }
    var title: String {
        switch self {
        case .home: return "Home"
        case .favorites: return "Favorites"
        case .profile: return "Profile"
        }
    }
    var color: Color {
        switch self {
        case .home: return .red
        case .favorites: return .blue
        case .profile: return .green
        }
    }
}

//struct TabBarItem: Hashable {
//    let iconName: String
//    let title: String
//    let color: Color
//}
