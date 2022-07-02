//
//  HomeButtonView.swift
//  iOSAppTemplate
//
//  Created by MAC42 on 11/06/22.
//

import SwiftUI

struct HomeButtonView: View {
    
//    declaramos una variable
    var imageName = ""
    
    var body: some View {
        VStack {
//            La idea es crear un componente que reciba el nombre una imagen y en base a eso pueda crear un boton
            Button {
                print("Like")
            } label: {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .frame(maxWidth: 80, maxHeight: 80)
    }
}

struct HomeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HomeButtonView(imageName: "dislike-button")
    }
}
