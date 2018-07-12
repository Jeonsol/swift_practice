
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var DiaryTitle: UILabel!
    
    @IBOutlet weak var DiaryContent: UITextView!
    var diaryTitle : String = ""
    var diaryContent : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DiaryTitle.text = diaryTitle
        DiaryContent.text = diaryContent
        
        // Do any additional setup after loading the view.
    }

}
