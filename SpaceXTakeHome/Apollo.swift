//
//  Apollo.swift
//  SpaceXTakeHome
//
//  Created by Saturn on 3/14/22.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    lazy var apollo = ApolloClient(url: URL(string: "https://api.spacex.land/graphql/")!)
}

