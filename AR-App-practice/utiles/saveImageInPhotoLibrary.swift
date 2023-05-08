import PhotosUI

//参考 https://zenn.dev/naoya_maeda/articles/5626f0f65f7b4b
func saveImageInPhotoLibrary(
    image:Data,
    successExecution:@escaping ()->Void,
    errorExecution:@escaping ()->Void
){
    
    PHPhotoLibrary.shared().performChanges({
        let creationRequest = PHAssetCreationRequest.forAsset()
        let options = PHAssetResourceCreationOptions()
        options.shouldMoveFile = true
        creationRequest.addResource(
            with: .photo,
            data: image,
            options: options
        )
    }){ (isSuccess, error) in
           if isSuccess {
               successExecution()
            } else {
                errorExecution()
            }
        }
}
