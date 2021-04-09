//
//  UserStore.swift
//  Post
//
//  Created by Leonardo Mendez on 4/8/21.
//

import UIKit
import Alamofire
import ObjectMapper
import RealmSwift

struct UserStore {

    func fetchUserInformation(id: String, _ completion: @escaping(_ post: User?) -> Void) {
        guard let url = URL(string: "\(DataService.sharedInstance.baseUrl)/users/\(id)") else { return }
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                if let value = value as? [String: Any] {
                    DispatchQueue.main.async {
                        guard let user = Mapper<User>().map(JSON: value) else { return completion(nil) }
                        let defaults = UserDefaults.standard
                        defaults.removeObject(forKey: Default.Key.user.rawValue)
                        Default.save(user: user.toJSON())
                        completion(user)
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                }
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
    }
    
}
