//
//  LeagueTableItem.swift
//  Pods
//
//  Created by Hohunskyi, Volodymyr on 11/7/16.
//
//


public class CompetitionTableTeam: NSObject {

    var links: Dictionary <String, Dictionary <String, String>>?
    var position: Int?
    var teamName: String?
    var crestURI: String?
    var playedGames: Int?
    var points: Int?
    var goalDifference: Int?
    var score: CompetitionTableScore?
    var homeScore: CompetitionTableScore?
    var awayScore: CompetitionTableScore?
}

public class CompetitionTableScore {
    var goals: Int?
    var goalsAgainst: Int?
    var wins: Int?
    var draws: Int?
    var losses: Int?
}
