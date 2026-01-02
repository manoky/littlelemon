//
//  Home.swift
//  Restaurant
//
//  Created by Emmanuel on 01.01.26.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView {
            Menu()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            UserProfile()
                .tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
        }.navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    Home()
}
