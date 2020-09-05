import Cocoa


enum StatusCode: CaseIterable{
    case success
    case unauthorized
    case forbidden
    case notFound
}

func prettyPrint(_ value: StatusCode)->String{
    switch value {
    case .success:
        return "200: Success"
    case .unauthorized:
        return "401: Unauthorized"
    case .forbidden:
        return "403: Forbidden"
    case .notFound:
        return "404: Not Found"
    }
}

//test
for code in StatusCode.allCases{
    let string = prettyPrint(code)
    print(string)
}

