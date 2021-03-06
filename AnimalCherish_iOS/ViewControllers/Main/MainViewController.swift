//
//  IntroViewController.swift
//  AnimalCherish_iOS
//
//  Created by Cagatay Ozata on 26.03.2020.
//  Copyright © 2020 CTIS_Team1. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIScrollViewDelegate {
    // MARK: IBOutlet

    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descLabel: UILabel!
    @IBOutlet var nextImage: UIImageView!
    @IBOutlet var backImage: UIImageView!
    @IBOutlet var mainImage: UIImageView!
    @IBOutlet var startButton: UIButton!

    // MARK: viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        // set current page and refresh
        pageControl.currentPage = 0
        changePage(pageControl)

        // enable interaction for arrow images
        nextImage.isUserInteractionEnabled = true
        backImage.isUserInteractionEnabled = true
    }

    // MARK: Navigation

    @IBAction func nextPage(_: Any) {
        if pageControl.currentPage != 2 {
            pageControl.currentPage = pageControl.currentPage + 1
            changePage(pageControl)
        }
    }

    // MARK: Prev Page

    @IBAction func prevPage(_: Any) {
        if pageControl.currentPage != 0 {
            pageControl.currentPage = pageControl.currentPage - 1
            changePage(pageControl)
        }
    }

    // MARK: Logout

    func logout(_: Any) {
        UserDefaults.standard.set(false, forKey: "status")
    }

    // MARK: UIPageControl

    @IBAction func changePage(_ sender: UIPageControl) {
        switch sender.currentPage {
        case 0:

            // set main image
            mainImage.image = UIImage(named: "fast")

            // set title and desc
            titleLabel.text! = "Hızlı İşlem"
            descLabel.text! = "Tamamen kullanışlı tasarım sayesinde işlemlerinizi hızlıca gerçekleştirebilirsiniz."

            // hide or not arrows
            backImage.isHidden = true
            nextImage.isHidden = false
            startButton.isHidden = true

        case 1:

            // set main image
            mainImage.image = UIImage(named: "trusted")

            // set title and desc
            titleLabel.text! = "Güvenilir"
            descLabel.text! = "Hayvanlarımızın sağlık raporları tamamen güvenli bir ortamda blockchain teknolojisi ile tutulmaktadır. Asla değiştirilemez ve silinemez."

            // hide or not arrows
            backImage.isHidden = false
            nextImage.isHidden = false
            startButton.isHidden = true

        case 2:

            // set main image
            mainImage.image = UIImage(named: "statics")

            // set title and desc
            titleLabel.text! = "İstatistik"
            descLabel.text! = "Hayvanların eklenmesi, sağlık raporları ve birçok işlemlerin istatistiki verilerini sistemimizde bulabilirsiniz."

            // hide or not arrows
            backImage.isHidden = false
            nextImage.isHidden = true
            startButton.isHidden = false

        default:
            break
        }
    }
}
