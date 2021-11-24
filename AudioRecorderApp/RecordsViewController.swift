//
//  saveRecordsViewController.swift
//  AudioRecorderApp
//
//  Created by Sivaranjani Venkatesh on 25/10/21.
//

//
// 

import UIKit
import CoreData
import AVFoundation

class RecordsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate, AVAudioPlayerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
//    var record: [NSManagedObject] = []
    let cellId = "CellId"
    var error: NSError? = nil
    var audioPlayer:AVAudioPlayer = AVAudioPlayer()
    var soundNoteTitle:String!
    var recordsListArray:[Record]  = []
    var soundsNoteID: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
       
        title  = soundNoteTitle
        
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        let noteSoundsContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let noteSoundsFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Record")
//        noteSoundsFetchRequest.predicate = NSPredicate(format: "noteID = %@", recordsNoteID)

        do {
            let noteSoundsFetchResults = try noteSoundsContext.fetch(noteSoundsFetchRequest) as? [Record]
            recordsListArray = noteSoundsFetchResults!
        } catch {
            print("Could not fetch \(error)")
        }
        self.tableView.reloadData()
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return recordsListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let noteSound: Record = recordsListArray[(indexPath as NSIndexPath).row] as Record
        
        cell.textLabel?.text =  noteSound.noteSoundTitle
        
        return cell
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let noteSound: Record = recordsListArray[(indexPath as NSIndexPath).row] as Record
        let soundURL = noteSound.noteSoundURL
        //print(noteSoundURL!)
        
        let directoryURL = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in:
            FileManager.SearchPathDomainMask.userDomainMask).first // as NSURL
        
         let audioFileURL = directoryURL!.appendingPathComponent(soundURL!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFileURL)
        } catch let error1 as NSError {
            error = error1
        }
        audioPlayer.play()
        audioPlayer.delegate = self     // IMPORTANT: Must Delegate to Receive audioPlayerDidFinishPlaying notification

        
        
    }

func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {

    player.stop()
    if audioPlayer.isPlaying == false {
        
    }

    
}

}
