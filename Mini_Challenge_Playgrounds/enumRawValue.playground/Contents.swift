import Cocoa

enum StatusCode: Int, CaseIterable{
    case success = 200
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
}

func prettyPrint(_ value: StatusCode)->String{
    switch value {
        case .success:
            return "\(StatusCode.success.rawValue): Success"
        case .unauthorized:
            return "\(StatusCode.unauthorized.rawValue): Unauthorized"
        case .forbidden:
            return "\(StatusCode.forbidden.rawValue): Forbidden"
        case .notFound:
            return "\(StatusCode.notFound.rawValue): Not Found"
    }
}

//test
for code in StatusCode.allCases{
    let string = prettyPrint(code)
    print(string)
}
