import UIKit

final class ItemViewController: UIViewController {

    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    var content: Content?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
