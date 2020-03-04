//
//  Store.swift
//  SilofitExam
//
//  Created by Dan Nan on 2020-03-02.
//  Copyright © 2020 Dan Nan. All rights reserved.
//

import Foundation
import Firebase

class Store {

    var ref: DatabaseReference!

    init() {
         ref = Database.database().reference()
    }

    func getListOfLocation(completion: @escaping (Result<[Space], StoreError>) -> Void) {
        ref.child("spaces").observeSingleEvent(of: .value, with: { (snapshot) in
            guard let value = snapshot.value as? NSDictionary else {
                    completion(.failure(.invalidResponsePayload))
                return
            }
            do {
                let spacesDictionary = value.allValues
                let data = try JSONSerialization.data(withJSONObject: spacesDictionary, options: .prettyPrinted)
                let spaces = try JSONDecoder().decode([Space].self, from: data)
                completion(.success(spaces))
            } catch {
                print(error.localizedDescription)
                completion(.failure(.parsingError(error: error)))
            }
        }) { (error) in
            print(error.localizedDescription)
            completion(.failure(.firebaseError(error: error)))
        }
    }
}

enum StoreError: Error {
    case invalidResponsePayload
    case parsingError(error: Error)
    case firebaseError(error: Error)
}

