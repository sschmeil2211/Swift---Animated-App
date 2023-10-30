//
//  RecentCard.swift
//  experimental app
//
//  Created by Sebastian Schmeil on 01/11/2023.
//

import SwiftUI

struct RecentCard: View {
    var section: CourseSection
    
    var body: some View {
        HStack(spacing: 20){
            VStack(alignment: .leading, spacing: 10){
                Text(section.title)
                    .font(.system(size: 26, weight: .black))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(section.caption)
            }
            Divider()
            section.image
        }
        .padding(30)
        .frame(maxWidth: .infinity, maxHeight: 110)
        .background(section.color)
        .foregroundColor(.white)
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
        )
    }
}

#Preview {
    RecentCard(section: courseSections[0])
}
