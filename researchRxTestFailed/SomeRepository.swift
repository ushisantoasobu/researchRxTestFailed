//
//  SomeRepository.swift
//  researchRxTestFailed
//
//  Created by shunsuke.sato on 2019/08/02.
//  Copyright © 2019 shunsuke.sato. All rights reserved.
//

import Foundation
import RxSwift

protocol SomeRepository {
    func getSome() -> Single<[SomeEntity]>
}

struct SomeRepositoryImpl: SomeRepository {
    func getSome() -> Single<[SomeEntity]> {
        return Single.just(
            [
                SomeEntity(id: 1, name: "aaa"),
                SomeEntity(id: 2, name: "bbb"),
            ]
        )
    }
}
