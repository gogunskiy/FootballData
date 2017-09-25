//
//  NetworkAdapter.swift
//  Pods
//
//  Created by Hohunskyi, Volodymyr on 11/7/16.
//
//

import UIKit

public class DefaultNetworkAdapter: NSObject, NetworkAdapter {

    public func fetchData(url: String, compleion: @escaping (Data?, Error?) -> ()) {

        let url = NSURL(string: url);
        let session = URLSession.shared
        let request = NSMutableURLRequest(url:url! as URL);
        request.httpMethod = "GET"

        let task = session.dataTask(with: request as URLRequest) {
            (data, response, error) in
            compleion(data, error)
        }
        
        task.resume()
        
    }

}
