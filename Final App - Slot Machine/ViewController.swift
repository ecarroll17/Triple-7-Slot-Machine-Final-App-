import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var firstBackground: UIImageView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        firstBackground.image = UIImage(named: "SlotMachineBackground")
    }

    

}

