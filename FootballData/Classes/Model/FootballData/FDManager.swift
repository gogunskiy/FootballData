//
//  FootballData.swift
//  Pods
//
//  Created by Hohunskyi, Volodymyr on 11/7/16.
//
//

public protocol NetworkAdapter {
    func fetchData(url: String, compleion:  @escaping (Data?, Error?) -> ())
}

public class FDManager {
    
    private var networkAdapter: NetworkAdapter = DefaultNetworkAdapter()
    private var baseURL: String = "http://api.football-data.org/v1"
    
    public init(with baseURL:String? = nil, with networkAdapter: NetworkAdapter? = nil) {
        if let url = baseURL {
            self.baseURL = url
        }
        
        if let adapter = networkAdapter {
            self.networkAdapter = adapter
        }
    }

    public func fetchAllCompetitions(season id: Int, result: @escaping ([Competition]) -> Void) {
        networkAdapter.fetchData(url: "\(baseURL)/competitions/?season=\(id)") {
            (data , error) in
            result(DataParser.parseCompetitions(data: data))
        }
    }
    
    public func fetch(competition id: Int, result: @escaping (Competition?) -> Void) {
        networkAdapter.fetchData(url: "\(baseURL)/competitions/\(id)") {
            (data , error) in
            result(DataParser.parseCompetition(data: data))
        }
    }
    
    public func fetchTeams(forCompetition id: Int, result: @escaping ([Team]) -> Void) {
        networkAdapter.fetchData(url: "\(baseURL)/competitions/\(id)/teams") {
            (data , error) in
            result(DataParser.parseTeams(data: data))
        }
    }
    
    public func fetch(team id: Int, result: @escaping (Team?) -> Void) {
        networkAdapter.fetchData(url: "\(baseURL)/teams/\(id)") {
            (data , error) in
            result(DataParser.parseTeam(data: data))
        }
    }
    
    public func fetchPlayers(forTeam id: Int, result: @escaping ([Player]) -> Void) {
        networkAdapter.fetchData(url: "\(baseURL)/teams/\(id)/players") {
            (data , error) in
            result(DataParser.parsePlayers(data: data))
        }
    }
    
    public func fetchFixtures(forCompetition id: Int, result: @escaping ([Fixture]) -> Void) {
        networkAdapter.fetchData(url: "\(baseURL)/competitions/\(id)/fixtures") {
            (data , error) in
            result(DataParser.parseFixtures(data: data))
        }
    }
    
    public func fetchFixtures(forTeam id: Int, result: @escaping ([Fixture]) -> Void) {
        networkAdapter.fetchData(url: "\(baseURL)/teams/\(id)/fixtures") {
            (data , error) in
            result(DataParser.parseFixtures(data: data))
        }
    }
    
    public func fetchLeagueTable(forCompetition id: Int, result: @escaping (CompetitionTable?) -> Void) {
        networkAdapter.fetchData(url: "\(baseURL)/competitions/\(id)/leagueTable") {
            (data , error) in
            result(DataParser.parseLeague(data: data))
        }
    }
}
