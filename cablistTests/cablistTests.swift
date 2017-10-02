//
//  cablistTests.swift
//  cablistTests
//
//  Created by Anjani on 9/29/17.
//  Copyright © 2017 Landmark Group. All rights reserved.
//

import XCTest
@testable import cablist

class cablistTests: XCTestCase {
    
    class MockView : ViewInterface {
        func showAlertWithMessage(_ msg: String) {}
        
        func updateWithList(_ list : [Taxi]?) {self.taxiList = list}
        func updateTaxiCountsInTab(active : Int, inactive : Int, all : Int) {}
        
        func toggleView() {}
        func mode()->PageMode {return PageMode.Active}

        func showLoader() {}
        func hideLoader() {}
        
        func showStatusBarLoader() {}
        func hideStatusBarLoader() {}
        
        var controller : ControllerAndViewInterface?
        var taxiList : [Taxi]?
    }
    
    class MockController : ControllerAndViewInterface, ControllerAndModelLayerInterface {
        func didFinishWithError(dictionary: [String : Any]) {}
        
        
        let taxi = Taxi(dictionary: ["id":12345])
        
        func getAllTaxisForBounds(_ bounds : (CLLocationCoordinate2D, CLLocationCoordinate2D)){}
        func activeTaxisTapped() {view?.updateWithList([taxi])}
        func InactiveTaxisTapped() {}
        func viewToggleTapped() {}
        func mapShownWithBounds(_ bounds : (CLLocationCoordinate2D, CLLocationCoordinate2D)) {}
        func listViewShownWithBounds(_ bounds : (CLLocationCoordinate2D, CLLocationCoordinate2D)) {}
        func mapRegionChangedWithBounds(_ bounds : (CLLocationCoordinate2D, CLLocationCoordinate2D)) {}
        func refreshControlValueChangedWithBound(_ bounds : (CLLocationCoordinate2D, CLLocationCoordinate2D)) {}
        
        func finishedFetchingAllTaxis(_ model : TaxiList?) {}
        func finishedFetchingActiveTaxis(_ model : TaxiList?) { XCTAssert(model?.activeTaxis![0].state == State.Active) }
        func finishedFetchingInactiveTaxis(_ model: TaxiList?) {}
        
        var view : ViewInterface?
        var modelLayer : ModelInterface?
    }
    
    class MockModelLayer : ModelInterface {
        
        var taxiList = TaxiList(dictionary:["poiList":[["id":3456, "state":"ACTIVE"]]])
        
        func getAllTaxisForBounds(_ bounds : (CLLocationCoordinate2D, CLLocationCoordinate2D)) {}
        func getActiveTaxis() {controller?.finishedFetchingActiveTaxis(taxiList)}
        func getInactiveTaxis() {}
        
        var controller : ControllerAndModelLayerInterface?
    }
    
    func testControllerAndViewInteraction() {
        let mockController = MockController()
        let mockView = MockView()
        
        mockController.view = mockView
        mockView.controller = mockController
        
        mockController.activeTaxisTapped()
        XCTAssert((mockView.taxiList?[0].id)! == 12345)
    }
    
    func testControllerAndModelLayerInteraction() {
        let mockController = MockController()
        let mockModelLayer = MockModelLayer()
        
        mockModelLayer.controller = mockController
        mockController.modelLayer = mockModelLayer
        mockModelLayer.getActiveTaxis()
    }
    
    func testNetworkManager() {
        
        let expectation = XCTestExpectation(description: "network test")
        
        let urlString = "https://poi-api.mytaxi.com/PoiService/poi/v1?p2Lat=50.8828525604149&p1Lon=-10.0941294239988&p1Lat=69.7750286478591&p2Lon=29.3894050239987"
        let urlRequest = URLRequest(url: URL(string: urlString)!)
        NetworkManager.shared.fireRequest(urlRequest) { (dict) in
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 4)
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}
