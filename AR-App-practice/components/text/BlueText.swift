

import Foundation
import SwiftUI
struct BlueText:View{
    
    let label:String;
    let width:CGFloat
    let heigth:CGFloat
    
    init(label: String,width: CGFloat, heigth: CGFloat=60) {
        self.label = label
        self.width = width
        self.heigth = heigth
    }
    
    var body:some View{
    
            Text(label).font(.system(size:24)).frame(width: width,height: heigth).foregroundColor(Color.white).background(Color.blue).cornerRadius(24)
            }
    
}
