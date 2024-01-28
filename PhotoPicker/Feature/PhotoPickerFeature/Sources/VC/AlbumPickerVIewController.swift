//
//  AlbumPickerVIewController.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/28/24.
//

import UIKit
import Photos

protocol AlbumPickerVIewControllerDelegate : AnyObject {
    func selected(_ album: AlbumInfo)
}

class AlbumPickerVIewController: UIViewController {

    weak var delegate : AlbumPickerVIewControllerDelegate?
    
    var pickerView : UIPickerView = {
        
        let view  = UIPickerView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
    
        return view
        
    }()
    
    var data: [AlbumInfo] = []
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .setColor(.bg)

        addSubviews()
        setLayout()
        getAlbums { [weak self] data in
            
            guard let self else {return}
            
            self.data = data
            
        }

    }
    
}

extension AlbumPickerVIewController {
    
    func addSubviews() {
        self.view.addSubview(pickerView)
    }
    
    func setLayout() {
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        pickerView.setLeft(anchor: view.leftAnchor, constant: .zero)
        pickerView.setTop(anchor: view.topAnchor, constant: .zero)
        pickerView.setBottom(anchor: view.bottomAnchor, constant: .zero)
        pickerView.setRight(anchor: view.rightAnchor, constant: .zero)
    }
    
    public func getAlbums(completion: @escaping ([AlbumInfo]) -> Void) {
        
        
        var allAlbums = [AlbumInfo]()
        defer {
            completion(allAlbums)
        }
        let getSortDescriptors = [
            NSSortDescriptor(key: "creationDate", ascending: false),
            
        ] // 최근 항목
        //PHFetchOptions: predicate를 이용하여 sorting, mediaType 등을 쿼리하는데 사용
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = getSortDescriptors
        let standardAlbum = PHAsset.fetchAssets(with: fetchOptions)
        allAlbums.append(
            .init(
                id: nil,
                name: "최근 앨범",
                album: standardAlbum
            )
        )
        
        

        let userAlbums = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .albumRegular, options: PHFetchOptions())
        
       
        guard 0 < userAlbums.count else { return }
        userAlbums.enumerateObjects { userAlbum, index, pointer in
            
            DEBUG_LOG("Title: \(userAlbum.localizedTitle)")
            
          guard index <= userAlbums.count - 1 else {
            pointer.pointee = true
            return
          }

            let fetchOptions = PHFetchOptions()
            fetchOptions.sortDescriptors = getSortDescriptors
            let album = PHAsset.fetchAssets(in: userAlbum, options: fetchOptions)
            allAlbums.append(
              .init(
                id: userAlbum.localIdentifier,
                name: userAlbum.localizedTitle ?? "",
                album: album
              )
            )
          
        }
      }
}
 
extension AlbumPickerVIewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(data[row].name)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        DEBUG_LOG(data[row].name)
        delegate?.selected(data[row])
        self.dismiss(animated: true)
    }
    
    
}
