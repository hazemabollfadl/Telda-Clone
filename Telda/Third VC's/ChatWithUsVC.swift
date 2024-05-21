//
//  ChatWithUsVC.swift
//  Telda
//
//  Created by Hazem Abou El Fadl on 19/04/2024.
//

import UIKit

class ChatWithUsVC: UIViewController {
    
    @IBOutlet var ChatWithUsTableView: UITableView!
    @IBOutlet var MessageTextField: UITextField!
    
    var message:[Message]=[
        Message(body: "Hi"),
        Message (body: "I need techinal support"),
        Message(body: "I can't send money to a friends of mine")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ChatWithUsTableView.dataSource=self
        ChatWithUsTableView.delegate=self
        MessageTextField.delegate=self
        
        let nib=UINib(nibName: "ChatWithUsCell", bundle: .main)
        ChatWithUsTableView.register(nib, forCellReuseIdentifier: "ChatWithUsCell")
        
        ChatWithUsTableView.rowHeight = UITableView.automaticDimension
        
        
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        
        if MessageTextField.text?.isEmpty == false{
            message.append(Message(body: MessageTextField.text!))
            ChatWithUsTableView.reloadData()
            MessageTextField.text=""
            MessageTextField.resignFirstResponder()
        }else{
            print("no message entered")
        }
        
    }
}

//MARK: - UITableViewDelegate
extension ChatWithUsVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message=message[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatWithUsCell", for: indexPath) as! ChatWithUsCell
        
        cell.BigLabel.text = message.body
        cell.LeftImage.isHidden=true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }
    
    
}

//MARK: - UITableViewDelegate
extension ChatWithUsVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
}

//MARK: - UITableViewDelegate
extension ChatWithUsVC:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("editing ended")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
}
