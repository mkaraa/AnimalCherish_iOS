//
//  DetailVetViewController.swift
//  AnimalCherish_iOS
//
//  Created by Cagatay Ozata on 10.03.2020.
//  Copyright © 2020 CTIS_Team1. All rights reserved.
//

import Alamofire
import SwiftyJSON
import UIKit

class DetailVetViewController: UIViewController {
    // MARK: IBOutlet

    @IBOutlet var nameTF: UITextField!
    @IBOutlet var birthDateTF: UITextField!
    @IBOutlet var educationInfoTF: UITextField!
    @IBOutlet var cityTF: UITextField!
    @IBOutlet var stateTF: UITextField!
    @IBOutlet var phoneTF: UITextField!
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var diplomaNoTF: UITextField!
    @IBOutlet var sicilNoTF: UITextField!
    @IBOutlet var addressTF: UITextField!
    @IBOutlet var detailTF: UITextField!

    // MARK: Variables

    let apiUrl = Configuration.apiUrl + "/api/v1/vet/getall"

    var selectedId: String?

    // MARK: viewDownload

    override func viewDidLoad() {
        super.viewDidLoad()

        // TextField Style
        nameTF.setTitleAndIcon(title: "İsim Soyad", icon: "person", systemIcon: true)
        educationInfoTF.setTitleAndIcon(title: "Eğitim Bilgisi", icon: "info", systemIcon: true)
        cityTF.setTitleAndIcon(title: "Şehir", icon: "location", systemIcon: true)
        stateTF.setTitleAndIcon(title: "İlçe", icon: "location", systemIcon: true)
        addressTF.setTitleAndIcon(title: "Klinik Bilgisi", icon: "location", systemIcon: true)
        phoneTF.setTitleAndIcon(title: "Telefon Numarası", icon: "phone", systemIcon: true)
        emailTF.setTitleAndIcon(title: "Mail Adresi", icon: "envelope", systemIcon: true)
        birthDateTF.setTitleAndIcon(title: "Kuruluş Tarihi", icon: "calendar", systemIcon: true)
        detailTF.setTitleAndIcon(title: "Detay", icon: "doc.text", systemIcon: true)
        diplomaNoTF.setTitleAndIcon(title: "Diploma No", icon: "number.circle", systemIcon: true)
        sicilNoTF.setTitleAndIcon(title: "Sicil No", icon: "number.circle", systemIcon: true)

        disableEditing()

        // check nil
        if selectedId != nil {
            getVetDetail()
        } else {
            Alert.showAlert(message: "Hata Oluştu! Lütfen geri dönünüz!", vc: self)
        }
    }

    // MARK: GET request and Prepare Selected Data

    func getVetDetail() {
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
                        let education = item["education"].stringValue
                        let city = item["city"].stringValue
                        let state = item["ilce"].stringValue
                        let phone = item["phone"].stringValue
                        let email = item["email"].stringValue
                        let birthday = item["birthdate"].stringValue
                        let address = item["clinic"].stringValue
                        var diplomaNo = item["diplomaNo"].stringValue
                        var sicilNo = item["sicilNo"].stringValue
                        let detail = item["details"].stringValue

                        self.nameTF.text! = name
                        self.educationInfoTF.text! = education
                        self.birthDateTF.text! = birthday
                        self.cityTF.text! = city
                        self.stateTF.text! = state
                        self.phoneTF.text! = phone
                        self.emailTF.text! = email
                        self.addressTF.text! = address
                        self.diplomaNoTF.text! = diplomaNo
                        self.sicilNoTF.text! = sicilNo
                        self.detailTF.text! = detail
                    }

                    i = i + 1
                }

            case .failure:
                Alert.showAlert(message: "Bir hata oluştu. Veteriner Hekim Listesi Getiriemedi!", vc: self)
            }
        }
    }

    // MARK: prepare to send selectedId

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if segue.identifier == "goToEditVetViewController" {
            let editVetController = segue.destination as? EditVetViewController
            if let tempController = editVetController {
                tempController.selectedId = selectedId
            }
        }
    }

    // MARK: disableEditing

    func disableEditing() {
        nameTF.isUserInteractionEnabled = false
        educationInfoTF.isUserInteractionEnabled = false
        cityTF.isUserInteractionEnabled = false
        stateTF.isUserInteractionEnabled = false
        phoneTF.isUserInteractionEnabled = false
        emailTF.isUserInteractionEnabled = false
        birthDateTF.isUserInteractionEnabled = false
        addressTF.isUserInteractionEnabled = false
        diplomaNoTF.isUserInteractionEnabled = false
        sicilNoTF.isUserInteractionEnabled = false
        detailTF.isUserInteractionEnabled = false
    }
}
