//
//  LXDouYuLiveAPI.swift
//  LXLive
//
//  Created by pxl on 2017/2/15.
//  Copyright © 2017年 pxl. All rights reserved.
//

import Foundation
import Moya

let LXDouYuLiveProvider = MoyaProvider<LXDouYuLive>(plugins: [NetworkLoggerPlugin(verbose: false)])

public enum LXDouYuLive {
     case getColumnDetail(String)
}

extension LXDouYuLive: TargetType {
    public var baseURL: URL { return URL(string: "http://capi.douyucdn.cn/api/v1/getColumnDetail")! }
    public var path: String {
        switch self {
         case .getColumnDetail:
            return ""
        }
    }
    public var method: Moya.Method {
        switch self {
         case .getColumnDetail:
            return .get
        }
    }
    public var parameters: [String: Any]? {
        switch self {
         case .getColumnDetail:
            return ["shortName" : "game"]
        }
    }
    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    public var task: Task {
        switch self {
         case .getColumnDetail:
            return .request
        }
    }
    public var sampleData: Data {
        switch self {
         default:
            return animatedBirdData() as Data
        }
    }
    
}

private let DefaultDownloadDestination: DownloadDestination = { temporaryURL, response in
    let directoryURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    
    if !directoryURLs.isEmpty {
        return (directoryURLs[0].appendingPathComponent(response.suggestedFilename!), [])
    }
    
    return (temporaryURL, [])
}

