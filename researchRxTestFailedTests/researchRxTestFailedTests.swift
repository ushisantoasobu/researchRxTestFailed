//
//  researchRxTestFailedTests.swift
//  researchRxTestFailedTests
//
//  Created by shunsuke.sato on 2019/08/02.
//  Copyright © 2019 shunsuke.sato. All rights reserved.
//

import XCTest
import RxSwift
import RxTest
@testable import researchRxTestFailed

class researchRxTestFailedTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample1() {
        let presenter1 = SomePresenter(repository: MockedSomeRepository(),
                                      subscribeScheduler: ConcurrentMainScheduler.instance)
        presenter1.some()
        XCTAssertEqual(presenter1.list.count, 2)
    }

    func testExample2() {
        let presenter2 = SomePresenter(repository: MockedSomeRepository(),
                                      subscribeScheduler: ConcurrentMainScheduler.instance)
        presenter2.some()
        XCTAssertEqual(presenter2.list.count, 2)
    }

    func testExample3() {
        let presenter3 = SomePresenter(repository: MockedSomeRepository(),
                                      subscribeScheduler: SerialDispatchQueueScheduler.init(qos: .default))
        presenter3.some()
        XCTAssertEqual(presenter3.list.count, 2)
    }

    func testExample4() {
        let presenter4 = SomePresenter(repository: MockedSomeRepository(),
                                      subscribeScheduler: ConcurrentMainScheduler.instance)
        presenter4.some()
        XCTAssertEqual(presenter4.list.count, 2)
    }

    func testExample5() {
        let presenter5 = SomePresenter(repository: MockedSomeRepository(),
                                      subscribeScheduler: ConcurrentMainScheduler.instance)
        presenter5.some()
        XCTAssertEqual(presenter5.list.count, 2)
    }

    class MockedSomeRepository: SomeRepository {
        func getSome() -> Single<[SomeEntity]> {
            return Single.just(
                [
                    SomeEntity(id: 100, name: "hoge"),
                    SomeEntity(id: 101, name: "fuga")
                ]
            )
        }
    }
}
