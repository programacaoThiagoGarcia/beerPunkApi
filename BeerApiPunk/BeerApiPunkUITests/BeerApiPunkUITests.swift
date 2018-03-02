//
//  BeerApiPunkUITests.swift
//  BeerApiPunkUITests
//
//  Created by Thiago Garcia on 27/02/18.
//  Copyright © 2018 Thiago Garcia. All rights reserved.
//

import XCTest

class BeerApiPunkUITests: XCTestCase {
    var app : XCUIApplication!
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
        

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testeListDidSelect(){
        
        app.launch()
        
        let beersButton = app.navigationBars["BeerApiPunk.DetailProductView"].buttons["Beers"]
        
        let tablesQuery = app.tables
        
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Buzz"]/*[[".cells[\"Buzz, Teor Alcoólico:, 4.5 %vol\"].staticTexts[\"Buzz\"]",".staticTexts[\"Buzz\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        beersButton.tap()
        
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Fake Lager"].swipeUp()/*[[".cells[\"Fake Lager, Teor Alcoólico:, 4.7 %vol\"].staticTexts[\"Fake Lager\"]",".swipeUp()",".swipeRight()",".staticTexts[\"Fake Lager\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,1]]@END_MENU_TOKEN@*/
        
        
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Rabiator"]/*[[".cells[\"Rabiator, Teor Alcoólico:, 10.27 %vol\"].staticTexts[\"Rabiator\"]",".staticTexts[\"Rabiator\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Storm"]/*[[".cells[\"Storm, Teor Alcoólico:, 8.0 %vol\"].staticTexts[\"Storm\"]",".staticTexts[\"Storm\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        beersButton.tap()
        
    }
    
    func testeTransferData(){
        app.launch()
        
        let table       = app.tables
        
        table.staticTexts["Buzz"].tap()
        
        let label       = app.staticTexts["Buzz"]
        
        XCTAssert(label.exists)
        
        
    }
    
    func testeTransRetur(){
        app.launch()
        let beersButton = app.navigationBars["BeerApiPunk.DetailProductView"].buttons["Beers"]
        let table = app.tables
        let i = table.count
        
        table.staticTexts["Buzz"].tap()
        let nome    = app.staticTexts["Buzz"]
        let avd     = app.staticTexts["4.5 %vol"]
        let ivu     = app.staticTexts["60.0"]
        let tagLine = app.staticTexts["A Real Bitter Experience"]
        
        XCTAssert(nome.exists)
        XCTAssert(avd.exists)
        XCTAssert(ivu.exists)
      //  XCTAssert(tagLine.exists)
        
        beersButton.tap()
        
        XCTAssert(table.count == i)
        
        
    }
    
    func testeRequest(){
        app.launch()
        let table = app.tables
        let i = table.count
        
        table.cells["Fake Lager, Teor Alcoólico:, 4.7 %vol"].swipeUp()
        table.cells["Mixtape 8, Teor Alcoólico:, 14.5 %vol"].swipeUp()
        table.cells["Vice Bier, Teor Alcoólico:, 4.3 %vol"].swipeUp()
        table.cells["Bad Pixie, Teor Alcoólico:, 4.7 %vol"].swipeUp()
        
        dump(table.count)
        XCTAssert(table.count == (i * 2) )
        
        
    }
    
    
}
