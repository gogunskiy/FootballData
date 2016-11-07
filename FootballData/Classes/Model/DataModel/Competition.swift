//
//  Competition.swift
//  Pods
//
//  Created by Hohunskyi, Volodymyr on 11/7/16.
//
//

public class Competition: NSObject {
 
    var id: Int?
    var caption: String?
    var league: String?
    var year: String?
    var currentMatchday: Int?
    var numberOfMatchdays: Int?
    var numberOfTeams: Int?
    var numberOfGames: Int?
    var lastUpdated: Int?
    var links: Dictionary <String, Dictionary <String, String>>?
}
