//
//  Menu.swift
//  Restaurant
//
//  Created by Emmanuel on 01.01.26.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack {
            Text("Little Lemon Restaurant")
            Text("Chicago, IL")
            Text("""
                 We are a family owned
                 Mediterranean restaurant, focused on traditional recipes served with a modern twist.
                 """)
            List {
                Text("Appetizers")
                Text("Soups")
                Text("Salads")
                Text("Main Courses")
                Text("Desserts")
            }
        }
    }
}

#Preview {
    Menu()
}
