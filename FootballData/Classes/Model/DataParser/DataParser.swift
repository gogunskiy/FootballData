//
//  DataParser.swift
//  Pods
//
//  Created by Hohunskyi, Volodymyr on 11/8/16.
//
//

import UIKit

public class DataParser: NSObject {

    public class func parseCompetitions(data: Data?) -> [Competition] {
        
        var competitions = Array <Competition>()
       
        if  let object = object(data: data) {
            for json in (object as! Array<Dictionary<String, AnyObject>>) {
                competitions.append(fulfillCompetition(json: json))
            }
        }
    
        return competitions
    }
    
    public class func parseCompetition(data: Data?) -> Competition? {
        
        if  let object = object(data: data) {
            if let dict = object as? Dictionary <String, AnyObject> {
                return fulfillCompetition(json: dict)
            }
        }
        
        return nil
    }
    
    public class func parseTeams(data: Data?) -> [Team] {
        
        var teams = Array <Team>()
        
        if  let object = object(data: data) {
            if let dict = object as? Dictionary <String, AnyObject> {
                if let teamsJson = dict["teams"] as? Array<Dictionary<String, AnyObject>> {
                    for json in teamsJson {
                        teams.append(fulfillTeam(json: json))
                    }
                }
            }
        }
        
        return teams
    }
    
    public class func parseTeam(data: Data?) -> Team? {
        
        if  let object = object(data: data) {
            if let dict = object as? Dictionary <String, AnyObject> {
                return fulfillTeam(json: dict)
            }
        }
        
        return nil
    }
    
    public class func parsePlayers(data: Data?) -> [Player] {
        
        var players = Array <Player>()
        
        if  let object = object(data: data) {
            if let dict = object as? Dictionary <String, AnyObject> {
                if let playersJson = dict["players"] as? Array<Dictionary<String, AnyObject>> {
                    for json in playersJson {
                        players.append(fulfillPlayer(json: json))
                    }
                }
            }
        }
        
        return players
    }
    
    public class func parseFixtures(data: Data?) -> [Fixture] {
        
        var fixture = Array <Fixture>()
        
        if  let object = object(data: data) {
            if let dict = object as? Dictionary <String, AnyObject> {
                if let teamsJson = dict["fixtures"] as? Array<Dictionary<String, AnyObject>> {
                    for json in teamsJson {
                        fixture.append(fulfillFixture(json: json))
                    }
                }
            }
        }
        
        return fixture
    }
    
    public class func parseLeague(data: Data?) -> CompetitionTable? {
        
        if  let object = object(data: data) {
            if let dict = object as? Dictionary <String, AnyObject> {
                return fulfillCompetitionTable(json: dict)
            }
        }
        
        return nil
    }
    
    private class func fulfillCompetition(json: Dictionary <String, AnyObject>) -> Competition {
       
        var competition = Competition()
        
        competition.id = json["id"] as? Int
        competition.caption = json["caption"] as? String
        competition.league = json["league"] as? String
        competition.year = json["year"] as? String
        competition.currentMatchday = json["currentMatchday"] as? Int
        competition.numberOfMatchdays = json["numberOfMatchdays"] as? Int
        competition.numberOfGames = json["numberOfGames"] as? Int
        competition.numberOfTeams = json["numberOfTeams"] as? Int
        competition.lastUpdated = json["lastUpdated"] as? String
        competition.links = json["_links"] as? Dictionary <String, Dictionary <String, String>>

        return competition
    }
    
    private class func fulfillTeam(json: Dictionary <String, AnyObject>) -> Team {
        
        var team = Team()
        
        team.name = json["name"] as? String
        team.code = json["code"] as? String
        team.shortName = json["shortName"] as? String
        team.squadMarketValue = json["squadMarketValue"] as? String
        team.crestUrl = json["crestUrl"] as? String
        team.links = json["_links"] as? Dictionary <String, Dictionary <String, String>>
        
        return team
    }
    
    private class func fulfillPlayer(json: Dictionary <String, AnyObject>) -> Player {
        
        var player = Player()
        
        player.name = json["name"] as? String
        player.position = json["position"] as? String
        player.dateOfBirth = json["dateOfBirth"] as? String
        player.nationality = json["nationality"] as? String
        player.contractUntil = json["contractUntil"] as? String
        player.jerseyNumber = json["jerseyNumber"] as? Int
        player.marketValue = json["marketValue"] as? String
        
        return player
    }
    
    private class func fulfillFixture(json: Dictionary <String, AnyObject>) -> Fixture {
        
        var fixture = Fixture()
        
        fixture.date = json["date"] as? String
        fixture.status = json["status"] as? String
        fixture.homeTeamName = json["homeTeamName"] as? String
        fixture.awayTeamName = json["awayTeamName"] as? String
        fixture.links = json["_links"] as? Dictionary <String, Dictionary <String, String>>
        
        if let result = json["result"] as? Dictionary <String, AnyObject> {
            fixture.goalsHomeTeam = result["goalsHomeTeam"] as? Int
            fixture.goalsAwayTeam = result["goalsAwayTeam"] as? Int
        }
        
        if let result = json["odds"] as? Dictionary <String, AnyObject> {
            let odds = Odds()
            odds.homeWin = result["homeWin"] as? Double
            odds.homeWin = result["draw"] as? Double
            odds.homeWin = result["awayWin"] as? Double
            fixture.odds = odds
        }
        
        return fixture
    }
    
    private class func fulfillCompetitionTable(json: Dictionary <String, AnyObject>) -> CompetitionTable? {
        
        var leagueTable = CompetitionTable()
        
        leagueTable.leagueCaption = json["leagueCaption"] as? String
        leagueTable.matchday = json["matchday"] as? Int
        leagueTable.links = json["_links"] as? Dictionary <String, Dictionary <String, String>>

        var standing = Array <CompetitionTableTeam>()

        if let standingJson = json["standing"] as? Array<Dictionary<String, AnyObject>> {
            for json in standingJson {
                if let item = fulfillCompetitionTableTeam(json: json) {
                    standing.append(item)
                }
            }
        }
        
        leagueTable.standing = standing

        return leagueTable
    }
    
    private class func fulfillCompetitionTableTeam(json: Dictionary <String, AnyObject>) -> CompetitionTableTeam? {
        
        let item = CompetitionTableTeam()
        
        item.teamName = json["teamName"] as? String
        item.position = json["position"] as? Int
        item.crestURI = json["crestURI"] as? String
        item.playedGames = json["playedGames"] as? Int
        item.points = json["points"] as? Int
        item.goalDifference = json["goalDifference"] as? Int
        item.score = fulfillCompetitionTableScore(json: json)
        item.links = json["_links"] as? Dictionary <String, Dictionary <String, String>>

        if let homeScore = json["home"]  as? Dictionary <String, AnyObject> {
            item.homeScore = fulfillCompetitionTableScore(json: homeScore)
        }
        
        if let awayScore = json["away"]  as? Dictionary <String, AnyObject> {
            item.awayScore = fulfillCompetitionTableScore(json: awayScore)
        }
        
        return item
    }
    
    private class func fulfillCompetitionTableScore(json: Dictionary <String, AnyObject>) -> CompetitionTableScore? {
       
        let score = CompetitionTableScore()
       
        score.goals = json["goals"] as? Int
        score.goalsAgainst = json["goalsAgainst"] as? Int
        score.wins = json["wins"] as? Int
        score.draws = json["draws"] as? Int
        score.losses = json["losses"] as? Int
        
        return score
    }
    
    private class func object(data: Data?) -> Any? {
        if let jsonData = data {
            if let object = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) {
                return object
            }
        }
        return nil
    }
}
