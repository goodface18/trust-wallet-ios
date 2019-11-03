// Copyright DApps Platform Inc. All rights reserved.

import UIKit


protocol WalletConditionViewControllerDelegate: class {
    
    func didPressContinueWallet(in viewController: WalletConditionViewController)
}



final class ConditionWalletConditionViewController: WalletConditionViewController {
    
}

class WalletConditionViewController: UIViewController {

    weak var delegate: WalletConditionViewControllerDelegate?
    
    let titleLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        label.text = "Back up your wallet now!"
        label.textColor = .black
        label.textAlignment = .center
        label.font = label.font.withSize(25.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleLabel1 : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        label.text = "In the next step you will see 12 words that"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = label.font.withSize(18.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleLabel2 : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        label.text = "allows you to recover a wallet."
        label.textColor = .gray
        label.textAlignment = .center
        label.font = label.font.withSize(18.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageView : UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        image.image = UIImage(named: "icon_backup")
        image.sizeToFit()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let titleLabel3 : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        label.text = "* Do not upload the words online nor share them with anyone,"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = label.font.withSize(13.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleLabel4 : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        label.text = "store them safely."
        label.textColor = .gray
        label.textAlignment = .center
        label.font = label.font.withSize(13.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleLabel5 : UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        label.text = "I understand that if I lose my recovery words, I will not be able to access my wallet."
        label.textColor = .darkGray
        label.textAlignment = .left
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 2
        label.font = label.font.withSize(13.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let checkButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "btn_check_off"), for: .normal)
        return button
    }()
    
    
    let continueWalletButton: UIButton = {
        let button = Button(size: .normal, style: .solid)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("CONTINUE", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold)
        button.backgroundColor = Colors.darkBlue
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(titleLabel1)
        self.view.addSubview(titleLabel2)
        self.view.addSubview(imageView)
        self.view.addSubview(titleLabel3)
        self.view.addSubview(titleLabel4)
        self.view.addSubview(checkButton)
        self.view.addSubview(titleLabel5)
        
        self.view.addSubview(continueWalletButton)
        
        titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120).isActive = true
        
        
        titleLabel1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        titleLabel1.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 40).isActive = true
        
        titleLabel2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        titleLabel2.topAnchor.constraint(equalTo: titleLabel1.topAnchor, constant: 25).isActive = true
        
        imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        titleLabel3.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        titleLabel3.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 85).isActive = true
        
        titleLabel4.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        titleLabel4.topAnchor.constraint(equalTo: titleLabel3.topAnchor, constant: 15).isActive = true
        
        
        checkButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15).isActive = true
        checkButton.topAnchor.constraint(equalTo: titleLabel4.bottomAnchor, constant: 30).isActive = true
        checkButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        checkButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        checkButton.addTarget(self, action: #selector(changeButton), for: .touchUpInside)
        
        titleLabel5.leftAnchor.constraint(equalTo: checkButton.rightAnchor, constant: 5).isActive = true
        titleLabel5.topAnchor.constraint(equalTo: titleLabel4.bottomAnchor, constant: 35).isActive = true
        titleLabel5.widthAnchor.constraint(equalToConstant: 350).isActive = true
        
        
        continueWalletButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        continueWalletButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        continueWalletButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -55).isActive = true
        
        continueWalletButton.isEnabled = false
        continueWalletButton.addTarget(self, action: #selector(continueWallet), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }

    @IBAction func continueWallet() {
        
        delegate?.didPressContinueWallet(in: self)
    }
    
    @IBAction func changeButton() {
        
        DispatchQueue.main.async {
            
            if self.continueWalletButton.isEnabled == false {
                
                self.checkButton.setBackgroundImage(UIImage(named: "btn_check_on"), for: .normal)
                self.continueWalletButton.isEnabled = true
                
            } else {
                
                self.checkButton.setBackgroundImage(UIImage(named: "btn_check_off"), for: .normal)
                self.continueWalletButton.isEnabled = false
            }
        }        
    }
}
