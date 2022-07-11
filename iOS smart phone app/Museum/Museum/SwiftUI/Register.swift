//
//  Register.swift
//  Museum
//
//  Created by weezy on 4/11/21.
//

import SwiftUI

struct Register: View {
    @Binding var showlogin: Bool
    @Binding var showregister: Bool
    @State var username = ""
    @State var password = ""
    @State var showingAlert = false
    @ObservedObject var userRequest = UserRequest()
    var body: some View {
        Group {

        VStack {
            
//            CircleImage().offset(x: 0, y: -100).padding(.bottom, -180)
//            .padding(60)
            TextField("USERNAME", text: $username)
                .padding()
                .padding(5)
                .border(Color.white, width: 3)
                .cornerRadius(100)
            Divider()
                .background(Color.gray)
            
            SecureField("PASSWORD", text: $password)
                .padding()
                .padding(5)
                .border(Color.white, width: 3)
                .cornerRadius(100)
            Divider()
            
            HStack{
                
//                Button(action: {
//                    if password == "123456"{
//                        self.showingAlert = false
//                    }
//                    else{
//                        self.showingAlert = true
//                    }
//                }
//                )
//                {Text("Login".uppercased())
//                    .cornerRadius(50)
//                    }
//                    .padding(15)
//                .alert(isPresented: $showingAlert){
//                Alert(title: Text("Error"),
//                  message: Text("Invalid username or password."),
//                  dismissButton: .default(Text("OK")))
//            }
                
                Button(action: {
                    userRequest.registerUser(registerum: username, registerpwd: password)
                    self.showregister.toggle()
                    self.showlogin.toggle()
                }) {Text("Register".uppercased())}.padding()

                  }

    }



    }
        }
        
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register(showlogin: .constant(false),
                 showregister: .constant(true))
    }
}
