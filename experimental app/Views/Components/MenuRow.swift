//
//  MenuRow.swift
//  experimental app
//
//  Created by Sebastian Schmeil on 02/11/2023.
//

import SwiftUI

struct MenuRow: View {
    var item: MenuItem
    @Binding var selectedMenu: SelectedMenu
    
    var body: some View {
        HStack{
            item.icon.view()
                .frame(width: 30, height: 30)
                .opacity(0.6)
            Text(item.text)
                .font(.headline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(15)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.gray.opacity(0.2))
                .frame(maxWidth: selectedMenu == item.menu ? .infinity : 0)
        )
        .onTapGesture {
            item.icon.setInput("active", value: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                item.icon.setInput("active", value: false)
            }
            withAnimation(.timingCurve(0.2, 0.8, 0.2, 1)) {
                selectedMenu = item.menu
            }
        }
    }
}

#Preview {
    MenuRow(item: menuItems[0], selectedMenu: .constant(.home))
}
