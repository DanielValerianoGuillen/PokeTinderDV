//
//  AppState.swift
//  iOSAppTemplate
//
//  Created by Linder Anderson Hassinger Solano    on 5/06/22.
//

import SwiftUI

class AppState: ObservableObject {
    
    static let shared = AppState()
    
    enum AppScreens: String {
        case launch
        case main
        case signIn
    }
    
    @Published var currentScreen: AppScreens = .launch
    
}
