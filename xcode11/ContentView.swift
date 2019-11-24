//
//  ContentView.swift
//  xcode11
//
//  Created by Sokol Ikonomi on 11/23/19.
//  Copyright © 2019 Sokol Ikonomi. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State var username: String = ""
    @State var password: String = ""
    
    // we declare a State property of a boolean type and set its default value to false meaning the authentication process did not fail
    @State var authenticationDidFail: Bool = false
    
    /**
     
    Case 1: The user did nothing but entering it credentials into the Text Fields. Especially he didn’t start the authentication process by clicking on the login button. In this situation we can use the default view we created as it is and don’t need to modify anything.
     
    Case 2: The user  entered the authentication process by tapping the login button and it failed. In this case, we want to display a text saying that the entered information was wrong.
     
    Case 3: The user entered the authentication process by tapping the login button and it succeeded. In this case, we want to display a text saying the login was successful.
     
     **/
    
    var body: some View {
 
        
        VStack {
           UsernameTextField(username: $username)
           PasswordSecureField(password: $password)
        
            // if the authentication process did fail show the error
            if authenticationDidFail {
                Text("Information not correct. Try again.")
                    .offset(y: -10)
                    .foregroundColor(Color.red)
            } else {
                 Text("Login succeeded!")
                    .offset(y: -10)
                    .foregroundColor(Color.green)
            }
            
           Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.green)
            .cornerRadius(15.0)

        }
        .padding()
}
    
struct UsernameTextField : View {
    
    @Binding var username: String
    
    var body: some View {
        return TextField("Username", text: $username)
            .padding()
            .background(Color.purple)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
  }
    
struct PasswordSecureField : View {
        
        @Binding var password: String
        
        var body: some View {
            return SecureField("Password", text: $password)
                .padding()
                .background(Color.purple)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
        }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
