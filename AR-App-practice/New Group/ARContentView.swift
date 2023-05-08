import SwiftUI

struct ARContentView:View{
    
    @Environment(\.dismiss) var dismiss
    
    private let image:UIImage
    
    init(image:UIImage){
        self.image = image
    }
    
    var body :some View{
        
        ZStack{
            ImageObject(image:image)
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 30, height: 30)
            }).position(x:30,y:60)

        }.edgesIgnoringSafeArea(.all).navigationBarBackButtonHidden(true)
    }
}
