
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var DiaryTitle: UILabel!
    @IBOutlet weak var DiaryContent: UITextView!
    @IBOutlet weak var DiaryImage: UIImageView!
    
    @IBAction func modify(_ sender: Any) {
        let addView = storyboard?.instantiateViewController(withIdentifier: "addViewController") as? AddViewController
        addView?.indexPath = indexPath!
        self.show(addView!, sender: self)
    }
    
    let diaryStore = Global.shared.diaryStore
    var indexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let indexPath = indexPath {
            let diaries = diaryStore.diaries[indexPath.row]
            DiaryTitle.text = diaries.title
            DiaryContent.text = diaries.content
            DiaryImage.image = UIImage(data: diaries.image!)
        }
    }

}
