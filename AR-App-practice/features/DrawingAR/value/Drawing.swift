import SwiftUI

struct DrawingData :Identifiable{
    let id:UUID
    let userID:String
    let title:String
    let canvas:Data?
    let pencilData:Data?
    let registrationDate:Date
    let upDateDate:Date
    
    init(
        id: UUID = UUID(),
        userID: String,
        title: String,
        canvas: Data?,
        pencilData:Data?,
        registrationDate:Date,
        upDateDate: Date
    ) {
        self.id = id
        self.userID = userID
        self.title = title
        self.canvas = canvas
        self.pencilData=pencilData
        self.registrationDate = registrationDate
        self.upDateDate = upDateDate
    }
    
    
}

class DrawingDataSource:ObservableObject{
    @Published var drawingDataList:[DrawingData] = []
    
    func add(new:DrawingData){
        drawingDataList += [new]
    }
    
    func update(id:UUID,canvas:Data,pencilData:Data){
        drawingDataList=drawingDataList.map{

            if $0.id == id{
                return DrawingData(id:$0.id,userID: $0.userID, title: $0.title, canvas:canvas, pencilData:pencilData, registrationDate: $0.registrationDate ,  upDateDate : Date())
                
            }
            return $0
        }

    }
}
