//
//  DetailShelterViewController.swift
//  AnimalCherish_iOS
//
//  Created by Cagatay Ozata on 10.03.2020.
//  Copyright © 2020 CTIS_Team1. All rights reserved.
//

import Alamofire
import SwiftyJSON
import UIKit

class DetailShelterViewController: UIViewController {
    // MARK: IBOutlet

    @IBOutlet var nameTF: UITextField!
    @IBOutlet var addressTF: UITextField!
    @IBOutlet var capacityTF: UITextField!
    @IBOutlet var detailTF: UITextField!
    @IBOutlet var phoneTF: UITextField!
    @IBOutlet var workerCountTF: UITextField!
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var establishDateTF: UITextField!

    // MARK: Variables

    let apiUrl = Configuration.apiUrl + "/api/v1/shelter/getall"

    var selectedId: String?

    // MARK: viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        // TextField Style
        nameTF.setTitleAndIcon(title: "İsim", icon: "person", systemIcon: true)
        addressTF.setTitleAndIcon(title: "Adres", icon: "location", systemIcon: true)
        capacityTF.setTitleAndIcon(title: "Kapsasite", icon: "number", systemIcon: true)
        detailTF.setTitleAndIcon(title: "Detay", icon: "doc.text", systemIcon: true)
        phoneTF.setTitleAndIcon(title: "Telefon Numarası", icon: "phone", systemIcon: true)
        emailTF.setTitleAndIcon(title: "Mail Adresi", icon: "envelope", systemIcon: true)
        establishDateTF.setTitleAndIcon(title: "Kuruluş Tarihi", icon: "calendar", systemIcon: true)
        workerCountTF.setTitleAndIcon(title: "Çalışan Sayısı", icon: "person.2", systemIcon: true)

        disableEditing()

        // check nil
        if selectedId != nil {
            getShelterDetail()
        } else {
            Alert.showAlert(message: "Hata Oluştu! Lütfen geri dönünüz!", vc: self)
        }
    }

    // MARK: GET request and Prepare Selected Data

    func getShelterDetail() {
        AF.request(apiUrl, method: .get).responseJSON { myresponse in

            // check result is success or failure
            switch myresponse.result {
            case .success:

                // GET data
                let myresult = try? JSON(data: myresponse.data!)
                let resultArray = myresult!

                //
                var i = 0
                for item in resultArray.arrayValue {
                    if item["id"].stringValue == self.selectedId {
                        let name = item["name"].stringValue
                        let establish = item["birthdate"].stringValue
                        let address = item["address"].stringValue
                        let phone = item["phone"].stringValue
                        let email = item["email"].stringValue
                        let detail = item["details"].stringValue
                        let capacity = item["capacity"].stringValue
                        let workerCount = item["workerCount"].stringValue

                        self.nameTF.text! = name
                        self.establishDateTF.text! = establish
                        self.addressTF.text! = address
                        self.detailTF.text! = detail
                        self.phoneTF.text! = phone
                        self.emailTF.text! = email
                        self.capacityTF.text! = capacity
                        self.workerCountTF.text! = workerCount
                    }

                    i = i + 1
                }

            case .failure:
                Alert.showAlert(message: "Bir hata oluştu. Veteriner Hekim Listesi Getiriemedi!", vc: self)
            }
        }
    }

    // MARK: prepare to send selectedId to EditShelterViewController

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if segue.identifier == "goToEditShelterView" {
            let editShelterController = segue.destination as? EditShelterViewController
            if let tempController = editShelterController {
                tempController.selectedId = selectedId
            }
        }
    }

    // MARK: disableEditing

    func disableEditing() {
        nameTF.isUserInteractionEnabled = false
        establishDateTF.isUserInteractionEnabled = false
        addressTF.isUserInteractionEnabled = false
        capacityTF.isUserInteractionEnabled = false
        detailTF.isUserInteractionEnabled = false
        phoneTF.isUserInteractionEnabled = false
        emailTF.isUserInteractionEnabled = false
        workerCountTF.isUserInteractionEnabled = false
    }
}
