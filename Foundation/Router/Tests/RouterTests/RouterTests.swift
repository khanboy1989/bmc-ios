import XCTest
@testable import Router

final class RouterTests: XCTestCase {
  
    var sut: Router!
    
    override func setUp() {
        super.setUp()
        sut = .init()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testNavigate() {
        sut.navigate(to: MockRouteDestination.navigateOne)
        XCTAssertEqual(sut.navPath.count, 1)
        
        sut.navigateBack()
        XCTAssertEqual(sut.navPath.count, 0)
        
        sut.navigate(to: MockRouteDestination.navigateTwo)
        sut.navigateToRoot()
        XCTAssertEqual(sut.navPath.count, 0)
    }
    
    
    func testPresentedSheet() throws {
        sut.presentSheet(destination: MockPresenter.showError)
        XCTAssertEqual(sut.presentedSheet?.destination.id as? String, "showError")
    }
}
