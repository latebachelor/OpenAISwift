//
//  Created by Adam Rush - OpenAISwift
//

import Foundation

enum Endpoint {
    case completions
    case edits
    case chat
    case chatStream // 修改第三方库
    case images
}

extension Endpoint {
    var path: String {
        switch self {
            case .completions:
                return "/v1/completions"
            case .edits:
                return "/v1/edits"
            case .chat:
                return "/v1/chat/completions"
            case .chatStream:
                return "/v1/chat/stream" // 修改第三方库 endpoint path for chat stream
            case .images:
                return "/v1/images/generations"
        }
    }
    
    var method: String {
        switch self {
            case .completions, .edits, .chat, .images:
                return "POST"
            case .chatStream:
                return "GET"
        }
    }
    
    func baseURL() -> String {
        switch self {
            case .completions, .edits, .chat, .images:
                return "https://api.openai.com"
            case .chatStream:
                return "wss://api.openai.com"
        }
    }
}
