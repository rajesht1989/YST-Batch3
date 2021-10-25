//
//  ViewController.swift
//  AudioRecorderApp
//
//  Created by Sivaranjani Venkatesh on 24/10/21.
//

import UIKit
import AVFoundation
import CoreData

class ViewController: UIViewController,AVAudioPlayerDelegate,AVAudioRecorderDelegate, UITextFieldDelegate {
    var soundNoteID:String!
    var soundNoteTitle:String!
    var soundURL:String!
    var audioRecorder:AVAudioRecorder!
    var audioPlayer:AVAudioPlayer!
    
    @IBOutlet weak var recordBtnOutlet: UIButton!
    
    @IBOutlet weak var stopBtnOutlet: UIButton!
    
    @IBOutlet weak var playBtnOutlet: UIButton!
    
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var saveInformationLabel: UILabel!
    
    @IBOutlet weak var soundTitileTextField: UITextField!
    
    @IBOutlet weak var soundRecordPlayStatusLabel: UILabel!
    
    
    var audioData: Data?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var records  = [Record]() // Where Locations = your NSManaged Class

        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Record")
        
        let result = try! context.execute(fetchRequest)
        
//        result.
        
//        records = context.executeFetchRequest(fetchRequest, error: nil) as [Record]

        // Then you can use your properties.

        for record in records {

          print(record.name)

        }
        
        
        
        checkMicrophoneAccess()
        saveBtn.isEnabled = false
        self.navigationController?.navigationBar.tintColor = .white
        soundTitileTextField.delegate = self
        titleLabel.text = soundNoteTitle
        saveInformationLabel.alpha = 0
        //Disable play and pause button when app lanuches
        stopBtnOutlet.isEnabled = false
        playBtnOutlet.isEnabled = false
        //Set the directory
        let directoryURL = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in:
                                                        FileManager.SearchPathDomainMask.userDomainMask).first
        
        let audioFileName = UUID().uuidString + ".m4a"
        let audioFileURL = directoryURL!.appendingPathComponent(audioFileName)
        soundURL = audioFileName // soundURL stored in coreData
        
        //Setup audio session
        
        let audioSession = AVAudioSession.sharedInstance()
        
        do {
            try audioSession.setCategory(AVAudioSession.Category(rawValue: convertFromAVAudioSessionCategory(AVAudioSession.Category.playAndRecord)), mode: .default)
        }
        catch _{
            
        }
        // Define the recorder setting
        let recorderSetting = [AVFormatIDKey: NSNumber(value: kAudioFormatMPEG4AAC as UInt32),
                             AVSampleRateKey: 44100.0,
                       AVNumberOfChannelsKey: 2 ]
        
        audioRecorder = try? AVAudioRecorder(url: audioFileURL, settings: recorderSetting)
        audioRecorder?.delegate = self
        audioRecorder?.isMeteringEnabled = true
        audioRecorder?.prepareToRecord()
        
        soundRecordPlayStatusLabel.text = "Ready to Record"
        // Hides Navigation Controller Thin Line Shadow Bar
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
    }
    
    @IBAction func recordBtnTapped(_ sender: Any) {
        
        
        saveInformationLabel.text = ""
        
        // Stop the audio player before recording
        if let player = audioPlayer {
            if player.isPlaying {
                player.stop()
                playBtnOutlet.setImage(UIImage(named: "Play-Jolly"), for: UIControl.State())
                playBtnOutlet.isSelected = false
            }
        }
        
        if let recorder = audioRecorder {
            if !recorder.isRecording {
                let audioSession = AVAudioSession.sharedInstance()
                
                do {
                    try audioSession.setActive(true)
                } catch _ {
                }
                
                // Start recording
                recorder.record()
                
                soundRecordPlayStatusLabel.text = "Recording .."
                
                recordBtnOutlet.isSelected = true
                stopBtnOutlet.isEnabled = true
                playBtnOutlet.isEnabled = false
                
            } else {
                // Pause recording
                
                recorder.pause()
                
                soundRecordPlayStatusLabel.text = "Paused!"
                
                
                stopBtnOutlet.isEnabled = false
                playBtnOutlet.isEnabled = false
                recordBtnOutlet.isSelected = false
                
            }
        }
        
    }
    @IBAction func stopBtnTapped(_ sender: Any) {
        
        
        soundRecordPlayStatusLabel.text = "Stopped!"
        
        recordBtnOutlet.isSelected = false
        playBtnOutlet.isSelected = false
        
        stopBtnOutlet.isEnabled = false
        playBtnOutlet.isEnabled = true
        recordBtnOutlet.isEnabled = true
        
        if let recorder = audioRecorder {
            if recorder.isRecording {
                audioRecorder?.stop()
                let audioSession = AVAudioSession.sharedInstance()
                do {
                    try audioSession.setActive(false)
                } catch _ {
                }
            }
        }
        
        // Stop the audio player if playing
        if let player = audioPlayer {
            if player.isPlaying {
                player.stop()
            }
        }
        // If user recorded then stopped then allow SAVE now (even without a title)
        saveBtn.isEnabled = true
    }
    @IBAction func platBtnTapped(_ sender: Any) {
        if let recorder = audioRecorder {
            if !recorder.isRecording {
                audioPlayer = try? AVAudioPlayer(contentsOf: recorder.url)
                audioPlayer?.delegate = self
                audioPlayer?.play()
                playBtnOutlet.setImage(UIImage(named: "Play-Outlined"), for: UIControl.State.selected)
                playBtnOutlet.isSelected = true
                stopBtnOutlet.isEnabled = true
                
                soundRecordPlayStatusLabel.text = "Playing .."
                recordBtnOutlet.isEnabled = false
                
            }
        }
    }
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            
            soundRecordPlayStatusLabel.text = "Recording Completed"
            
            
            recordBtnOutlet.isEnabled = true
            playBtnOutlet.isEnabled = true
            stopBtnOutlet.isEnabled = false
            
            
            audioData = try? Data(contentsOf: recorder.url)
            
        }
    }
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
        soundRecordPlayStatusLabel.text = "Playing Completed"
        
        recordBtnOutlet.setImage(UIImage(named: "Microphone-Jolly"), for: UIControl.State())
        playBtnOutlet.setImage(UIImage(named: "Play-Jolly"), for: UIControl.State())
        stopBtnOutlet.setImage(UIImage(named: "Stop-Outlined"), for: UIControl.State())
        
        playBtnOutlet.isSelected = false
        stopBtnOutlet.isEnabled = false
        recordBtnOutlet.isEnabled = true
        
    }
    @IBAction func saveBtnTapped(_ sender: Any) {
        
        let soundsContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let record = NSEntityDescription.insertNewObject(forEntityName: "Record", into: soundsContext) as! Record
        
        var title:String = "Sound"
        
        if let title = soundTitileTextField.text {
            var noteSoundTitle:String = title
        }
        record.name = title
        record.audio = audioData

        do {
            try soundsContext.save()
        } catch _ {
        }
        saveInformationLabel.alpha = 1
        saveInformationLabel.text = "Saved " + title
        saveInformationLabel.adjustsFontSizeToFitWidth = true
        soundTitileTextField.text = ""
        
        // Set the audio recorder ready to record the next audio with a unique audioFileName
//        let directoryURL = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in:
//                                                        FileManager.SearchPathDomainMask.userDomainMask).first // as! NSURL
//
//        let audioFileName = UUID().uuidString + ".m4a"
//        let audioFileURL = directoryURL!.appendingPathComponent(audioFileName)
//        soundURL = audioFileName       // Sound URL to be stored in CoreData
//
//        // Setup audio session
//        let audioSession = AVAudioSession.sharedInstance()
//        do {
//            try audioSession.setCategory(AVAudioSession.Category(rawValue: convertFromAVAudioSessionCategory(AVAudioSession.Category.playAndRecord)), mode: .default)
//        } catch _ {
//        }
//
        // Define the recorder setting
//        let recorderSetting = [AVFormatIDKey: NSNumber(value: kAudioFormatMPEG4AAC as UInt32),
//                             AVSampleRateKey: 44100.0,
//                       AVNumberOfChannelsKey: 2 ]
//
//        audioRecorder = try? AVAudioRecorder(url: audioFileURL, settings: recorderSetting)
//        audioRecorder?.delegate = self
//        audioRecorder?.isMeteringEnabled = true
//        audioRecorder?.prepareToRecord()
        
        soundRecordPlayStatusLabel.text = "Ready to Record"
        
        playBtnOutlet.isEnabled = false
        stopBtnOutlet.isEnabled = false
        saveBtn.isEnabled = false
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        soundTitileTextField.resignFirstResponder()   // When the Enter key is pressed on the keyboard the keyboard will be dismissed.
        return false
    }
    
    // Keyboard Control
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    func checkMicrophoneAccess() {
        // Check Microphone Authorization
        switch AVAudioSession.sharedInstance().recordPermission {
            
        case AVAudioSession.RecordPermission.granted:
            print(#function, " Microphone Permission Granted")
            break
            
            
        case AVAudioSession.RecordPermission.undetermined:
            print("Request permission here")
            // Dismiss Keyboard (on UIView level, without reference to a specific text field)
            UIApplication.shared.sendAction(#selector(UIView.endEditing(_:)), to:nil, from:nil, for:nil)
            
            AVAudioSession.sharedInstance().requestRecordPermission({ (granted) in
                // Handle granted
                if granted {
                    print(#function, " Now Granted")
                } else {
                    print("Pemission Not Granted")
                    
                } // end else
            })
        @unknown default:
            print("ERROR! Unknown Default. Check!")
        } // end switch
        
        return
        
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
        saveBtn.isEnabled = (newText.length > 0)  // implied if; as isEnabled is a Bool true/false
        return true
    }
    fileprivate func convertFromAVAudioSessionCategory(_ input: AVAudioSession.Category) -> String {
        return input.rawValue
    }
    
    // Helper function inserted by Swift migrator.
    fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
        return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
    }
    
}







