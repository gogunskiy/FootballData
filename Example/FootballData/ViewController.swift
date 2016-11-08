//
//  ViewController.swift
//  FootballData
//
//  Created by Volodymyr Hohunskyi on 11/07/2016.
//  Copyright (c) 2016 Volodymyr Hohunskyi. All rights reserved.
//

import UIKit
import FootballData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        FDManager.fetchAllCompetitions(season: 2016) { (competitions) in
            
        }
        
        FDManager.fetchCompetitionTeams(competition: 424) {
            (teams) in
            print(teams)
        }
        
        FDManager.fetchCompetitionFixtures(competition: 424) {
            (fixtures) in
            print(fixtures)
        }
        
        
        FDManager.fetchTeam(team: 322) {
            (team) in
            print(team!)
        }
        
        FDManager.fetchTeamFixtures(team: 322) {
            (fixtures) in
            print(fixtures)
        }
        
        FDManager.fetchCompetition(competition: 426) {
            (competition) in
            print(competition!)
        }
        
        FDManager.fetchTeamPlayers(team: 322) {
            (player) in
            print(player)
        }
        
        FDManager.fetchCompetitionTable(competition: 426) {
            (table) in
            print(table!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

