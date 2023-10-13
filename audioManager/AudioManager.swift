//
//  AudioManager.swift
//  audioManager
//
//  Created by PC on 13/10/23.
//

import Foundation
import AVFoundation

class AudioManager: NSObject, AVAudioPlayerDelegate {
    private var audioPlayer: AVAudioPlayer?

    private var audioQueue: [AVAudioPlayer] = []

    func delayPlay(n: Int = 0) {
        if n == 5 {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            print("DEBUG: start", n)
            do {
                try self.queuePlay()
            } catch {
                print(error.localizedDescription)
            }
            self.delayPlay(n: n+1)
        }
    }
    //1
    func keepCurrent() throws {
        if audioPlayer?.isPlaying == true {return}

        guard let url = Bundle.main.url(forResource: "success", withExtension: "mp3") else {return}
        audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

        print("DEBUG: audio play")
        audioPlayer?.play()
    }
    //2
    func stopCurrent() throws {
//        if audioPlayer?.isPlaying == true {audioPlayer?.stop()}
        guard let url = Bundle.main.url(forResource: "success", withExtension: "mp3") else {return}
        audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

        print("DEBUG: audio play")
        audioPlayer?.play()
    }

    //3
    func multiplePlay() throws {
        guard let url = Bundle.main.url(forResource: "success", withExtension: "mp3") else {return}
        let audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

        print("DEBUG: audio play")
        audioPlayer.play()
        audioQueue.append(audioPlayer)
    }

    //4
    func queuePlay() throws {
        guard let url = Bundle.main.url(forResource: "success", withExtension: "mp3") else {return}
        let audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
        audioPlayer.delegate = self

        if audioQueue.isEmpty {
            print("DEBUG: audio play")
            audioPlayer.play()
        }
        audioQueue.append(audioPlayer)
    }

    //4
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        guard flag else {return}
        print("DEBUG: audio finish")

        if !audioQueue.isEmpty {audioQueue.removeFirst()}

        if let audioPlayer = audioQueue.first {
            print("DEBUG: audio play")
            audioPlayer.play()
        }
    }
}
