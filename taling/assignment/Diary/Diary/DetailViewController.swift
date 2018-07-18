
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var DiaryTitle: UILabel!
    @IBOutlet weak var DiaryContent: UITextView!
    @IBOutlet weak var DiaryImage: UIImageView!
    
    var diaryTitle : String = ""
    var diaryContent : String = ""
    var diaryImgUrl : Data!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DiaryTitle.text = diaryTitle
        DiaryContent.text = diaryContent
        DiaryImage.image = UIImage(data: diaryImgUrl)
    }

}
