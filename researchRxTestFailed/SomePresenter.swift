//
//  SomePresenter.swift
//  researchRxTestFailed
//
//  Created by shunsuke.sato on 2019/08/02.
//  Copyright © 2019 shunsuke.sato. All rights reserved.
//

import Foundation
import RxSwift

class SomePresenter {

    let repository: SomeRepository
    let subscribeScheduler: ImmediateSchedulerType

    var list: [SomeEntity] = []

    let bag = DisposeBag()

    init(repository: SomeRepository,
         subscribeScheduler: ImmediateSchedulerType) {
        self.repository = repository
        self.subscribeScheduler = subscribeScheduler
    }

    func some() {
        repository
            .getSome()
            .subscribeOn(subscribeScheduler)
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] list in
                guard let self = self else {
                    return
                }
                self.list = list
            }) { error in
                fatalError()
            }.disposed(by: bag)
    }
}
