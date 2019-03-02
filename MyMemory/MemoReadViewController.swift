//
//  MemoReadViewController.swift
//  MyMemory
//
//  Created by Wonik on 02/03/2019.
//  Copyright © 2019 Wonik. All rights reserved.
//

import UIKit

class MemoReadViewController: UIViewController {

    //콘텐츠를 저장하는 변수
    var param : MemoData?
    @IBOutlet weak var lbSubject: UILabel!
    @IBOutlet weak var lbContents: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //제목과 내용, 이미지를 출력
        self.lbSubject.text = param?.title
        self.lbContents.text = param?.contents
        self.img.image = param?.image
        
        //날짜 포맷 변환
        let formatter = DateFormatter()
        formatter.dateFormat = "dd일 HH:mm분에 작성됨"
        let dateString = formatter.string(from: (param?.regdate)!)
        self.navigationItem.title = dateString
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
