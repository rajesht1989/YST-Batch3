//
//  WithdrawalViewController.swift
//  Accquipo
//
//  Created by apple on 05/05/22.
//

import UIKit

class WithdrawalViewController: UIViewController {
    
    @IBOutlet var bankButton: UIButton!
    @IBOutlet var cashButton: UIButton!
    
    var pageViewController: UIPageViewController!
    var bankViewController: BankViewController!
    var cashViewController: CashViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        pageViewController = children.first as? UIPageViewController
        bankViewController = storyboard?.instantiateViewController(withIdentifier: "BankViewController") as? BankViewController
        cashViewController = storyboard?.instantiateViewController(withIdentifier: "CashViewController") as? CashViewController
        buttonAction(bankButton)
        
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        if sender == bankButton {
            bankButton.configuration?.background.image = UIImage(named: "bg_button")
            cashButton.configuration?.background.image = nil
            pageViewController.setViewControllers([bankViewController], direction: .reverse, animated: true)
        } else {
            cashButton.configuration?.background.image = UIImage(named: "bg_button")
            bankButton.configuration?.background.image = nil
            pageViewController.setViewControllers([cashViewController], direction: .forward, animated: true)

        }
        
    }
}
