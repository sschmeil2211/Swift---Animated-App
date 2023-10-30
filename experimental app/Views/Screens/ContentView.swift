//
//  HomeScreen.swift
//  experimental app
//
//  Created by Sebastian Schmeil on 01/11/2023.
//

import SwiftUI
import RiveRuntime

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .chat
    @State var isOpen = false
    @State var show = false
    
    let button = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)
    
    var body: some View {
        ZStack{
            ZStack{
                Color(.black).ignoresSafeArea()
                SideMenu()
                    .opacity(isOpen ? 1 : 0)
                    .offset(x: isOpen ? 0 : -300)
                    .rotation3DEffect(
                        .degrees(isOpen ? 0 : 30),
                        axis: (x: 0, y: 1, z: 0)
                    )
                Group{
                    switch selectedTab {
                    case .chat:
                        HomeScreen()
                    case .search:
                        Text("Search")
                    case .timer:
                        Text("Timer")
                    case .bell:
                        Text("Notifications")
                    case .user:
                        Text("Profile")
                    }
                }
                .safeAreaInset(edge: .bottom) {
                    Color.clear.frame(height: 80)
                }
                .safeAreaInset(edge: .top) {
                    Color.clear.frame(height: 110)
                }
                .mask(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                )
                .offset(x: isOpen ? 280 : 0)
                .scaleEffect(isOpen ? 0.9 : 1)
                .scaleEffect(show ? 0.9 : 1)
                .rotation3DEffect(
                    .degrees(isOpen ? 30 : 0),
                    axis: (x: 0, y: -1, z: 0)
                )
                .ignoresSafeArea()
            }
            
            Image(systemName: "person")
                .frame(width: 35, height: 35)
                .background(.white)
                .mask(Circle())
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                .onTapGesture {
                    withAnimation(.spring){
                        show = true
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding()
                .offset(x: isOpen ? 100 : 0, y: 4)
            
            button.view()
                .frame(width: 45, height: 45)
                .mask(Circle())
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding()
                .offset(x: isOpen ? 200 : 0)
                .onTapGesture {
                    button.setInput("isOpen", value: isOpen)
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        isOpen.toggle()
                    }
                }
            
            TabBar()
                .offset(y: isOpen ? 300 : 0)
                .offset(y: show ? 200 : 0)
                .offset(y: -25)
                .background(
                    LinearGradient(
                        colors: [Color.white.opacity(0), Color.white],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: isOpen ? 0 : 150)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .allowsHitTesting(false)
                )
                .ignoresSafeArea()
            
            if show {
                OnBoardingScreen(show: $show)
                    .background(.white)
                    .mask(
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                    )
                    .shadow(color: .black.opacity(0.5), radius: 40, x: 0, y: 40)
                    .ignoresSafeArea(.all, edges: .top)
                    .transition(.move(edge: .top))
                    .offset(y: show ? -10 : 0)
                    .zIndex(1)
            }
        }
    }
}

#Preview {
    ContentView()
}
