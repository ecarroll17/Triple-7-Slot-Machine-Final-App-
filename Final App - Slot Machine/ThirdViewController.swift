import UIKit

class ThirdViewController: UIViewController
{
    @IBOutlet weak var youScoredX: UILabel!
    @IBOutlet weak var thirdBackground: UIImageView!
    
    var scoreInt = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        youScoredX.text = "You Scored \(scoreInt) Points!"
        
        thirdBackground.image = UIImage(named: "confettiBackground")
    }
}
