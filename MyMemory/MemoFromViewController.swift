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
        //내용을 입력하지 않았을 경우, 경고표시
        guard self.txtContents.text.isEmpty == false else {
            let alert  = UIAlertController(title: nil, message: "내용을 입력하세요", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            
            self.present(alert, animated: true)
                
            return
        }

        
        //MemoData 객체를 생성하고, 데이터를 담음
        let data = MemoData()
        
        data.title = self.subject //제목
        data.contents = self.txtContents.text
        data.image = self.imgView.image
        data.regdate = Date() //현재 시간
        
        //앱 델리게이트 객체를 읽어온 후, memolist 배열에 MemData 객체 추가
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memolist.append(data)
        
        //작성폼 화면을 종료하고, 이전 화면으로 되돌아간다.
        _ = self.navigationController?.popViewController(animated: true)
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
