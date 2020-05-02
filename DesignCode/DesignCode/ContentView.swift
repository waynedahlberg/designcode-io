//
//  ContentView.swift
//  DesignCode
//
//  Created by Wayne Dahlberg on 5/1/20.
//  Copyright © 2020 Wayne Dahlberg. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.semibold)
                    Text("Certificate")
                    .foregroundColor(Color("accent"))
                }
                Spacer()
                Image("Logo1")
            }
            Spacer()
            Image("Card1")
            .resizable()
            .aspectRatio(contentMode: .fit)
        }
        .frame(width: 340.0, height: 220.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
