//
//  CircleImage.swift
//  Museum
//
//  Created by weezy on 4/25/21.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("icon")
            .resizable()
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
