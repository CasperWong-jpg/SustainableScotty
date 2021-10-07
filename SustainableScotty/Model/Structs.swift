//
//  Structs.swift
//  SustainableScotty
//
//  Created by Casper Wong on 10/7/21.
//

import Foundation

struct Community {
    let title: String
    let numUsers: Int
}

struct User {
    let name: String
    let score: Int
}

struct K {
    // static let (constant) = "(string)"
    // Call as "K.(constant)" in other files
    static let CommCellIdentifier = "ReusableCommCell"
    static let CommNibName = "CommunityCell"
    static let LeaderboardCellIdentifier = "ReusableLeaderboardCell"
    static let LeaderboardNibName = "LeaderboardCell"
}
