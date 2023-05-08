import Foundation
import SwiftUI

struct CanvasPreview:View{

    private let imageData:Data?
    init(imageData: Data?) {
        self.imageData = imageData
    }

    var body:some View{
         
        if let image = imageData{
            Image(uiImage: UIImage(data: image )!).resizable().border(Color.white,width: 1).frame(width: 150, height: 200)
        }else{
            EmptyView().border(Color.white,width: 1).frame(width: 150, height: 200)
        }

    }
}
