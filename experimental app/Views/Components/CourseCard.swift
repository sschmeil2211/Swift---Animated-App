//
//  Card.swift
//  experimental app
//
//  Created by Sebastian Schmeil on 01/11/2023.
//

import SwiftUI

struct CourseCard: View {
    var course: Course
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text(course.title)
                .font(.system(size: 28, weight: .black))
                .frame(maxWidth: 170, alignment: .leading)
                .layoutPriority(1)
            Text(course.subtitle)
                .opacity(0.7)
            Text(course.caption.uppercased())
                .font(.system(size: 18, weight: .semibold ))
            Spacer()
            HStack {
                ForEach(Array([4, 5, 6].shuffled().enumerated()), id: \.offset){ index, number in
                    Image("Avatar \(number)")
                        .resizable()
                        .frame(width: 45, height: 45)
                        .mask(Circle())
                        .offset(x: CGFloat(index * -20))
                }
            }
        }
        .foregroundColor(.white)
        .padding(30)
        .frame(width: 300, height: 310)
        .background(
            .linearGradient(
                colors: [course.color, course.color.opacity(0.5)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
        )
        .shadow(
            color: course.color.opacity(0.3),
            radius: 8,
            x: 0,
            y: 12
        )
        .shadow(
            color: course.color.opacity(0.3),
            radius: 2,
            x: 0,
            y: 1
        )
        .overlay(
            course.image
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding(20)
        )
    }
}

#Preview {
    CourseCard(course: courses[2])
}
