//
//  HomeInteractorTest.swift
//  DemoAppTests
//
//  Created by Derlys Hector Benito Baldeon on 4/09/24.
//

import XCTest
@testable import DemoApp

final class HomeInteractorTest: XCTestCase {
    
    var sut: HomeInteractor?
    var dataSource: DataSourceMock?

    override func setUp() {
        super.setUp()
        let dataSource = DataSourceMock()
        let sut = HomeInteractor(dataSource: dataSource)
        self.dataSource = dataSource
        self.sut = sut
    }
    
    override func tearDown() {
        super.tearDown()
        self.dataSource = nil
        self.sut = nil
    }
    
    func test_givenInteractor_whenGetMovies_thenVerifyResult(){
        //Given
        let exp = expectation(description: "test interactor countries")
        var resultReceived: [ResultsResponse]?
        
        let jsonData = ResponseSucessMock().movies.data(using: .utf8)
        let expectedResult = try! JSONDecoder().decode(MainResponse.self, from: jsonData!)
        
        //When
        sut?.getMovies(page: 1, onCompletion: { response in
            if case .success (let success) = response.result {
                resultReceived = success.results
                exp.fulfill()
            }
        })
        
        //Then
        wait(for: [exp], timeout: 1.0)
        XCTAssertEqual(expectedResult.results?.count, resultReceived?.count)
    }
    
}
