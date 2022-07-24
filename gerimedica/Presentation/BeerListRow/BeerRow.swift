//
//  BeerRow.swift
//  gerimedica
//
//  Created by Muhammad Faheem Khan on 23/07/2022.
//

import SwiftUI
    
/**AsyncImage(url: URL(string: "https://static01.nyt.com/images/2011/01/14/arts/14MOVING-span/MOVING-jumbo.jpg")).scaledToFit().frame( maxWidth: 40.0,  maxHeight: 40.0, alignment:.center)
 **/

struct BeerRow: View {
    var beer:Beer?
    var body: some View {
        HStack {
            Text(beer?.name ?? "")
        }.frame( height: 60.0)
    }
}

struct BeerRow_Previews: PreviewProvider {
    static var previews: some View {
        BeerRow()
    }
}
