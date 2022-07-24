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
        VStack{
            AsyncImage(url: URL(string: (beer?.image_url)!), scale: 1.5) { image in
                        image
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        Color.gray
                    }
                    .padding([.top, .leading, .trailing], 15.0)
                    .frame(height: 240)
            
            Text((beer?.name)!)
            Text((beer?.description)!)
        }
        
    }
}

struct BeerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BeerDetailView()
    }
}
