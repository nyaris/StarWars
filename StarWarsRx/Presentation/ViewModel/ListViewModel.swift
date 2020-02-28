//
//  ListViewModel.swift
//  StarWarsRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 28/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


public protocol ListViewModelContract {
    func getSW()
    func getSW(at index: Int) -> SWResponse?
}

public class ListViewModel: ListViewModelContract {
    
    private let swListRelay: BehaviorRelay<[SWResponse]?> =
        BehaviorRelay(value: nil)
    public var swList: Driver<[SWResponse]?> { return
        swListRelay.asDriver() }
    
    let disposeBag = DisposeBag()
    var usecase: SwUseCase
       
       init(usecase: SwUseCase) {
        self.usecase = usecase
        
    }
    
    public func getSW() {
        usecase.listSW().subscribe(onSuccess: { sw in
            self.swListRelay.accept(sw)
            }).disposed(by: disposeBag)
    }
    
    public func getSW(at index: Int) -> SWResponse? {
        return swListRelay.value?[index]
    }
    
}


