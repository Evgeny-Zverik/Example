//
//  NetworcServies.swift
//  Exampl
//
//  Created by Admin on 19/10/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

class NetworkServies {
    var core: NetworkCoreProtocol!
    
    public init(core: NetworkCoreProtocol) {
        self.core = core
    }
    
    
}

extension NetworkServies {
    /// Загрузка фото пользователя
    ///
    /// - Parameters:
    ///   - userUrl: Url Адрес картинки
    ///   - queue: очередь для возврата, по умолчанию главная
    ///   - response: Метод обратного вызова с Data
    public func downloadPhoto(userUrl: String, queue: DispatchQueue = DispatchQueue.main, response: @escaping (Data?, Error?) -> ()) {
        guard let url = URL(string: userUrl) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = HttpMethod.get.rawValue
        
        core.send(request: request, queue: queue) { (data, error) in
            if let error = error {
                response(nil, error)
            }else {
                response(data, nil)
            }
        }
    }
}
