//
//  fetchName.swift
//  NeuroPilot
//
//  Created by Kakha Sepashvili on 26.09.21.
//

import Foundation
import FirebaseAuth
import Firebase
import GoogleSignIn

let emailAuth =  "\(Auth.auth().currentUser?.email ?? "")"
let signInEmail =  "\(GIDSignIn.sharedInstance().currentUser?.profile.email ?? "")"

func fetchUserName(myLabel: UILabel) {
    let withoutGmail = (checkIfEmpty(email: emailAuth, signIn: signInEmail).replacingOccurrences(of: "@gmail.com", with: ""))
    let withoutDot = withoutGmail.replacingOccurrences(of: ".", with: "")
        Database.database().reference().child(withoutDot.lowercased()).observeSingleEvent(of: .value, with: { DataSnapshot in
        if DataSnapshot.exists() {
            let data =  DataSnapshot.value as? [String: Any]
            let name = data?["Name"] as? String
            myLabel.text = name
        }
    })
}

func writeData(email : String, name: String) {
    let object: [String: Any] = [
        "Email" : email,
        "Name" : name
    ]
    let withoutGmail = email.replacingOccurrences(of: "@gmail.com", with: "")
    let withoutDot = withoutGmail.replacingOccurrences(of: ".", with: "")
    let filteredEmail = withoutDot
        Database.database().reference().child("\(filteredEmail.lowercased())").setValue(object)
}
func changeData(newName: String) {
    let object: [String: Any] = [
        "Name": newName
    ]
    let withoutGmail = (checkIfEmpty(email: emailAuth, signIn: signInEmail).replacingOccurrences(of: "@gmail.com", with: ""))
    let withoutDot = withoutGmail.replacingOccurrences(of: ".", with: "")
    Database.database().reference().child(withoutDot.lowercased()).updateChildValues(object)
    }
func checkIfEmpty(email: String, signIn: String) -> String {
    var userEmail = ""
    if email != "" {
        userEmail = email    } else {
        userEmail = signIn
    }
    return userEmail
}


