//
//  HomeScreen.swift
//  experimental app
//
//  Created by Sebastian Schmeil on 01/11/2023.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ZStack {
            Color(.white).ignoresSafeArea()
            ScrollView {
                content
            }
        }
    }
    
    var content: some View{
        VStack(alignment: .leading, spacing: 0){
            Text("Courses")
                .font(.system(size: 34, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 20){
                    ForEach(courses){
                        course in CourseCard(course: course)
                    }
                }
                .padding(20)
                .padding(.bottom, 10)
            }
            Text("Recent")
                .font(.system(size: 26, weight: .bold))
                .padding(.horizontal, 20)
            VStack(spacing: 20){
                ForEach(courseSections){section in
                    RecentCard(section: section)
                }
            }
            .padding(20)
        }
    }
}

#Preview {
    HomeScreen()
}
