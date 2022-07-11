//
//  UserRequest.swift
//  Museum
//
//  Created by weezy on 4/18/21.
//

import Foundation
import Alamofire

class UserRequest: NSObject, ObservableObject {
    @Published var users:[user] = [user]()
    override init() {
        super.init()
        dateRequest()
    }
    
    func validateHTTPS(){
     
        let manager = SessionManager.default
        manager.delegate.sessionDidReceiveChallenge = { session, challenge in
            var disposition: URLSession.AuthChallengeDisposition = .performDefaultHandling
            var credential: URLCredential?
            
            if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
                disposition = URLSession.AuthChallengeDisposition.useCredential
                credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
            } else {
                if challenge.previousFailureCount > 0 {
                    disposition = .cancelAuthenticationChallenge
                } else {
                    credential = manager.session.configuration.urlCredentialStorage?.defaultCredential(for: challenge.protectionSpace)
                    
                    if credential != nil {
                        disposition = .useCredential
                    }
                }
            }
            return (disposition, credential)
        }
    }

    func dateRequest(){
        validateHTTPS()
        let urlString = "https://10.28.148.205:8080/users"
        Alamofire.request(urlString).responseJSON { response in
            guard let data = response.data else { return }
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        self.users = try decoder.decode([user].self, from: data)
                        
                    } catch let error {
                        print("\(error)")
                    }
                }
    }
    
    func validateUser(username: String, password: String) -> Bool {
        for i in 0..<users.count{
            if username == users[i].username && password == users[i].password{
                return true
            }
        }
        return false
    }
    
    func registerUser(registerum: String, registerpwd: String){
        var userParameter = user()
        userParameter.username = registerum
        userParameter.password = registerpwd
        let encoder = JSONEncoder()
        let data = try! encoder.encode(userParameter)
        validateHTTPS()
        let urlString = "https://10.28.148.205:8080/register"
        var request = URLRequest(url: URL(string:urlString)!)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = data
        Alamofire.request(request).responseJSON {
            response in
            print(response)
        }
        
    }
}

