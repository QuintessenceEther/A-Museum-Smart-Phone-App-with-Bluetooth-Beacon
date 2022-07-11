//
//  Home.swift
//  Museum
//
//  Created by weezy on 4/25/21.
//

import SwiftUI

struct Home: View {
    @ObservedObject var detector = Detector()
    var voiceSynthesizer = VoiceSynthesizer()
    
    
    var body: some View {
        
        //MARK: - Exhibit Details
        VStack {
            VStack(spacing: 0) {
                Text("Exhibit: \(detector.titleString)")
                    .font(Font.system(size: 35))
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                    .foregroundColor(Color("DefaultColor"))
                Text("Author: \(detector.exhibitTitle)")
                    .font(Font.system(size: 25))
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 40)
                    .foregroundColor(Color("DefaultColor"))
                Text(detector.textDescription)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 90)
                    .font(Font.system(size: 20))
                    .foregroundColor(Color(.white))
                    .background(Color("DefaultColor"))

//                Text(detector.roomTitle)
//                    .font(Font.system(size: 20))
//                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 30)
//                    .foregroundColor(Color("DefaultColor"))


                Button(action:{
                    voiceSynthesizer.say(speaker: .catherine, phrase: detector.speech)
                })
                {Image(detector.imageString)
                    .resizable()
                    .aspectRatio(CGSize(width: 600, height: 750), contentMode: .fit)
                    .clipShape(Circle() )}


            }
            
            
            
            Spacer()
            
            //MARK: - Room Details
            VStack {
                Text("YOUR LOCATION")
                    .modifier(Standard())
//                Text("UUID: \(K.uuid)")
//                    .font(Font.system(size: 12, design: .rounded))
//                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .foregroundColor(Color.white)
                Text("Floor: \(detector.floor)")
                    .modifier(Standard())
                Text("Room: \(detector.location)")
                    .modifier(Standard())
                Text("Exhibit Status:  \(detector.lastDistance)")
                    .font(Font.system(size: 15, design: .rounded))
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .foregroundColor(Color.white)
                    .background(detector.bgColor)
            }
            .frame(maxHeight: 120)
            .background(Color("DefaultColor"))
        }
        .alert(isPresented: $detector.showAlert) {
            Alert(title: Text(K.alert), message: Text(detector.alert), dismissButton: .default(Text(K.ok)))
        }
        
        Spacer()
            
            .onChange(of: detector.titleString) {  [weak detector] newState in
//                voiceSynthesizer.say(speaker: .gordon , phrase: detector?.speech)
            }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
