//
//  DetailViewController.swift
//  MobileTest
//
//  Created by Pias on 4/22/19.
//  Copyright © 2019 Pias. All rights reserved.
//

import UIKit
import MessageUI
import MapKit

class DetailViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    var resourceViewModel: ResourceViewModel?
    
    var scrollView: UIScrollView?
    var titleLabel: UILabel?
    var contactInformationLabel: UILabel?
    var contactInformationView: UIView?
    var phoneNumberTitleLabel: UILabel?
    var phoneNumber: UIButton?
    var tollFreeNumberTitleLabel: UILabel?
    var tollFreeNumber: UIButton?
    var faxNumberTitleLabel: UILabel?
    var faxNumber: UIButton?
    var emailAddressTitleLabel: UILabel?
    var emailAddress: UIButton?
    var websiteTitleLabel: UILabel?
    var website: UIButton?
    var addressTitleLabel: UILabel?
    var addressView: UIView?
    var address: UILabel?
    var addressText: UILabel?
    var addressButton : UIButton?
    var socialMediaTitleLabel: UILabel?
    var socialMediaView: UIView?
    var facebookButton: UIButton?
    var twitterButton: UIButton?
    var youtubeButton: UIButton?
    var bizHoursTitleLabel: UILabel?
    var bizHoursView: UIView?
    var sundayTextLabel: UILabel?
    var sundayHoursLabel: UILabel?
    var mondayTextLabel: UILabel?
    var mondayHoursLabel: UILabel?
    var openingHours: UILabel?
    var opneingHours2: UILabel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Resource Details"
        self.view.backgroundColor = .white
        self.scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        self.scrollView?.contentSize = CGSize(width: self.view.frame.size.width, height: 3000)
        self.scrollView?.backgroundColor = UIColor(red: 244/255.0, green: 243/255.0, blue: 243/255.0, alpha: 1.0)
        self.view.addSubview(self.scrollView!)
        self.setUpViews()
        self.updateUI()

        // Do any additional setup after loading the view.
    }
    
    func setUpViews() {
        let width = self.view.bounds.size.width
        
        self.titleLabel = UILabel(frame: CGRect(x: 0, y: 100, width: self.view.bounds.size.width, height: 50))
        self.titleLabel?.text = self.resourceViewModel?.title
        self.titleLabel?.textColor = .black
        self.titleLabel?.textAlignment = .center
        self.scrollView?.addSubview(self.titleLabel!)
        
        self.contactInformationLabel = UILabel(frame: CGRect(x: 0, y: 151, width: self.view.bounds.size.width, height: 50))
        self.contactInformationLabel?.textAlignment = .center
        self.contactInformationLabel?.text = "Contact Information"
        self.scrollView?.addSubview(self.contactInformationLabel!)
        
        self.contactInformationView = UIView(frame: CGRect(x: 10, y: 202, width: self.view.bounds.size.width - 20, height: 420))
        self.contactInformationView?.backgroundColor = .white
        self.scrollView?.addSubview(self.contactInformationView!)
        
        self.phoneNumberTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: 30))
        self.phoneNumberTitleLabel?.text = "PHONE NUMBER"
        self.phoneNumberTitleLabel?.textColor = .red
        self.contactInformationView?.addSubview(self.phoneNumberTitleLabel!)
        
        self.phoneNumber = UIButton(frame: CGRect(x: 0, y: 31, width: width, height: 50))
        self.phoneNumber?.setTitleColor(.black, for: .normal)
        self.phoneNumber?.addTarget(self, action: #selector(phoneNumberTapped), for: .touchUpInside)
        self.phoneNumber?.contentHorizontalAlignment = .left
        self.contactInformationView?.addSubview(self.phoneNumber!)
        
        self.tollFreeNumberTitleLabel = UILabel(frame: CGRect(x: 0, y: 82, width: width, height: 30))
        self.tollFreeNumberTitleLabel?.text = "TOLL-FREE NUMBER"
        self.tollFreeNumberTitleLabel?.textColor = .red
        self.contactInformationView?.addSubview(self.tollFreeNumberTitleLabel!)
        
        self.tollFreeNumber = UIButton(frame: CGRect(x: 0, y: 113, width: width, height: 50))
        self.tollFreeNumber?.setTitleColor(.black, for: .normal)
        self.tollFreeNumber?.contentHorizontalAlignment = .left
        self.contactInformationView?.addSubview(self.tollFreeNumber!)
        
        self.faxNumberTitleLabel = UILabel(frame: CGRect(x: 0, y: 164, width: width, height: 30))
        self.faxNumberTitleLabel?.text = "FAX NUMBER"
        self.faxNumberTitleLabel?.textColor = .red
        self.contactInformationView?.addSubview(self.faxNumberTitleLabel!)
        
        self.faxNumber = UIButton(frame: CGRect(x: 0, y: 195, width: width, height: 50))
        self.faxNumber?.setTitleColor(.black, for: .normal)
        self.faxNumber?.contentHorizontalAlignment = .left
        self.contactInformationView?.addSubview(self.faxNumber!)
        
        self.emailAddressTitleLabel = UILabel(frame: CGRect(x: 0, y: 246, width: width, height: 30))
        self.emailAddressTitleLabel?.text = "EMAIL ADDRESS"
        self.emailAddressTitleLabel?.textColor = .red
        self.contactInformationView?.addSubview(self.emailAddressTitleLabel!)
        
        self.emailAddress = UIButton(frame: CGRect(x: 0, y: 277, width: width, height: 50))
        self.emailAddress?.setTitleColor(.black, for: .normal)
        self.emailAddress?.addTarget(self, action: #selector(emailAddressTapped), for: .touchUpInside)
        self.emailAddress?.contentHorizontalAlignment = .left


        self.contactInformationView?.addSubview(self.emailAddress!)

        
        self.websiteTitleLabel = UILabel(frame: CGRect(x: 0, y: 328, width: width, height: 30))
        self.websiteTitleLabel?.text = "WEBSITE"
        self.websiteTitleLabel?.textColor = .red
        self.contactInformationView?.addSubview(self.websiteTitleLabel!)
        
        self.website = UIButton(frame: CGRect(x: 0, y: 369, width: width, height: 50))
        self.website?.setTitleColor(.black, for: .normal)
        self.website?.addTarget(self, action: #selector(websiteTapped), for: .touchUpInside)
        self.website?.contentHorizontalAlignment = .left

        self.contactInformationView?.addSubview(self.website!)
        
        self.addressTitleLabel = UILabel(frame: CGRect(x: 0, y: 650, width: width, height: 30))
        self.addressTitleLabel?.text = "ADDRESS"
        self.addressTitleLabel?.textAlignment = .center
        self.scrollView?.addSubview(self.addressTitleLabel!)
        
        self.addressView = UIView(frame: CGRect(x: 10, y: 700, width: width-20, height: 130))
        self.addressView?.backgroundColor = .white
        self.scrollView?.addSubview(self.addressView!)

        self.address = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: 30))
        self.address?.text = "ADDRESS"
        self.address?.textColor = .red
        self.addressView?.addSubview(self.address!)

        self.addressText = UILabel(frame: CGRect(x: 0, y: 31, width: width/2, height: 100))
        self.addressText?.numberOfLines = 0
        self.addressText?.lineBreakMode = .byWordWrapping
        self.addressView?.addSubview(self.addressText!)

        self.addressButton = UIButton(frame: CGRect(x: width/2, y: 31, width: width/2, height: 100))
        self.addressButton?.setTitle("Map", for: .normal)
        self.addressButton?.setTitleColor(.red, for: .normal)
        self.addressButton?.addTarget(self, action: #selector(addressButtonTapped), for: .touchUpInside)

        self.addressView?.addSubview(self.addressButton!)
        
        self.socialMediaTitleLabel = UILabel(frame: CGRect(x: 0, y: 920, width: width, height: 30))
        self.socialMediaTitleLabel?.text = "Social Media"
        self.socialMediaTitleLabel?.textAlignment = .center

        self.scrollView?.addSubview(self.socialMediaTitleLabel!)
        
        
        self.socialMediaView = UIView(frame: CGRect(x: 10, y: 960, width: width - 20, height: 100))
        self.socialMediaView?.backgroundColor = .white
        self.scrollView?.addSubview(self.socialMediaView!)
        
        let widthforbutton = width/3
        
        self.facebookButton = UIButton(frame: CGRect(x: 0, y: 0, width: widthforbutton, height: 100))
        self.facebookButton?.setTitle("facebook", for: .normal)
        self.facebookButton?.setTitleColor(.black, for: .normal)
        self.facebookButton?.addTarget(self, action: #selector(facebookButtonTapped), for: .touchUpInside)

        self.socialMediaView?.addSubview(self.facebookButton!)
        
        self.twitterButton = UIButton(frame: CGRect(x: widthforbutton, y: 0, width: widthforbutton, height: 100))
        self.twitterButton?.setTitle("twitter", for: .normal)
        self.twitterButton?.setTitleColor(.black, for: .normal)
        self.twitterButton?.addTarget(self, action: #selector(twitterButtonTapped), for: .touchUpInside)

        self.socialMediaView?.addSubview(self.twitterButton!)
        
        self.youtubeButton = UIButton(frame: CGRect(x: 2*widthforbutton, y: 0, width: widthforbutton, height: 100))
        self.youtubeButton?.setTitle("youtube", for: .normal)
        self.youtubeButton?.setTitleColor(.black, for: .normal)
        self.youtubeButton?.addTarget(self, action: #selector(youtubeButtonTapped), for: .touchUpInside)

        self.socialMediaView?.addSubview(self.youtubeButton!)
        
        self.bizHoursTitleLabel = UILabel(frame: CGRect(x: 0, y: 1100, width: width, height: 30))
        self.bizHoursTitleLabel?.text = "BUSINESS HOURS"
        self.bizHoursTitleLabel?.textAlignment = .center
        self.scrollView?.addSubview(self.bizHoursTitleLabel!)
        
        
        self.bizHoursView = UIView(frame: CGRect(x: 0, y: 1150, width: width, height: 100))
        self.bizHoursView?.backgroundColor = .white
        self.scrollView?.addSubview(self.bizHoursView!)
        
        let titleWidth = width - 200
        self.sundayTextLabel = UILabel(frame: CGRect(x: 0, y: 0, width: titleWidth, height: 50))
        self.sundayTextLabel?.text = "Sunday"
        self.bizHoursView?.addSubview(self.sundayTextLabel!)
    
        self.sundayHoursLabel = UILabel(frame: CGRect(x: titleWidth, y: 0, width: 200, height: 50))
        self.bizHoursView?.addSubview(self.sundayHoursLabel!)
        
        self.mondayTextLabel = UILabel(frame: CGRect(x: 0, y: 50, width: titleWidth, height: 50))
        self.mondayTextLabel?.text = "Monday"
        self.bizHoursView?.addSubview(self.mondayTextLabel!)
        
        self.mondayHoursLabel = UILabel(frame: CGRect(x: titleWidth, y: 50, width: 200, height: 50))
        self.bizHoursView?.addSubview(self.mondayHoursLabel!)
        
    }
    
    func updateUI() {
        self.titleLabel?.text = self.resourceViewModel?.title
        self.phoneNumber?.setTitle(self.resourceViewModel?.phoneNumber, for: .normal)
        self.tollFreeNumber?.setTitle(self.resourceViewModel?.tollFreeNumber, for: .normal)
        self.faxNumber?.setTitle(self.resourceViewModel?.faxNumber, for: .normal)
        self.emailAddress?.setTitle(self.resourceViewModel?.emailAddress, for: .normal)
        self.website?.setTitle(self.resourceViewModel?.website, for: .normal)
        self.addressText?.text = self.resourceViewModel?.address
        self.sundayHoursLabel?.text = self.resourceViewModel?.sundayBizHours
        self.mondayHoursLabel?.text = self.resourceViewModel?.mondayBizHours



    }
    
    @objc func phoneNumberTapped(){
        print("phoen number tapped")
        guard let phnNumber = self.resourceViewModel?.phoneNumber else { return  }
        let number = String(format: "TELL://%@", phnNumber)
        let url: NSURL = URL(string: number)! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
    @objc func emailAddressTapped(){
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        
        let emailAddress = self.resourceViewModel?.emailAddress
        
        composeVC.setToRecipients([emailAddress!])
        composeVC.setSubject("subject")
        composeVC.setMessageBody("message content", isHTML: false)
        
        self.present(composeVC, animated: true, completion: nil)
        
    }
    
    @objc func websiteTapped(){
        guard  let url = URL(string: self.resourceViewModel!.website) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @objc func addressButtonTapped(){
        let lat = self.resourceViewModel?.latitude
        let lng = self.resourceViewModel?.longitude
        let coordinate = CLLocationCoordinate2DMake(Double(lat!) as! CLLocationDegrees,Double(lng!) as! CLLocationDegrees)
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
        mapItem.name = "Target location"
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])

    }
    
    @objc func facebookButtonTapped(){
        guard  let url = URL(string: self.resourceViewModel!.facebookLink) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @objc func twitterButtonTapped(){
        guard  let url = URL(string: self.resourceViewModel!.twitterLink) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
    }
    
    @objc func youtubeButtonTapped(){
        guard  let url = URL(string: self.resourceViewModel!.youtubeLink) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
 

}
