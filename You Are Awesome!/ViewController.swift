import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func showMessagePressed(_ sender: UIButton) {
        if messageLabel.text == "You Are Awesome!" {
            messageLabel.text = "You Are Great!"
        }
        else if messageLabel.text == "You Are Great!" {
            messageLabel.text = "You Are Amazing!"
        }
        else {
            messageLabel.text = "You Are Awesome!"
        }
        
    }
    

        
    
    
}

