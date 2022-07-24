//
//  BeerDetailView.swift
//  gerimedica
//
//  Created by Muhammad Faheem Khan on 23/07/2022.
//

import SwiftUI

struct BeerDetailView: View {
    var beer:Beer?
    var body: some View {
        ScrollView {
        VStack{
            AsyncImage(url: URL(string: (beer?.image_url)!), scale: 1.5) { image in
                        image
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        Color.gray
                    }
                    .padding([.leading, .trailing], 15.0)
                    .padding(.top, 0.0)
                    .frame(height: 240)
            
            Spacer()
            Text((beer?.name)!).padding(.horizontal, 12.0)
            Text((beer?.description)!).padding([.horizontal,.vertical],12.0)
        }
        }
    }
}

struct BeerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BeerDetailView()
    }
}
