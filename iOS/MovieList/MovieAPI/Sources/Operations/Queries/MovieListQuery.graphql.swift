// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class MovieListQuery: GraphQLQuery {
  public static let operationName: String = "MovieList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query MovieList { movies { __typename id name thumb } }"#
    ))

  public init() {}

  public struct Data: MovieAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { MovieAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("movies", [Movie?]?.self),
    ] }

    /// List of All Movies
    public var movies: [Movie?]? { __data["movies"] }

    /// Movie
    ///
    /// Parent Type: `Movie`
    public struct Movie: MovieAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { MovieAPI.Objects.Movie }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Int.self),
        .field("name", String.self),
        .field("thumb", String.self),
      ] }

      public var id: Int { __data["id"] }
      public var name: String { __data["name"] }
      public var thumb: String { __data["thumb"] }
    }
  }
}
