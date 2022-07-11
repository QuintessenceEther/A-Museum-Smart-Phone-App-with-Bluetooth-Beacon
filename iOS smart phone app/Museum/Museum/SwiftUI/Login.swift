//
//  Login.swift
//  Museum
//
//  Created by weezy on 4/25/21.
//

import Foundation
import CoreLocation
import SwiftUI
import Alamofire

struct Login: View {
    @Binding var showlogin : Bool
    @Binding var showregister: Bool
    @State var username = ""
    @State var password = ""
    @State var showingAlert = false
    @ObservedObject var userRequest = UserRequest()


    var body: some View {

        Group {

        VStack {
            
            CircleImage().offset(x: 0, y: -100).padding(.bottom, -180)
            .padding(60)
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
                
                Button(action: {

                    if userRequest.validateUser(username: username, password: password){
                        self.showingAlert = false
                        self.showlogin.toggle()
                    }
                    else{
                        self.showingAlert = true
                    }
                }
                )
                {Text("Login".uppercased())
                    .cornerRadius(50)
                    }
                    .padding(15)
                .alert(isPresented: $showingAlert){
                Alert(title: Text("Error"),
                  message: Text("Invalid username or password."),
                  dismissButton: .default(Text("OK")))
            }
                
                Button(action: {
                    self.showlogin.toggle()
                    self.showregister.toggle()
                }) {Text("Register".uppercased())}.padding()

                  }

    }



    }
        }

        
}
        

    



struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(showlogin: .constant(true),
              showregister: .constant(false))
    }
}



