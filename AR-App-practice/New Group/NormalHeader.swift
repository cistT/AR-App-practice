import SwiftUI

struct NormalHeader:View{
    private let text:String
    
    init(text: String) {
        self.text = text
    }
    
    var body:some View{

        Text(text)
            .font(.system(size:32))
            .foregroundColor(Color.blue)
            .frame(height:40)

    }
}


