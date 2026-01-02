//
//  UserProfile.swift
//  Restaurant
//
//  Created by Emmanuel on 02.01.26.
//

import SwiftUI

struct UserProfile: View {
    let userFirstName: String = UserDefaults.standard.string(forKey: "userFirstName") ?? ""
    let userLastName: String = UserDefaults.standard.string(forKey: "userLastName") ?? ""
    let userEmail: String = UserDefaults.standard.string(forKey: "userEmail") ?? ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Personal information")
            Image("profile-image-placeholder")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
            Text(userFirstName)
            Text(userLastName)
            Text(userEmail)
            Button (action: {
                UserDefaults.standard.set(false, forKey: "kIsLoggedIn")
                self.presentationMode.wrappedValue.dismiss()
            }
                    ,label:{
                Text("Logout")
                }
            )
            Spacer()
        }
    }
}


#Preview {
    UserProfile()
}
