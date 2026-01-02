//
//  Onboarding.swift
//  Restaurant
//
//  Created by Emmanuel on 31.12.25.
//

let userFirstNameKey: String = "userFirstName"
let userLastNameKey: String = "userLastName"
let userEmailKey: String = "userEmail"

import SwiftUI

struct Onboarding: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State var isLoggedIn: Bool = false
    let kIsLoggedIn = "kIsLoggedIn"
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    EmptyView()
                }
        
                TextField("First Name", text: $firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Last Name", text: $lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Email", text: $email)
                 .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                Button(action: {
 
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty && isValid(email) {
                        UserDefaults.standard.set(firstName, forKey: userFirstNameKey)
                        UserDefaults.standard.set(lastName, forKey: userLastNameKey)
                        UserDefaults.standard.set(email, forKey: userEmailKey)
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        isLoggedIn = true

                    } else {
                        return
                    }
                }, label: {
                    Text("Register")
                })
                
            }
        }.onAppear() {
            if(UserDefaults.standard.bool(forKey: kIsLoggedIn)) {
                isLoggedIn = true
            }
        }
    }
    
    func isValid(_ email: String) -> Bool {
        guard !email.isEmpty else { return false }
        
        let emailRegEx = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
         return emailPred.evaluate(with: email)
    }
}

#Preview {
    Onboarding()
}
