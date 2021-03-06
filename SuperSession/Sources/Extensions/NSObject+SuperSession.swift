//
//  NSObject+SuperSession
//  SuperSession
//
//  Created by Harmeet Singh on 19/09/2016.
//  Copyright © 2016 HarmeetSingh. All rights reserved.
//

import Foundation

extension NSObject {
    
    // MARK: Typealias
    
    typealias DataTaskResponse = (data: Data?, response: URLResponse?, error: NSError?)
    typealias UploadTaskResponse = (data: Data?, response: URLResponse?, error: NSError?)
    typealias DownloadTaskResponse = (url: URL?, response: URLResponse?, error: NSError?)
}
