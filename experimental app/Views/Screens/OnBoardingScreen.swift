//
//  OnBoarding.swift
//  experimental app
//
//  Created by Sebastian Schmeil on 30/10/2023.
//

import SwiftUI
import RiveRuntime

struct OnBoardingScreen: View {
    @State var showModal = false
    @Binding var show: Bool
    let shape = RiveViewModel(fileName: "shapes")
    let button = RiveViewModel(fileName: "button")
    
    var body: some View {
        ZStack{
            background
            content
                .offset(y: showModal ? -100 : 0)
            Color("Shadow")
                .opacity(showModal ? 0.4 : 0)
                .ignoresSafeArea()
            if showModal{
                SignInModal(showModal: $showModal)
                    .transition(
                        .move(edge: .top)
                    )
                    .overlay(
                        Button{
                            withAnimation(.spring()){
                                showModal = false
                            }
                        } label: {
                            Image(systemName: "xmark")
                                .frame(width: 35, height: 35)
                                .foregroundColor(.black)
                                .background(.white)
                                .mask(Circle())
                                .shadow(
                                    color: Color("Shadow").opacity(0.3),
                                    radius: 5,
                                    x: 0,
                                    y: 3
                                )
                        }
                            .frame(maxHeight: .infinity, alignment: .top)
                    )
            }
            Button {
                withAnimation{
                    show = false
                }
            } label: {
                Image(systemName: "xmark")
                    .frame(width: 35, height: 35)
                    .background(.black)
                    .foregroundColor(.white)
                    .mask(Circle())
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
            .offset(y: showModal ? 280 : 0)
        }
    }
    
    var content: some View{
        VStack {
            Text("Movie Time")
                .font(.system(size: 40, weight: .bold))
                .padding(.top, 10)
            
            Spacer()
            
            button.view()
                .frame(width: 240, height: 60)
                .overlay(
                    Label("Start", systemImage: "arrow.forward")
                        .offset(x: 4, y: 4)
                        .font(.headline)
                )
                .background(
                    Color.black
                        .cornerRadius(30)
                        .blur(radius: 10)
                        .opacity(0.3)
                        .offset(y: 10)
                )
                .onTapGesture {
                    button.play(animationName: "active")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8){
                        withAnimation(.spring()){
                            showModal = true
                        }
                    }
                }
            
            Spacer()
        }
    }
    
    var background: some View{
        shape.view()
            .ignoresSafeArea()
            .blur(radius: 20)
            .background(
                Image("Spline")
                    .blur(radius: 50)
                    .offset(x: 200, y: 100)
            )
    }
}

#Preview {
    OnBoardingScreen(show: .constant(true))
}
