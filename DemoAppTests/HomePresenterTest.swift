//
//  HomePresenterTest.swift
//  DemoAppTests
//
//  Created by Derlys Hector Benito Baldeon on 4/09/24.
//

import XCTest
@testable import DemoApp

final class HomePresenterTest: XCTestCase {
    
    var sut: HomePresenter?
    var view: HomeViewSpy?
    var router: HomeRouterSpy?
    var interactor: HomeInteractorMock?
    
    override func setUp() {
        super.setUp()
        let view = HomeViewSpy()
        let router = HomeRouterSpy()
        let interactor = HomeInteractorMock()
        
        let sut = HomePresenter()
        sut.router = router
        sut.interactor = interactor
        sut.view = view
        
        self.router = router
        self.view = view
        self.interactor = interactor
        self.sut = sut
        
    }
    
    override func tearDown() {
        super.tearDown()
        self.router = nil
        self.view = nil
        self.interactor = nil
        self.sut = nil
    }
    
    func test_givenPresenter_whenDoGetMoviesSuccess_thenReloadCollectionView(){
        //Given
        
        //When
        sut?.dogetMoviesSuccess()
        
        //Then
        XCTAssertEqual(view?.isReloadCollectionView, true, "view?.reloadCollectionView was reloaded")
    }
    
    func test_givenPresenter_whenGoToDetailModule_thenNavigateToDetailModule(){
        
        //Given
        let model = ResultsResponse(imageMovie: "", posterPath: "", title: "", rating: 2.1, releaseDate: "", overview: "")
        
        //When
        sut?.goToDetailModule(movie: model)
        
        //Then
        XCTAssertEqual(router?.isNavigateToDetailModule, true, "router?.isNavigateToDetailModule is true")
    }
    
}
