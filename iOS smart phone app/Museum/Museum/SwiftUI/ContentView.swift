//
//  ContentView.swift
//  Museum
//
//  Created by Weezy on 2/25/21.
//

import SwiftUI

/// Common view settings repeatedly used throughout the ContentView
struct Standard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: 15))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .foregroundColor(Color.white)
    }
}


struct ContentView: View {
    @State var showlogin = true
    @State var showregister = false
    var body: some View{
        if showlogin{
            Login(showlogin:    self.$showlogin,
                  showregister: self.$showregister)
        }
        else if showregister{
            Register(showlogin:     self.$showlogin,
                     showregister:  self.$showregister)
        }
        else{
            Home()
        }
    }
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}
#endif
