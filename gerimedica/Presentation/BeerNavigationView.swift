//
//  ContentView.swift
//  gerimedica
//
//  Created by Muhammad Faheem Khan on 23/07/2022.
//

import Combine
import SwiftUI
import Alamofire
struct BeerNavigationView: View {
    
    @State private var p:Int = 1
    @ObservedObject var viewModel = BeerListViewModel(getBeerUsecase: GetBeerUsecase())
    @State private var searchText = ""
    
    var body: some View {
        
        switch viewModel.state {
        case .idle:
            // Render a clear color and start the loading process
            // when the view first appears, which should make the
            // view model transition into its loading state:
            Color.clear.onAppear {
                viewModel.load(page: p)
            }
        case .loading:
            ProgressView()
        case .failed(let err):
            ErrorView(errString: "Not Implemented Yet") {
                viewModel.load(page: p)
            }
            
        case .loaded(let beers):
            
            NavigationView{
                VStack{
                    SearchBar(text: $searchText).padding(.top, 10.0)
                    List(beers.filter({ searchText.isEmpty ? true : $0.name!.lowercased().contains(searchText.lowercased()) })) { beer in
                        NavigationLink(destination: BeerDetailView(beer: beer)) {
                            BeerRow(beer: beer)
                            
                        }
                    }.onAppear {
                        p += 1
                    }//: LIST
                    .navigationTitle("Beers")
                }
            }//: NAVIGATION
        }
    }
}

#if DEBUG
//struct ContentView_Previews: PreviewProvider
//    static var previews: some View {
//        BeerNavigationView()
//    }
//}
#endif
