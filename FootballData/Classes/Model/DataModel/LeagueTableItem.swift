//
//  LeagueTableItem.swift
//  Pods
//
//  Created by Hohunskyi, Volodymyr on 11/7/16.
//
//


public class LeagueTableItem: NSObject {

    var links: Dictionary <String, Dictionary <String, String>>?
    var position: Int?
    var teamName: String?
    var crestURI: String?
    var playedGames: Int?
    var points: Int?
    var goals: Int?
    var goalsAgainst: Int?
    var goalDifference: Int?
    var wins: Int?
    var draws: Int?
    var losses: Int?
    var home: Dictionary<String, Int>?
    var away: Dictionary<String, Int>?
}
