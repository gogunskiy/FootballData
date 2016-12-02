//
//  NetworkAdapter.swift
//  Pods
//
//  Created by Hohunskyi, Volodymyr on 11/7/16.
//
//

import UIKit

public protocol NetworkAdapter {
    func fetchData(url: String, compleion:  @escaping (Data?, Error?) -> ())
}

public class DefaultNetworkAdapter: NSObject, NetworkAdapter {

    public func fetchData(url: String, compleion: @escaping (Data?, Error?) -> ()) {

        let url = NSURL(string: url);
        let session = URLSession.shared
        let request = NSMutableURLRequest(url:url! as URL);
        
        request.addValue("bf4a43952c7540e2a427b68efea76f1b", forHTTPHeaderField: "X-Auth-Token")
        request.httpMethod = "GET"

        let task = session.dataTask(with: request as! URLRequest) {
            (data, response, error) in
            compleion(data, error)
        }
        
        task.resume()
        
    }

}
