//
//  ContentView.swift
//  audioManager
//
//  Created by PC on 13/10/23.
//

import SwiftUI

struct ContentView: View {
    let audioManager = AudioManager()
    var body: some View {
        Button("Play") {
            audioManager.delayPlay()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
