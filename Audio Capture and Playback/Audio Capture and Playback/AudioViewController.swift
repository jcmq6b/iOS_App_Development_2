//
//  AudioViewController.swift
//  Audio Capture and Playback
//
//  Created by Jessica Murphey
//

import UIKit
import AVFoundation

class AudioViewController: UIViewController, AVAudioRecorderDelegate {
    
    //Forcing variables to be non-optional
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer!
    var numberOfRecordings: Int = 0
    
    //View variables
    @IBOutlet weak var recordButton: UIBarButtonItem!
    @IBOutlet weak var play_pause_button: UIBarButtonItem!
    @IBOutlet weak var toolbar: UIToolbar!
    
    //Image variables
    
    
    //Button Actions
    @IBAction func record(_ sender: Any) {
        //Check if already recording audio
        if audioRecorder == nil{
            //creates path for recording
            let filename = getFile().appendingPathComponent("audioRecording.m4a")
            
            //settings for recording
            let settings = [AVFormatIDKey: Int(kAudioFormatMPEG4AAC), AVSampleRateKey: 12000, AVNumberOfChannelsKey: 1, AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue]
            
            //audio recording
            do{
                //initialize auido recorder
                audioRecorder = try AVAudioRecorder(url: filename, settings: settings)
                audioRecorder.delegate = self
                //start recording
                audioRecorder.record()
                
                //change play_pause button
                play_pause_button.image = UIImage(named: "stop")
                
            }catch{
                displayAlert("Error", "Recording failed!")
            }
        }else{
            //stop audio recording
            audioRecorder.stop()
            audioRecorder = nil
            
            //save audio recording
            UserDefaults.standard.set(numberOfRecordings, forKey: "keyNumber")
            
            //change play_pause button
            play_pause_button.image = UIImage(named: "play")
        }
    }
    
    @IBAction func play_pause(_ sender: Any) {
        //check if it is currently recording
        if audioRecorder == nil{
            if(audioPlayer == nil){
                //grab recording
                let path = getFile().appendingPathComponent("audioRecording.m4a")
                
                //play contents
                do{
                    //initialize audio player
                    audioPlayer = try AVAudioPlayer(contentsOf: path)
                    audioPlayer.play()
                    play_pause_button.image = UIImage(named: "stop")
                }catch{
                    displayAlert("Error", "Error playing recording")
                }
            }else{
                audioPlayer.pause()
                play_pause_button.image = UIImage(named: "play")
            }

        }else{
//            //pause recording if it was recording
//            audioRecorder.pause()
//            //change play_pause button
//            play_pause_button.image = UIImage(named: "play")
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //disable toolbar buttons as default
        //Note: since I added loading the last recording on re-opening this will only stay disabled the first time the user runs the program
        self.toolbar.items![0].isEnabled = false
        self.toolbar.items![1].isEnabled = false
        
        //Set up session
        recordingSession = AVAudioSession.sharedInstance()
        
        //Ask for permission to use the microphone
        //This is only asked the first time the user runs the program since it loads previous recording on re-opening
        AVAudioSession.sharedInstance().requestRecordPermission { (hasPermission) in
            if hasPermission{
                print("User gave permission to use microphone")
                
                //enable toolbar buttons
                self.toolbar.items![0].isEnabled = true
                self.toolbar.items![1].isEnabled = true
            }
        }
        
        //Load recording
        if let number: Int = UserDefaults.standard.object(forKey: "keyNumber") as? Int{
            numberOfRecordings = number
        }
        
    }
    
    
    
    //Function that gets path to directory
    func getFile() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        return documentDirectory
    }
    
    //Function that displays alert
    func displayAlert(_ title: String, _ message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "dismiss", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
