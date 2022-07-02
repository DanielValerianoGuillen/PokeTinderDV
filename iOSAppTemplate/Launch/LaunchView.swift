//
//  LaunchView.swift
//  iOSAppTemplate
//
//  Created by MAC42 on 11/06/22.
//

import SwiftUI

struct LaunchView: View {
    
    @EnvironmentObject var appState: AppState
    
    @StateObject var launchViewModel = LaunchViewModel()
    
    var body: some View {
        ZStack {
            Color.pink
                .ignoresSafeArea()
            
            Text("iOSTemplateApp")
                .font(.title)
                .fontWeight(.semibold)
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
