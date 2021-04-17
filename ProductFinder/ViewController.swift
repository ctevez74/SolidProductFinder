//
//  ViewController.swift
//  ProductFinder
//
//  Created by Carlos Gabriel Tevez on 17/04/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginTapped(_ sender: UIButton) {
        let login = LoginMock()
        if let user = userTextfield.text, let password = passwordTextfield.text {
            login.login(user, password, completation: {
                result in
                if let result = result, result {
                    self.presentResults()
                }
                else {
                    self.presentError()
                }
            })
        }
    }

    func presentResults() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loggedInViewController = storyBoard.instantiateViewController(withIdentifier: "FinderTableViewController") as! FinderTableViewController
        self.navigationController?.pushViewController(loggedInViewController, animated: true)
    }

    func presentError() {
        let refreshAlert = UIAlertController(title: "Error", message: "Wrong username or password", preferredStyle: .alert)
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {
            (action: UIAlertAction!) in
        }))
        self.present(refreshAlert, animated: true, completion: nil)
    }

}
