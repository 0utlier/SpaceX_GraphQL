// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class LaunchesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Launches {
      launchesPast {
        __typename
        mission_name
        launch_date_utc
        details
      }
      missions {
        __typename
        description
      }
    }
    """

  public let operationName: String = "Launches"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("launchesPast", type: .list(.object(LaunchesPast.selections))),
        GraphQLField("missions", type: .list(.object(Mission.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(launchesPast: [LaunchesPast?]? = nil, missions: [Mission?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "launchesPast": launchesPast.flatMap { (value: [LaunchesPast?]) -> [ResultMap?] in value.map { (value: LaunchesPast?) -> ResultMap? in value.flatMap { (value: LaunchesPast) -> ResultMap in value.resultMap } } }, "missions": missions.flatMap { (value: [Mission?]) -> [ResultMap?] in value.map { (value: Mission?) -> ResultMap? in value.flatMap { (value: Mission) -> ResultMap in value.resultMap } } }])
    }

    public var launchesPast: [LaunchesPast?]? {
      get {
        return (resultMap["launchesPast"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [LaunchesPast?] in value.map { (value: ResultMap?) -> LaunchesPast? in value.flatMap { (value: ResultMap) -> LaunchesPast in LaunchesPast(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [LaunchesPast?]) -> [ResultMap?] in value.map { (value: LaunchesPast?) -> ResultMap? in value.flatMap { (value: LaunchesPast) -> ResultMap in value.resultMap } } }, forKey: "launchesPast")
      }
    }

    public var missions: [Mission?]? {
      get {
        return (resultMap["missions"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Mission?] in value.map { (value: ResultMap?) -> Mission? in value.flatMap { (value: ResultMap) -> Mission in Mission(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Mission?]) -> [ResultMap?] in value.map { (value: Mission?) -> ResultMap? in value.flatMap { (value: Mission) -> ResultMap in value.resultMap } } }, forKey: "missions")
      }
    }

    public struct LaunchesPast: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Launch"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("mission_name", type: .scalar(String.self)),
          GraphQLField("launch_date_utc", type: .scalar(String.self)),
          GraphQLField("details", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(missionName: String? = nil, launchDateUtc: String? = nil, details: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Launch", "mission_name": missionName, "launch_date_utc": launchDateUtc, "details": details])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var missionName: String? {
        get {
          return resultMap["mission_name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "mission_name")
        }
      }

      public var launchDateUtc: String? {
        get {
          return resultMap["launch_date_utc"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "launch_date_utc")
        }
      }

      public var details: String? {
        get {
          return resultMap["details"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "details")
        }
      }
    }

    public struct Mission: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Mission"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(description: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Mission", "description": description])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }
    }
  }
}
