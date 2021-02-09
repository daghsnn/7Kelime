//
//  MainMenuViewController.swift
//  7Kelime
//
//  Created by Hasan Dagg on 21.12.2020.
//  Copyright © 2020 Come492. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation

class MainMenuViewController: UIViewController {

    @IBOutlet weak var btntext: UIButton!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        var audioPlayer = AVAudioPlayer()
        let soundURL = NSURL(fileURLWithPath: Bundle.main.path(forResource: "7KelimeMain", ofType: "wav")!)

            do{
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL as URL)

            }catch {
                print("")
            }
        audioPlayer.numberOfLoops = 1000
        audioPlayer.play()
//        let context = self.appDelegate.persistentContainer.viewContext
//        let entity = NSEntityDescription.entity(forEntityName: "Player", in: context)
//        let nwPlayer = NSManagedObject(entity: entity!, insertInto: context)
//        Player.setValue(level, forKey: "level")
//        Player.setValue(score, forKey: "score")
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
//        request.returnsObjectsAsFaults = false
//        let nwPlayer = Player(context: context)
//        request.returnsObjectsAsFaults = false
//        var levelcheck = nwPlayer.level
//        do {
//            let result = try! context.fetch(request)
//            for data in result as! [NSManagedObject] {
//                levelcheck = Int32(data.value(forKey: "level") as! Int)
//          }
//
//        }
        /*let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                nwPlayer.playerLevel = data.value(forKey: "level") as! Int
          }
            for data in result as! [NSManagedObject] {
                  nwPlayer.playerScore = data.value(forKey: "score") as! Int
            }
            
        } catch {
            
            print("Failed")
        }
            
        
        print(nwPlayer.playerLevel)
        print(nwPlayer.playerScore)
       */
        var level = defaults.integer(forKey: "level")
        var score = defaults.integer(forKey: "score")
        print(level)
            if var crntplayer = defaults.object(forKey: "Player") as? PlayerData {
                    level = 1
                    score = 0
                    defaults.set(level, forKey: "level")
                    defaults.set(score, forKey: "score")
                
            } else {
                level = defaults.integer(forKey: "level")
                score = defaults.integer(forKey: "score")
                
               }
        
        if level == 1 {
            btntext.setTitle("Yeni Oyun", for: .normal)
        }
        
        else {
            btntext.setTitle("Devam Et", for: .normal)
        }
       
    }
    
    @IBAction func startGame(_ sender: Any) {
        self.performSegue(withIdentifier: "toViewController", sender: self)


    }
    @IBAction func ayarlarClick(_ sender: Any) {
        self.performSegue(withIdentifier: "toAyarlarVC", sender: self)
    }
    

}
