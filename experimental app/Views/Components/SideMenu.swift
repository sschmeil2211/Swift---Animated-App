//
//  SideMenu.swift
//  experimental app
//
//  Created by Sebastian Schmeil on 01/11/2023.
//

import SwiftUI
import RiveRuntime

struct SideMenu: View {
    @State var selectedMenu: SelectedMenu = .home
    @State var isDarkMode = false
    let icon = RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME")
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "person")
                    .padding(15)
                    .background(.white.opacity(0.2))
                    .mask(Circle())
                VStack(alignment: .leading, spacing: 2){
                    Text("Sschmeil")
                    Text("Mobile Developer")
                        .opacity(0.7)
                }
                Spacer()
            }
            .padding()
            
            Text("Browse")
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.top, 40)
                .opacity(0.7)
            
            VStack {
                Rectangle()
                    .frame(height: 2)
                    .opacity(0.1)
                    .padding(.horizontal)
                ForEach(menuItems) { item in
                    MenuRow(item: item, selectedMenu: $selectedMenu)
                }
            }
            .padding(10)
            
            Text("History")
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.top, 40)
                .opacity(0.7)
            
            VStack {
                Rectangle()
                    .frame(height: 2)
                    .opacity(0.1)
                    .padding(.horizontal)
                ForEach(menuItems2) { item in
                    MenuRow(item: item, selectedMenu: $selectedMenu)
                }
            }
            .padding(10)
            
            Spacer()
            
            HStack(spacing: 15) {
                menuItems3[0].icon.view()
                    .frame(width: 30, height: 30)
                    .opacity(0.6)
                    .onChange(of: isDarkMode){newValue in
                        if newValue{
                            menuItems3[0].icon.setInput("active", value: true)
                        }
                        else{
                            menuItems3[0].icon.setInput("active", value: false)
                        }
                    }
                Text(menuItems3[0].text)
                    .font(.headline)
                Toggle("", isOn: $isDarkMode)
            }
            .padding(20)
        }
        .foregroundColor(.white)
        .frame(maxWidth: 280, maxHeight: .infinity)
        .background(.black)
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    SideMenu()
}

struct MenuItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: RiveViewModel
    var menu: SelectedMenu
}

var menuItems = [
    MenuItem(
        text: "Home",
        icon: RiveViewModel(
            fileName: "icons",
            stateMachineName: "HOME_interactivity",
            artboardName: "HOME"
        ),
        menu: .home
    ),
    MenuItem(
        text: "Search",
        icon: RiveViewModel(
            fileName: "icons", 
            stateMachineName: "SEARCH_Interactivity",
            artboardName: "SEARCH"
        ),
        menu: .search
    ),
    MenuItem(
        text: "Favorites",
        icon: RiveViewModel(
            fileName: "icons",
            stateMachineName: "STAR_Interactivity",
            artboardName: "LIKE/STAR"
        ),
        menu: .favorites
    ),
    MenuItem(
        text: "Help",
        icon: RiveViewModel(
            fileName: "icons", 
            stateMachineName: "CHAT_Interactivity",
            artboardName: "CHAT"
        ),
        menu: .help
    )
]

var menuItems2 = [
    MenuItem(
        text: "History",
        icon: RiveViewModel(
            fileName: "icons",
            stateMachineName: "TIMER_Interactivity",
            artboardName: "TIMER"
        ),
        menu: .history
    ),
    MenuItem(
        text: "Notifications",
        icon: RiveViewModel(
            fileName: "icons", 
            stateMachineName: "BELL_Interactivity",
            artboardName: "BELL"
        ),
        menu: .notifications
    ),
]

var menuItems3 = [
    MenuItem(
        text: "Dark Mode",
        icon: RiveViewModel(
            fileName: "icons",
            stateMachineName: "SETTINGS_Interactivity",
            artboardName: "SETTINGS"
        ),
        menu: .darkMode
    )
]

enum SelectedMenu: String{
    case home
    case search
    case favorites
    case help
    case history
    case notifications
    case darkMode
}
