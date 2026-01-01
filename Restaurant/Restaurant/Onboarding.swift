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
    
    var body: some View {
        VStack {
    
            TextField("First Name", text: $firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Last Name", text: $lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Email", text: $email)
             .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                if firstName.isEmpty && lastName.isEmpty && email.isEmpty {
                    UserDefaults.standard.set(firstName, forKey: userFirstNameKey)
                    UserDefaults.standard.set(lastName, forKey: userLastNameKey)
                    if isValid(email) {
                        UserDefaults.standard.set(email, forKey: userEmailKey)
                    }
                    
                }else {
                    return
                }
            }, label: {
                Text("Register")
            })
            
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
