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
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
