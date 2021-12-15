//
//  ParisExpoInformationViewController.swift
//  Expo1900
//
//  Created by 예거 on 2021/12/08.
//

import UIKit

class ParisExpoInformationViewController: UIViewController {
    private let parisExpoPoster = "poster"
    private let koreanFlag = "flag"
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var parisExpoPosterImage: UIImageView!
    @IBOutlet private weak var visitorLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private var koreanFlagImage: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
        setImages()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    private func setImages() {
        parisExpoPosterImage.image = UIImage(named: parisExpoPoster)
        koreanFlagImage.forEach({ image in
            image.image = UIImage(named: koreanFlag)
        })
    }
    
    private func setLabels() {
        let result = JSONParser<ParisExpoInformation>.decode(from: JSONFileName.parisExpoInformation)

        titleLabel.text = result?.formattedTitle
        visitorLabel.text = result?.formattedVisitors
        locationLabel.text = result?.formattedLocation
        durationLabel.text = result?.formattedDuration
        descriptionLabel.text = result?.description
    }
}
