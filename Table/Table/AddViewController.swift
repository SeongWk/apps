//
//  AddViewController.swift
//  Table
//
//  Created by seong_wook_lim on 2021/12/02.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var tfAddItem: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAdd(_ sender: UIButton) {
        items.append(tfAddItem.text!)
        itemsImagefile.append("6.jpeg")
        tfAddItem.text=""
        _  = navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
