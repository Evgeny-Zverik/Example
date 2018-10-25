//
//  NetworkCore.swift
//  Exampl
//
//  Created by Admin on 19/10/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

public protocol NetworkCoreProtocol: class {
    func send(request: URLRequest, queue: DispatchQueue?, completion: @escaping (Data?, Error?) -> Void)
}

class NetworkCore: NSObject, NetworkCoreProtocol {
    //public var baseURL: URL = URL()
    
    /// Ядро сетевого запроса к серверу
    ///
    /// - Parameters:
    /// - request: запрос
    /// - queue: очередь для возврата данных, по умолчанию текущая очередь.
    /// - completion: callBack - Возвращаемые данные от сервера, либо ошибка
    public func send(request: URLRequest, queue: DispatchQueue? = nil, completion: @escaping (Data?, Error?) -> Void) {
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration)
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            if let error = error {
                completion(nil, error)
                return
            }else {
                completion(data!, nil)
            }
        })
        
        task.resume()
    }
}
