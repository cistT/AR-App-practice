import Foundation
import SwiftUI
struct BlueButton:View{
    
    let label:String;
    let action:() -> Void
    let width:CGFloat
    let heigth:CGFloat
    
    init(label: String, action: @escaping () -> Void, width: CGFloat, heigth: CGFloat=60) {
        self.label = label
        self.action = action
        self.width = width
        self.heigth = heigth
    }
    
    var body:some View{
        Button(action:action){
            Text(label).font(.system(size:24)).frame(width: width,height: heigth).foregroundColor(Color.white).background(Color.blue).cornerRadius(24)
        }
    }
    
}
