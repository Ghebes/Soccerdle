//
//  NavigationSetUP.swift
//  Soccerdle
//
//  Created by Michael Ghebranious on 8/24/23.
//

import SwiftUI

struct NavigationSetUP: View {
    @State var homeScreen: Bool = false
    var body: some View {
        if(!homeScreen){
            HomeView()
        }
    }
}

struct NavigationSetUP_Previews: PreviewProvider {
    static var previews: some View {
        NavigationSetUP()
    }
}
