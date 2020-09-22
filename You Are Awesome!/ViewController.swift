import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var awesomeImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var soundSwitch: UISwitch!
    var awesomePlayer = AVAudioPlayer()
    var index = -1
    var imageIndex = -1
    var soundIndex = -1
    let numOfImages = 5
    let numOfSounds = 5
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func playSound(soundName: String) {
        if let sound = NSDataAsset(name: soundName) {
            do {
                try awesomePlayer = AVAudioPlayer(data: sound.data)
                awesomePlayer.play()
            } catch {
                print("ERROR: data in \(soundName) couldn't be played as a sound.")
            }
        } else {
            print("ERROR: file \(soundName) disn't load")
        }
    }
    func nonRepeatingRandom(lastNumber: Int, maxValue: Int) -> Int {
        var newIndex: Int
        repeat  {
            newIndex = Int.random(in: 0..<maxValue)
        } while lastNumber == newIndex
    
        return newIndex
    }
    
    @IBAction func soundSwitchedPressed(_ sender: UISwitch) {
        if soundSwitch.isOn == false && soundIndex != -1 {
                awesomePlayer.stop()
            }
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
        
        index = nonRepeatingRandom(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
        
        imageIndex = nonRepeatingRandom(lastNumber: imageIndex, maxValue: numOfImages)
        awesomeImageView.image = UIImage(named: "img\(imageIndex)")
        
        if soundSwitch.isOn {
            soundIndex = nonRepeatingRandom(lastNumber: imageIndex, maxValue: numOfSounds)
//            let soundName = "sound\(soundIndex)"
            playSound(soundName: "sound\(soundIndex)")
        }
        
        //  playSound() (above) needs to go inside a conditional 'if' statement once you've added the switch (below)
    }
    
    
    // put IBAction for UISwitch here
}
