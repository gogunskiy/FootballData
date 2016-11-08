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
    
    public class func fetchAllCompetitions(season: Int, result: @escaping ([Competition]) -> Void) {
        sharedInstance.fetchAllCompetitions(season: season, result: result)
    }
    
    public class func fetchCompetition(competition: Int, result: @escaping (Competition?) -> Void) {
        sharedInstance.fetchCompetition(competition: competition, result: result)
    }
    
    public class func fetchCompetitionTeams(competition: Int, result: @escaping ([Team]) -> Void) {
        sharedInstance.fetchCompetitionTeams(competition: competition, result: result)
    }
    
    public class func fetchCompetitionFixtures(competition: Int, result: @escaping ([Fixture]) -> Void) {
        sharedInstance.fetchCompetitionFixtures(competition: competition, result: result)
    }
    
    public class func fetchTeamFixtures(team: Int, result: @escaping ([Fixture]) -> Void) {
        sharedInstance.fetchTeamFixtures(team: team, result: result)
    }
    
    public class func fetchTeam(team: Int, result: @escaping (Team?) -> Void)  {
        sharedInstance.fetchTeam(team: team, result: result)
    }
    
    public class func fetchTeamPlayers(team: Int, result: @escaping ([Player]) -> Void) {
        sharedInstance.fetchTeamPlayers(team: team, result: result)
    }
    
    public class func fetchCompetitionTable(competition: Int, result: @escaping (CompetitionTable?) -> Void) {
        sharedInstance.fetchCompetitionTable(competition: competition, result: result)
    }
    
    func fetchAllCompetitions(season: Int, result: @escaping ([Competition]) -> Void) {
        networkAdapter.fetchData(url: "http://api.football-data.org/v1/competitions/?season=\(season)") {
            (data , error) in
            result(DataParser.parseCompetitions(data: data))
        }
    }
    
    func fetchCompetition(competition: Int, result: @escaping (Competition?) -> Void) {
        networkAdapter.fetchData(url: "http://api.football-data.org/v1/competitions/\(competition)") {
            (data , error) in
            result(DataParser.parseCompetition(data: data))
        }
    }
    
    func fetchCompetitionTeams(competition: Int, result: @escaping ([Team]) -> Void) {
        networkAdapter.fetchData(url: "http://api.football-data.org/v1/competitions/\(competition)/teams") {
            (data , error) in
            result(DataParser.parseTeams(data: data))
        }
    }
    
    func fetchTeam(team: Int, result: @escaping (Team?) -> Void) {
        networkAdapter.fetchData(url: "http://api.football-data.org/v1/teams/\(team)") {
            (data , error) in
            result(DataParser.parseTeam(data: data))
        }
    }
    
    func fetchTeamPlayers(team: Int, result: @escaping ([Player]) -> Void) {
        networkAdapter.fetchData(url: "http://api.football-data.org/v1/teams/\(team)/players") {
            (data , error) in
            result(DataParser.parsePlayers(data: data))
        }
    }
    
    func fetchCompetitionFixtures(competition: Int, result: @escaping ([Fixture]) -> Void) {
        networkAdapter.fetchData(url: "http://api.football-data.org/v1/competitions/\(competition)/fixtures") {
            (data , error) in
            result(DataParser.parseFixtures(data: data))
        }
    }
    
    func fetchTeamFixtures(team: Int, result: @escaping ([Fixture]) -> Void) {
        networkAdapter.fetchData(url: "http://api.football-data.org/v1/teams/\(team)/fixtures") {
            (data , error) in
            result(DataParser.parseFixtures(data: data))
        }
    }
    
    func fetchCompetitionTable(competition: Int, result: @escaping (CompetitionTable?) -> Void) {
        networkAdapter.fetchData(url: "http://api.football-data.org/v1/competitions/\(competition)/leagueTable") {
            (data , error) in
            result(DataParser.parseLeague(data: data))
        }
    }
}
