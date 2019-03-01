//
//  MemoFromViewController.swift
//  MyMemory
//
//  Created by Wonik on 01/03/2019.
//  Copyright © 2019 Wonik. All rights reserved.
//

import UIKit

class MemoFromViewController: UIViewController {

    @IBOutlet weak var txtContents: UITextView!
    @IBOutlet weak var imgView: UIImageView!
    
    
    var subject: String! //메모 내용의 첫줄을 제목으로 사용하기 위한 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //텍스트뷰 델리게이트
        self.txtContents.delegate = self
    }
    
    
    @IBAction func btnSave(_ sender: Any) {
        
    }
    
    @IBAction func btnPick(_ sender: Any) {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true //편집과정을 거침
        
        //이미지 피커 화면을 표시
        self.present(picker, animated: false)
        
    }

}

//MARK: 텍스트뷰의 델리게이트
extension MemoFromViewController: UITextViewDelegate{
    
    func textViewDidChange(_ textView: UITextView) {
        //내용의 최대 15자리까지를 읽어 subject 변수에 저장한다.
        if let contents = textView.text{
            let length =  (contents.count > 15) ? 15 : contents.count
            
            
            self.subject = String(contents.prefix(length))
            
            //네비게이션 타이틀 표시
            self.navigationItem.title = subject
        }
        
        
    }
    
}

//MARK: 이미지 선택
extension MemoFromViewController: UIImagePickerControllerDelegate{
    
    //이미지 선택을 완료했을 때 호출되는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //선택된 이미지를 미리보기에 표시
        self.imgView.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        
        //이미지 피커 컨트롤러를 닫음
        picker.dismiss(animated: false, completion: nil)
    }
    
}

//MARK: 네비게이션 관련
extension MemoFromViewController: UINavigationControllerDelegate{
    
}
