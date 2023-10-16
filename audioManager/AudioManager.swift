//
//  AudioManager.swift
//  audioManager
//
//  Created by PC on 13/10/23.
//

import Foundation
import AVFoundation

//MARK: Error is not handled properly
class AudioManager: NSObject, AVAudioPlayerDelegate {
    private var audioQueue: [AVAudioPlayer] = []
    private var queuedAudios: [AVAudioPlayer] = []


    private func newAudioPlayer() -> AVAudioPlayer {
        let url = Bundle.main.url(forResource: "success", withExtension: "mp3")!
        let audioPlayer = try! AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
        audioPlayer.delegate = self

        return audioPlayer
    }

    func reset() {
        audioQueue = []
    }
    
    func keepCurrent() {
        if let _ = audioQueue.first(where: {$0.isPlaying}) {
            return
        }

        let audioPlayer = newAudioPlayer()
        audioQueue.append(audioPlayer)

        print("DEBUG: audio play")
        audioPlayer.play()
    }

    func stopCurrent() {
        audioQueue = []
        let audioPlayer = newAudioPlayer()
        audioQueue.append(audioPlayer)

        print("DEBUG: audio play")
        audioPlayer.play()
    }

    func multiplePlay() {
        let audioPlayer = newAudioPlayer()

        print("DEBUG: audio play")
        audioPlayer.play()
        audioQueue.append(audioPlayer)
    }

    func queuePlay() {
        let audioPlayer = newAudioPlayer()

        if audioQueue.isEmpty {
            print("DEBUG: audio play")
            audioPlayer.play()
        }
        audioQueue.append(audioPlayer)
        queuedAudios.append(audioPlayer)
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        guard flag else {return}
        print("DEBUG: audio finish")

        print(audioQueue.count)
        if !audioQueue.isEmpty {audioQueue.removeFirst()}
//        audioQueue.removeAll(where: {$0 == player})


        if let audioPlayer = audioQueue.first {
            if queuedAudios.contains(audioPlayer) {
                print("DEBUG: queued audio play")
                audioPlayer.play()
            }
        }
    }
}
