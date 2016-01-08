import UIKit

class SecondViewController: UIViewController
{
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var scoreTotalLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var creditsLabel: UILabel!
    
    var slotItems = ["🍇", "🍒", "🍊", "🔔", "🎰"]
    var score = 0
    var credits = 20
   
    override func viewDidLoad()
    {
        super.viewDidLoad()    
    }
    
    @IBAction func spinWheels(sender: UITapGestureRecognizer)
    {
        //Switch Images:
        
        let randomItemOne = Int(arc4random_uniform(UInt32(slotItems.count)))
        let randomItemTwo = Int(arc4random_uniform(UInt32(slotItems.count)))
        let randomItemThree = Int(arc4random_uniform(UInt32(slotItems.count)))
        
        labelOne.text = slotItems[randomItemOne]
        labelTwo.text = slotItems[randomItemTwo]
        labelThree.text = slotItems[randomItemThree]
        solver()
        
        //Credits:
        
        creditsLabel.text = "\(credits)"
        credits = --credits
      
        if credits == -1
        {
            endGame()
        }
        
        //if labelThree.text == "🎰"
        //{
            //credits = credits + 1
        //}
        //if labelTwo.text == "🔔"
        //{
            //credits = credits + 1
        //}
        //if labelOne.text == "🍒"
        //{
            //credits = credits + 1
        //}
    }
    
    //Credit Limit Reached:
    
    func endGame()
    {
        performSegueWithIdentifier("endGameSegue", sender: nil)
    }
    
    //Check for Combos:
    
    func solver()
    {
        if labelOne.text == "🎰" && labelOne.text == labelTwo.text && labelTwo.text == labelThree.text
        {
            score = score + 1000
        }
        if labelOne.text == "🔔" && labelOne.text == labelTwo.text && labelTwo.text == labelThree.text
        {
            score = score + 500
        }
        if labelOne.text == "🍇" && labelOne.text == labelTwo.text && labelTwo.text == labelThree.text
        {
            score = score + 400
        }
        if labelOne.text == "🍊" && labelOne.text == labelTwo.text && labelTwo.text == labelThree.text
        {
            score = score + 300
        }
        if labelOne.text == "🍒" && labelOne.text == labelTwo.text && labelTwo.text == labelThree.text
        {
            score = score + 200
        }
        else
        {
            score = score + 0
        }
        scoreTotalLabel.text = "\(score)"
    }
    
    //Carries Score Value To Final View Controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let thirdVC = segue.destinationViewController as! ThirdViewController
        thirdVC.scoreInt = scoreTotalLabel.text!
    }
}
