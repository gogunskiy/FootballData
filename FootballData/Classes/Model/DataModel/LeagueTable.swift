//
//  LeagueTable.swift
//  Pods
//
//  Created by Hohunskyi, Volodymyr on 11/7/16.
//
//


public class LeagueTable: NSObject {

    var caption: String?
    var matchday: Int?
    var standing: Array <LeagueTableItem>?
    var links: Dictionary <String, Dictionary <String, String>>?
}
