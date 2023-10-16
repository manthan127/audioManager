//
//  ContentView.swift
//  audioManager
//
//  Created by PC on 13/10/23.
//

import SwiftUI

struct ContentView: View {
    let audioManager = AudioManager()

    @State var one = 0
    @State var two = 0
    @State var three = 0
    @State var four = 0

    var body: some View {
        VStack {
            HStack {
                Button("keepCurrent: \(one)") {
                    audioManager.keepCurrent()
                    one+=1
                }
                .padding()
                Button("stopCurrent: \(two)") {
                    audioManager.stopCurrent()
                    two += 1
                }
            }
            HStack {
                Button("multiplePlay: \(three)") {
                    audioManager.multiplePlay()
                    three += 1
                }
                .padding()
                Button("queuePlay: \(four)") {
                    audioManager.queuePlay()
                    four += 1
                }
            }

            Button("Reset") {
                (one, two, three, four) = (0,0,0,0)
                audioManager.reset()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
