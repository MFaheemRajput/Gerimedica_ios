//
//  BeerListViewModel.swift
//  gerimedica
//
//  Created by Muhammad Faheem Khan on 24/07/2022.
//

import Foundation

class BeerListViewModel: ObservableObject {
    enum State {
        case idle
        case loading
        case failed(Failure)
        case loaded([Beer])
    }
    @Published private(set) var state = State.idle

    private var getBeerUsecase: GetBeerUsecase

    init(getBeerUsecase: GetBeerUsecase) {
        self.getBeerUsecase = getBeerUsecase
    }

    func load(page:Int) {
        // emitting loading
        state = .loading
        getBeerUsecase.getBeers(page: 1, perPage: 10) {[weak self] fail, success in
            if let failure = fail {
                self?.state = .failed(failure)
            }
            if let newBeers = success {
                self?.state = .loaded(newBeers)
            }
        }
    }
}
