//
//  FileManagerExtension.swift
//  Dang Vu Gia Huy
//
//  Created by huy.dang on 9/9/24.
//

import Foundation

extension FileManager {
    
    private func getAppDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let appDirectory = path.first
        return appDirectory!
    }
    
    private func getFilePath(fileName: String) -> URL {
        let documentPath = self.getAppDocumentDirectory()
        let filePath = documentPath.appending(component: fileName)
        return filePath
    }
    
    func checkFileExist(fileName: String) {
        let filePath = self.getFilePath(fileName: fileName)
        let manager = FileManager.default
        
        if !manager.fileExists(atPath: filePath.path()) {
            if self.createFile(atPath: filePath.path(), contents: nil) {
                print("Create Success")
            } else {
                print("Create Fail")
                return
            }
        } else {
            print(filePath)
            return
        }
    }
    
    func readDataFrom(file name: String) -> Data {
        var data: Data = Data()
        do {
            data = try Data(contentsOf: self.getFilePath(fileName: name))
        } catch {
            print("get data fail")
        }
        return data
    }
    
    func writeDataTo(file name: String, with data: Data) -> Bool {
        do {
            try data.write(to: getFilePath(fileName: name))
            return true
        } catch {
            return false
        }
    }
}
