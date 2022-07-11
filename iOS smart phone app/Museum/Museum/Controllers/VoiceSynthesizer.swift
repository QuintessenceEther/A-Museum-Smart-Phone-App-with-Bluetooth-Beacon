//
//  VoiceSynthesizer.swift
//  Museum
//
//  Created by weezy on 3/27/21.
//

import AVFoundation

class VoiceSynthesizer: ObservableObject {
    
    let synth  = AVSpeechSynthesizer()
    var speech = AVSpeechUtterance(string: String())
    
    func say(speaker: EnglishSpeakers, phrase: String?, rate: Float = 0.37, pitch: Float = 1) {
        speech = AVSpeechUtterance(string: phrase ?? K.emptyString)
        speech.rate = rate // range [0.0 - 1.0]
        speech.pitchMultiplier = pitch // range [0.5 - 2]
        speech.voice = AVSpeechSynthesisVoice(identifier: speaker.rawValue)
        synth.speak(speech)
    }
    
    func stop() {
        synth.stopSpeaking(at: .immediate)
    }
}

