//
//  DetailViewController.swift
//  Table
//
//  Created by seong_wook_lim on 2021/12/02.
//

import UIKit

class DetailViewController: UIViewController {
    var receiveitem=""
    @IBOutlet var lblitem: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblitem.text = receiveitem
        // Do any additional setup after loading the view.
    }
    
    func receiveitem(_ item:String)
    {
        receiveitem   = item
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
