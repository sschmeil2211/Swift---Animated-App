//
//  CustomTextField.swift
//  experimental app
//
//  Created by Sebastian Schmeil on 31/10/2023.
//

import SwiftUI

struct CustomTextField: ViewModifier{
    var imageName: String
    
    func body(content: Content) -> some View {
        content
            .padding(15)
            .padding(.leading, 35)
            .background(Color.white)
            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke()
                    .fill(.black.opacity(0.1))
            )
            .overlay(
                Image(imageName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 5)
            )
    }
}

extension View{
    func customTextField(imageName: String) -> some View {
        modifier(CustomTextField(imageName: imageName))
    }
}
