//
//  SuperSessionTests.swift
//  SuperSessionTests
//
//  Created by Harmeet Singh on 18/09/2016.
//  Copyright © 2016 HarmeetSingh. All rights reserved.
//

import XCTest

class SuperSessionTests: XCTestCase {

    // MARK: Properties
    
    var superSession = SuperSession.shared
    
    let randomURL: URL = {
        
        guard let url = URL(string: "www.random.test.webstie.com/random") else {
            return NSURL() as URL
        }
        return url
    }()
    
    let randomURLResponse: URLResponse? = {
        
        guard let url = URL(string: "www.random.test.webstie.com/random") else {
            return nil
        }
        return URLResponse(url: url, mimeType: "mp3", expectedContentLength: 20000, textEncodingName: "UTF-8")
    }()
    
    let randomHTTPURLResponse: HTTPURLResponse? = {
        
        guard let url = URL(string: "www.random.test.webstie.com/random") else {
            return nil
        }
        return HTTPURLResponse(url: url, statusCode: 200, httpVersion: "1.1", headerFields: ["mobileId" : "0987654321"])
    }()
    
    let randomData: Data? = {
        
        let dictionary = ["username" : "harmeet"]
        return NSKeyedArchiver.archivedData(withRootObject: dictionary)
    }()
    
    let randomError: NSError? = {
        
        return NSError(domain: "www.harmeetsingh.superError", code: -1000, userInfo: ["profileId" : "1234"])
    }()
    
//    let randomRequest: URLRequest = {
//        
//        guard let url = URL(string: "www.random.test.webstie.com/random") else {
//            return NSURLRequest() as URLRequest
//        }
//       
//        return URLRequest(url: url, cachePolicy: nil, timeoutInterval: 60)
//    }()
    
    // MARK: Instantiation
    
    func testSuperSession_NotNil(){
        
        XCTAssertNotNil(superSession, "SuperSession should not be nil")
    }
}

// MARK: Data Task With Request

extension SuperSessionTests {
    
    func testDataTaskWithRequest_MockURLResponse_ResponseNotNil() {
//        
//        let expectation = self.expectation(description: "testDataTaskWithRequest_MockURLResponse_ResponseNotNil")
//        superSession.stubDataTask(withResponse: randomURLResponse)
//        
//        superSession.dataTask(with: <#T##URLRequest#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
//        
//        _ = superSession.dataTask(with: randomURL) { (data: Data?, response: URLResponse?, error: Error?) in
//            
//            XCTAssertNotNil(response, "response should not be nil")
//            expectation.fulfill()
//            
//            }.resume()
//        
//        waitForExpectations(timeout: 0.2, handler: nil)
    }
}



// MARK: Data Task With URL

extension SuperSessionTests {

    // MARK: Mocking Response
    
    func testDataTaskWithURL_MockURLResponse_ResponseNotNil() {
    
        let expectation = self.expectation(description: "testDataTaskWithURL_MockURLResponse_ResponseNotNil")
        superSession.stubDataTask(withResponse: randomURLResponse)
        
        _ = superSession.dataTask(with: randomURL) { (data: Data?, response: URLResponse?, error: Error?) in

            XCTAssertNotNil(response, "response should not be nil")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockURLResponse_ResponseURLNotNil() {
     
        let expectation = self.expectation(description: "testDataTaskWithURL_MockURLResponse_ResponseURLNotNil")
        superSession.stubDataTask(withResponse: randomURLResponse)
        
        _ = superSession.dataTask(with: randomURL) { (data: Data?, response: URLResponse?, error: Error?) in
            
            let url = response?.url
            
            XCTAssertNotNil(url, "url should not be nil")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockURLResponse_ResponseURLCorrectValue() {
        
        let expectation = self.expectation(description: "testDataTaskWithURL_MockURLResponse_ResponseURLCorrectValue")
        superSession.stubDataTask(withResponse: randomURLResponse)
        
        _ = superSession.dataTask(with: randomURL) { (data: Data?, response: URLResponse?, error: Error?) in
            
            let urlString = response?.url?.absoluteString
            
            XCTAssertEqual(urlString, "www.random.test.webstie.com/random", "url should be 'www.random.test.webstie.com/random'")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockURLResponse_ResponseMIMETypeNotNil() {
        
        let expectation = self.expectation(description: "testDataTaskWithURL_MockURLResponse_ResponseMIMETypeNotNil")
        superSession.stubDataTask(withResponse: randomURLResponse)
        
        _ = superSession.dataTask(with: randomURL) { (data: Data?, response: URLResponse?, error: Error?) in
            
            let mimeType = response?.mimeType
            
            XCTAssertNotNil(mimeType, "url should not be nil")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockURLResponse_ResponseMIMETypeCorrectValue() {
        
        let expectation = self.expectation(description: "testDataTaskWithURL_MockURLResponse_ResponseMIMETypeCorrectValue")
        superSession.stubDataTask(withResponse: randomURLResponse)
        
        _ = superSession.dataTask(with: randomURL){ (data: Data?, response: URLResponse?, error: Error?) in
            
            let mimeType = response?.mimeType
            
            XCTAssertEqual(mimeType, "mp3", "url should be 'mp3'")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockURLResponse_ResponseExpectedContentLengthCorrectValue() {
        
        let expectation = self.expectation(description: "testDataTaskWithURL_MockURLResponse_ResponseExpectedContentLengthCorrectValue")
        superSession.stubDataTask(withResponse: randomURLResponse)
        
        _ = superSession.dataTask(with: randomURL) { (data: Data?, response: URLResponse?, error: Error?) in
            
            let expectedContentLength = response?.expectedContentLength
            
            XCTAssertEqual(expectedContentLength, 20000, "expectedContentLength should be 20000")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockURLResponse_ResponseTextEncodingNameNotNil() {
        
        let expectation = self.expectation(description: "testDataTaskWithURL_MockURLResponse_ResponseTextEncodingNameNotNil")
        superSession.stubDataTask(withResponse: randomURLResponse)
        
        _ = superSession.dataTask(with: randomURL) { (data: Data?, response: URLResponse?, error: Error?) in
            
            let textEncodingName = response?.textEncodingName
            
            XCTAssertNotNil(textEncodingName, "textEncodingName should not be nil")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockURLResponse_ResponseTextEncodingNameCorrectValue() {
        
        let expectation = self.expectation(description: "testDataTaskWithURL_MockURLResponse_ResponseTextEncodingNameCorrectValue")
        superSession.stubDataTask(withResponse: randomURLResponse)
        
        _ = superSession.dataTask(with: randomURL) { (data: Data?, response: URLResponse?, error: Error?) in
            
            let textEncodingName = response?.textEncodingName
            
            XCTAssertEqual(textEncodingName, "UTF-8", "url should be 'UTF-8'")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }
    
    // MARK: Mocking Response - NSHTTPURLResponse
    
    func testDataTaskWithURL_MockHTTPURLResponse_ResponseURLNotNil() {
        
        let expectation = self.expectation(description: "testDataTaskWithURL_MockHTTPURLResponse_ResponseURLNotNil")
        superSession.stubDataTask(withResponse: randomURLResponse)
        
        _ = superSession.dataTask(with: randomURL) { (data: Data?, response: URLResponse?, error: Error?) in
            
            let url = response?.url
            
            XCTAssertNotNil(url, "url should not be nil")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockHTTPURLResponse_ResponseURLCorrectValue() {
        
        let expectation = self.expectation(description: "testDataTaskWithURL_MockHTTPURLResponse_ResponseURLCorrectValue")
        superSession.stubDataTask(withResponse: randomURLResponse)
        
        _ = superSession.dataTask(with: randomURL) { (data: Data?, response: URLResponse?, error: Error?) in
            
            let urlString = response?.url?.absoluteString
            
            XCTAssertEqual(urlString, "www.random.test.webstie.com/random", "url should be 'www.random.test.webstie.com/random'")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockHTTPURLResponse_ResponseStatusCodeCorrectValue() {
        
        let expectation = self.expectation(description: "testDataTaskWithURL_MockHTTPURLResponse_ResponseStatusCodeCorrectValue")
        superSession.stubDataTask(withResponse: randomHTTPURLResponse)
        
        _ = superSession.dataTask(with: randomURL) { (data: Data?, response: URLResponse?, error: Error?) in
            
            let httpURLresponse = response as? HTTPURLResponse
            let statusCode = httpURLresponse?.statusCode
            
            XCTAssertEqual(statusCode, 200, "statusCode should be 200")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockHTTPURLResponse_ResponseHeaderFieldsNotNil() {
        
        let expectation = self.expectation(description: "testDataTaskWithURL_MockHTTPURLResponse_ResponseHeaderFieldsNotNil")
        superSession.stubDataTask(withResponse: randomHTTPURLResponse)
        
        _ = superSession.dataTask(with: randomURL) { (data: Data?, response: URLResponse?, error: Error?) in
            
            let httpURLResponse = response as? HTTPURLResponse
            let headerFields = httpURLResponse?.allHeaderFields
            
            XCTAssertNotNil(headerFields, "headerFields should not be nil")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockHTTPURLResponse_ResponseHeaderFieldsCorrectCount() {
        
        let expectation = self.expectation(description: "testDataTaskWithURL_MockError_ErrorUserInfoCorrectCount")
        superSession.stubDataTask(withResponse: randomHTTPURLResponse)
        
        _ = superSession.dataTask(with: randomURL) { (data: Data?, response: URLResponse?, error: Error?) in
            
            let httpURLResponse = response as? HTTPURLResponse
            let headerFieldsCount = httpURLResponse?.allHeaderFields.count
            
            XCTAssertEqual(headerFieldsCount, 1, "headerFieldsCount should be 1")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockHTTPURLResponse_ResponseHeaderFieldsCorrectValue() {
        
        let expectation = self.expectation(description: "testDataTaskWithURL_MockHTTPURLResponse_ResponseHeaderFieldsCorrectValue")
        superSession.stubDataTask(withResponse: randomHTTPURLResponse)
        
        _ = superSession.dataTask(with: randomURL) { (data: Data?, response: URLResponse?, error: Error?) in
            
            let httpURLResponse = response as? HTTPURLResponse
            let mobileIdValue = httpURLResponse?.allHeaderFields["mobileId"] as? String
            
            XCTAssertEqual(mobileIdValue, "0987654321", "mobileIdValue should be 0987654321")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }
    
    // MARK: Mocking Data
    
    func testDataTaskWithURL_MockData_DataNotNil() {
        
        let expectation = self.expectation(description: "testDataTaskWithURL_MockData_DataNotNil")
        superSession.stubDataTask(withData: randomData)
        
        _ = superSession.dataTask(with: randomURL) { (data: Data?, response: URLResponse?, error: Error?) in
            
            XCTAssertNotNil(data, "data should not be nil")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockData_DictionaryCorrectCount() {
        
        let expectation = self.expectation(description: "testDataTaskWithURL_MockData_DictionaryCorrectCount")
        superSession.stubDataTask(withData: randomData)
        
        _ = superSession.dataTask(with: randomURL) { (data: Data?, response: URLResponse?, error: Error?) in
            
            guard let data = data else {
                return XCTFail()
            }
            
            let dictionay = NSKeyedUnarchiver.unarchiveObject(with: data) as? NSDictionary
            let dictionaryCount = dictionay?.count
            
            XCTAssertEqual(dictionaryCount, 1, "dictionaryCount should be 1")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockData_DataCorrectValue() {
        
        let expectation = self.expectation(description: "testDataTaskWithURL_MockData_DataCorrectValue")
        superSession.stubDataTask(withData: randomData)
        
        _ = superSession.dataTask(with: randomURL) { (data: Data?, response: URLResponse?, error: Error?) in
            
            guard let data = data else {
                return XCTFail()
            }
            
            let dictionay = NSKeyedUnarchiver.unarchiveObject(with: data) as? NSDictionary
            let usernameValue = dictionay?["username"] as? String
            
            XCTAssertEqual(usernameValue, "harmeet", "userbame should be harmeet")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }
    
    // MARK: Mocking Error
    
    func testDataTaskWithURL_MockError_ErrorNotNil() {
        
        let expectation = self.expectation(description: "testDataTaskWithURL_MockError_ErrorNotNil")
        superSession.stubDataTask(withError: randomError)
        
        _ = superSession.dataTask(with: randomURL) { (data: Data?, response: URLResponse?, error: Error?) in
            
            XCTAssertNotNil(error, "error should not be nil")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockError_ErrorDomainNotNil() {
        
        let expectation = self.expectation(description: "testDataTaskWithURL_MockError_ErrorDomainNotNil")
        superSession.stubDataTask(withError: randomError)
        
        _ = superSession.dataTask(with: randomURL) { (data: Data?, response: URLResponse?, error: Error?) in
            
            let responseError = error as? NSError
            let errorDomain = responseError?.domain
                
            XCTAssertNotNil(errorDomain, "errorDomain should not be nil")
            expectation.fulfill()
        
        }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockError_ErrorDomainCorrectValue() {
        
        let expectation = self.expectation(description: "testDataTaskWithURL_MockError_ErrorDomainCorrectValue")
        superSession.stubDataTask(withError: randomError)
        
        _ = superSession.dataTask(with: randomURL) { (data: Data?, response: URLResponse?, error: Error?) in
            
            let responseError = error as? NSError
            let errorDomain = responseError?.domain
            
            XCTAssertEqual(errorDomain, "www.harmeetsingh.superError", "errorDomain should be 'www.harmeetsingh.superError'")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockError_ErrorCodeCorrectValue() {
        
        let expectation = self.expectation(description: "testDataTaskWithURL_MockError_ErrorCodeCorrectValue")
        superSession.stubDataTask(withError: randomError)
        
        _ = superSession.dataTask(with: randomURL) { (data: Data?, response: URLResponse?, error: Error?) in
            
            let responseError = error as? NSError
            let errorCode = responseError?.code
            
            XCTAssertEqual(errorCode, -1000, "errorDomain should be -1000")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockError_ErrorUserInfoNotNil() {
        
        let expectation = self.expectation(description: "testDataTaskWithURL_MockError_ErrorUserInfoNotNil")
        superSession.stubDataTask(withError: randomError)
        
        _ = superSession.dataTask(with: randomURL) { (data: Data?, response: URLResponse?, error: Error?) in
            
            let responseError = error as? NSError
            let errorUserInfo = responseError?.userInfo
            
            XCTAssertNotNil(errorUserInfo, "errorUserInfo should not be nil")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockError_ErrorUserInfoCorrectCount() {
        
        let expectation = self.expectation(description: "testDataTaskWithURL_MockError_ErrorUserInfoCorrectCount")
        superSession.stubDataTask(withError: randomError)
        
        _ = superSession.dataTask(with: randomURL) { (data: Data?, response: URLResponse?, error: Error?) in
            
            let responseError = error as? NSError
            let userInfoCount = responseError?.userInfo.count
            
            XCTAssertEqual(userInfoCount, 1, "userInfoCount should be 1")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }
    
    func testDataTaskWithURL_MockError_ErrorUserInfoCorrectValue() {
        
        let expectation = self.expectation(description: "testDataTaskWithURL_MockError_ErrorUserInfoCorrectValue")
        superSession.stubDataTask(withError: randomError)
        
        _ = superSession.dataTask(with: randomURL) { (data: Data?, response: URLResponse?, error: Error?) in
            
            let responseError = error as? NSError
            let profileIdValue = responseError?.userInfo["profileId"] as? String
            
            XCTAssertEqual(profileIdValue, "1234", "profileIdValue should be 1")
            expectation.fulfill()
            
        }.resume()
        
        waitForExpectations(timeout: 0.2, handler: nil)
    }
}
