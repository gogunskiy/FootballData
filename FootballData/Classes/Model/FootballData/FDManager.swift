//
//  FootballData.swift
//  Pods
//
//  Created by Hohunskyi, Volodymyr on 11/7/16.
//
//


public class FDManager: NSObject {

    private static let sharedInstance = FDManager()
    private var networkAdapter: NetworkAdapter = DefaultNetworkAdapter()

    public class func setNetworkAdapter(networkAdapter: NetworkAdapter) {
        sharedInstance.networkAdapter = networkAdapter
    }
    
    public class func fetchAllCompetitions(season: Int, result: ([Competition]) -> Void) {
        sharedInstance.fetchAllCompetitions(season: season, result: result)
    }
    
    func fetchAllCompetitions(season: Int, result: ([Competition]) -> Void) {
        
    }

}
