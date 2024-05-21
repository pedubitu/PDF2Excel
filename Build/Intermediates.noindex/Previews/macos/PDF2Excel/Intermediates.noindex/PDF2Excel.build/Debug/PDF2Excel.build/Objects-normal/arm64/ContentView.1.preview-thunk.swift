@_private(sourceFile: "ContentView.swift") import PDF2Excel
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import UniformTypeIdentifiers
import protocol SwiftUI.View
import SwiftUI
import PDFKit

extension ContentView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/bahito/Library/Mobile Documents/com~apple~CloudDocs/Developer/PDF2Excel/PDF2Excel/PDF2Excel/ContentView.swift", line: 134)
        ContentView()
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: saveCSV(rows:to:)) private func __preview__saveCSV(rows: [String], to url: URL) throws {
        #sourceLocation(file: "/Users/bahito/Library/Mobile Documents/com~apple~CloudDocs/Developer/PDF2Excel/PDF2Excel/PDF2Excel/ContentView.swift", line: 127)
        let csvString = rows.joined(separator: "\n")
        try csvString.write(to: url, atomically: __designTimeBoolean("#4619.[3].[10].[1].[0]", fallback: true), encoding: .utf8)
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: parseTextToCSV(text:)) private func __preview__parseTextToCSV(text: String) -> [String] {
        #sourceLocation(file: "/Users/bahito/Library/Mobile Documents/com~apple~CloudDocs/Developer/PDF2Excel/PDF2Excel/PDF2Excel/ContentView.swift", line: 113)
        let lines = text.split(separator: "\n").dropFirst()
        var rows: [String] = []
        
        for line in lines {
            let components = line.split(separator: __designTimeString("#4619.[3].[9].[2].[0].value.modifier[0].arg[0].value", fallback: ";"))
            if components.count == 3 {
                rows.append("\(components[__designTimeInteger("#4619.[3].[9].[2].[1].[0].[0].modifier[0].arg[0].value.[1].value.arg[0].value.[0].value", fallback: 0)]); \(components[__designTimeInteger("#4619.[3].[9].[2].[1].[0].[0].modifier[0].arg[0].value.[3].value.arg[0].value.[0].value", fallback: 1)]); \(components[__designTimeInteger("#4619.[3].[9].[2].[1].[0].[0].modifier[0].arg[0].value.[5].value.arg[0].value.[0].value", fallback: 2)]);")
            }
        }
        
        return rows
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: executeConversion()) private func __preview__executeConversion() {
        #sourceLocation(file: "/Users/bahito/Library/Mobile Documents/com~apple~CloudDocs/Developer/PDF2Excel/PDF2Excel/PDF2Excel/ContentView.swift", line: 73)
        guard let pdfURL = pdfURL, let destinationFolderURL = destinationFolderURL else {
            self.alertMessage = "Please select a PDF and destination folder."
            self.showAlert = true
            return
        }
        
        do {
            let pdfDocument = PDFDocument(url: pdfURL)
            guard let pdfDocument = pdfDocument else {
                self.alertMessage = "Failed to load PDF."
                self.showAlert = true
                return
            }
            
            for i in 0..<pdfDocument.pageCount {
                guard let page = pdfDocument.page(at: i), let pageContent = page.string else {
                    self.alertMessage = "Failed to extract text from page \(i + 1)."
                    self.showAlert = true
                    continue
                }
                
                let rows = parseTextToCSV(text: pageContent)
                
                let fileURL = destinationFolderURL.appendingPathComponent("\(fileName)_\(i + 1).csv")
                
                do {
                    try saveCSV(rows: rows, to: fileURL)
                } catch {
                    self.alertMessage = "Failed to save CSV file: \(error.localizedDescription)"
                    self.showAlert = true
                    return
                }
            }
            
            self.alertMessage = "PDF converted to CSV successfully!"
            self.showAlert = true
        }
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: selectDestinationFolder()) private func __preview__selectDestinationFolder() {
        #sourceLocation(file: "/Users/bahito/Library/Mobile Documents/com~apple~CloudDocs/Developer/PDF2Excel/PDF2Excel/PDF2Excel/ContentView.swift", line: 59)
        let panel = NSOpenPanel()
        panel.canChooseDirectories = __designTimeBoolean("#4619.[3].[7].[1].[0]", fallback: true)
        panel.canCreateDirectories = __designTimeBoolean("#4619.[3].[7].[2].[0]", fallback: true)
        panel.canChooseFiles = __designTimeBoolean("#4619.[3].[7].[3].[0]", fallback: false)
        panel.begin { response in
            if response == .OK {
                self.destinationFolderURL = panel.url
                self.showAlert = __designTimeBoolean("#4619.[3].[7].[4].modifier[0].arg[0].value.[0].[0].[1].[0]", fallback: true)
                self.alertMessage = "Selected Folder: \(self.destinationFolderURL?.path ?? __designTimeString("#4619.[3].[7].[4].modifier[0].arg[0].value.[0].[0].[2].[0].[1].value.arg[0].value.[0]", fallback: ""))"
            }
        }
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: selectPDF()) private func __preview__selectPDF() {
        #sourceLocation(file: "/Users/bahito/Library/Mobile Documents/com~apple~CloudDocs/Developer/PDF2Excel/PDF2Excel/PDF2Excel/ContentView.swift", line: 47)
        let panel = NSOpenPanel()
        panel.allowedContentTypes = [UTType.pdf]
        panel.begin { response in
            if response == .OK {
                self.pdfURL = panel.url
                self.showAlert = __designTimeBoolean("#4619.[3].[6].[2].modifier[0].arg[0].value.[0].[0].[1].[0]", fallback: true)
                self.alertMessage = "Selected PDF: \(self.pdfURL?.path ?? __designTimeString("#4619.[3].[6].[2].modifier[0].arg[0].value.[0].[0].[2].[0].[1].value.arg[0].value.[0]", fallback: ""))"
            }
        }
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/bahito/Library/Mobile Documents/com~apple~CloudDocs/Developer/PDF2Excel/PDF2Excel/PDF2Excel/ContentView.swift", line: 13)
        VStack {
            HStack {
                Button(action: selectPDF) {
                    Text(__designTimeString("#4619.[3].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[0].value", fallback: "Select PDF"))
                        
                }
                .padding()
                
                
                Button(action: selectDestinationFolder) {
                    Text(__designTimeString("#4619.[3].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[0].value", fallback: "Destination"))
                }
                .padding()
            }
            
            HStack {
                TextField(__designTimeString("#4619.[3].[5].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value", fallback: "Enter file name"), text: $fileName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: executeConversion) {
                    Text(__designTimeString("#4619.[3].[5].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[1].value.[0].arg[0].value", fallback: "Execute"))
                }
                .padding()
            }
        }
        .frame(width: __designTimeInteger("#4619.[3].[5].property.[0].[0].modifier[0].arg[0].value", fallback: 400), height: __designTimeInteger("#4619.[3].[5].property.[0].[0].modifier[0].arg[1].value", fallback: 200))
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text(__designTimeString("#4619.[3].[5].property.[0].[0].modifier[2].arg[1].value.[0].arg[0].value.arg[0].value", fallback: "Message")), message: Text(alertMessage), dismissButton: .default(Text(__designTimeString("#4619.[3].[5].property.[0].[0].modifier[2].arg[1].value.[0].arg[2].value.arg[0].value.arg[0].value", fallback: "OK"))))
        }
    
#sourceLocation()
    }
}

import struct PDF2Excel.ContentView
import struct PDF2Excel.ContentView_Previews

