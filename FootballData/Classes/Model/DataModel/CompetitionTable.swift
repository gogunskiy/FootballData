//
//  CompetitionTable.swift
//  Pods
//
//  Created by Hohunskyi, Volodymyr on 11/7/16.
//
//


public class CompetitionTable: NSObject {

    var leagueCaption: String?
    var matchday: Int?
    var standing: Array <CompetitionTableTeam>?
    var links: Dictionary <String, Dictionary <String, String>>?
}
