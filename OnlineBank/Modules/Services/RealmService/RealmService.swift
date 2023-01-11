//
//  RealmService.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 09.01.2023.
//

import Foundation
import RealmSwift

final class RealmService {

    // Singleton
    static let shared = RealmService()
    var realm = try! Realm()

    init() {}

    func create<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            print("Cant create: \(error.localizedDescription)")
        }
    }

    func update<T: Object>(_ object: T, dictionary: [String: Any?]) {
        do {
            try realm.write {
                for (key, value) in dictionary {
                    object.setValue(value, forKey: key)
                }
            }
        } catch {
            print("Cant update: \(error.localizedDescription)")
        }

    }

    func delete<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch {
            print("Cant delete: \(error.localizedDescription)")
        }
    }
}
