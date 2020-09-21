import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var awesomeImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    var awesomePlayer = AVAudioPlayer()
    var index = -1
    var imageIndex = -1
    var soundIndex = -1
    let numOfImages = 5
    let numOfSounds = 5
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func showMessagePressed(_ sender: UIButton) {
        
        let messages = ["You Are Awesome!!",
                        "You Are Great!",
                        "You Are Fantastic",
                        "When the Genius Bar needs help, they call you",
                        "You Brighten My Day!",
                        "You are da bomb!",
                        "Hey, fabulous!",
                        "You are tremendous!",
                        "You've got the design skills of Jony Ive",
                        "I can't wait to download your app!"]
        
        var newIndex: Int
        
        // OR you can do this vvv
        // var newIndex = -1
        //show a message
        repeat  {
            newIndex = Int.random(in: 0..<messages.count)
        } while index == newIndex
        
        index = newIndex
        messageLabel.text = messages[index]
        //show an image
        repeat {
            newIndex = Int.random(in: 0..<numOfImages)
        } while imageIndex == newIndex
        
        imageIndex = newIndex
        awesomeImageView.image = UIImage(named: "img\(imageIndex)")
        
        
        //get random number to use in soundName file
        repeat {
            newIndex = Int.random(in: 0..<numOfSounds)
        } while soundIndex == newIndex
        
        soundIndex = newIndex
        

        //play a sound
        var soundName = "sound\(soundIndex)"
        
        if let sound = NSDataAsset(name: soundName) {
            //check to see if sound.data is sound file
            do {
                try awesomePlayer = AVAudioPlayer(data: sound.data)
                awesomePlayer.play()
            } catch {
                // if sound.data is not viable audio file
                print("ERROR: data in \(soundName) couldn't be played as a sound.")
            }
        } else {
            print("ERROR: file \(soundName) disn't load")
        }
        }
//        messageLabel.text = messages.randomElement()!
//
//
        
//        messageLabel.text = messages[index]
//
//
//        if index == messages.count - 1 {
//            index = 0
//        } else {
//            index = index + 1
//        }
//
//        let message1 = "You Are Da Bomb!"
//        let message2 = "You Are Great!"
//        let message3 = "You Are Amazing!"
//
//        if messageLabel.text == message1 {
//            messageLabel.text = message2
//        }
//        else if messageLabel.text == message2 {
//            messageLabel.text = message3
//        }
//        else {
//            messageLabel.text = message1
//        }
        
    }
    

        
    
    


