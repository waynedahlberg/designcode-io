//
//  HomeView.swift
//  DesignCode
//
//  Created by Wayne Dahlberg on 5/3/20.
//  Copyright © 2020 Wayne Dahlberg. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var showProfile: Bool
    @State var showUpdate: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Text("Watching")
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                    AvatarView(showProfile: $showProfile)
                    
                    Button(action: { self.showUpdate.toggle() }) {
                        Image(systemName: "bell")
                            .font(.system(size: 16, weight: .medium))
                            .frame(width: 36, height: 36)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                    }
                    .sheet(isPresented: $showUpdate) {
                        UpdateList()
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 30)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(sectionData) { item in
                        GeometryReader { geometry in
                            SectionView(section: item)
                                .rotation3DEffect(.init(degrees:
                                    Double(geometry.frame(in: .global).minX - 30) / -20
                                    ), axis: (x: 0.0, y: 10.0, z: 0.0))
                        }
                        .frame(width: 275, height: 275)
                    }
                }
                .padding(30)
                .padding(.leading, 14)
                .padding(.bottom, 30)
            }
            
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}

struct SectionView: View {
    
    var section: Section
    
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image(section.logo)
            }
            
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.5), radius: 20, x: 0, y: 20)
    }
}


struct Section : Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image 
    var color: Color
}

let sectionData = [
    Section(title: "Prototype designs in SwiftUI", text: "18 sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card4")), color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))),
    Section(title: "Build a SwiftUI app", text: "20 sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Background1")), color: Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1))),
    Section(title: "SwiftUI Advanced", text: "20 sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card2")), color: Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)))
]
