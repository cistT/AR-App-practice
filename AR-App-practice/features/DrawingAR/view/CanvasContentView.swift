import SwiftUI
import PencilKit
import PhotosUI

struct CanvasContentView:View{
    private var pkcView = PKCanvasView()
    private let toolPicker = PKToolPicker()
    
    private let drawingData:DrawingData
    
    @Environment(\.dismiss) var dismiss
    
    @State private var image:UIImage?
    @State private var isARView=false;
    @EnvironmentObject var drawingDataList:DrawingDataSource
    
    init(drawingData:DrawingData){
        self.drawingData = drawingData
    }

    var body:some View{
        
        VStack{
            HStack(spacing: 30){
                
                Button(action: {
                    image = pkcView.drawing.image(from: pkcView.bounds, scale: 1.0)
                    drawingDataList.update(
                        id: drawingData.id,
                        canvas: pkcView.drawing.image(from: pkcView.bounds, scale: 1.0).pngData()!,
                        pencilData: pkcView.drawing.dataRepresentation()
                    )
                    dismiss()
                }, label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 30, height: 30)
                })
                Spacer()
                
                Button(action:{
                    image = pkcView.drawing.image(from: pkcView.bounds, scale: 1.0)
                    isARView.toggle()
                }){
                    Image(systemName: "camera.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                }.navigationDestination(isPresented: $isARView) {
                    if let unwrappedImage = image{
                        ARContentView(image: unwrappedImage)
                    }
                  }
                
            }.padding(.top, 10).padding(.trailing, 30).padding(.bottom,20)
            
            Canvas(pkcView: pkcView,toolPicker:toolPicker,data:drawingData.pencilData)
            
        }.navigationBarBackButtonHidden(true)
        
       
    }
    
    
}
