@_private(sourceFile: "ContentView.swift") import PDF2Excel
import func SwiftUI.__designTimeSelection
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
        __designTimeSelection(ContentView(), "#4619.[4].[0].property.[0].[0]")
    
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
        
        for line in __designTimeSelection(lines, "#4619.[3].[9].[2].sequence") {
            let components = line.split(separator: __designTimeString("#4619.[3].[9].[2].[0].value.modifier[0].arg[0].value", fallback: ";"))
            if components.count == 3 {
                __designTimeSelection(rows.append("\(__designTimeSelection(components[__designTimeInteger("#4619.[3].[9].[2].[1].[0].[0].modifier[0].arg[0].value.[1].value.arg[0].value.[0].value", fallback: 0)], "#4619.[3].[9].[2].[1].[0].[0].modifier[0].arg[0].value.[1].value.arg[0].value")); \(__designTimeSelection(components[__designTimeInteger("#4619.[3].[9].[2].[1].[0].[0].modifier[0].arg[0].value.[3].value.arg[0].value.[0].value", fallback: 1)], "#4619.[3].[9].[2].[1].[0].[0].modifier[0].arg[0].value.[3].value.arg[0].value")); \(__designTimeSelection(components[__designTimeInteger("#4619.[3].[9].[2].[1].[0].[0].modifier[0].arg[0].value.[5].value.arg[0].value.[0].value", fallback: 2)], "#4619.[3].[9].[2].[1].[0].[0].modifier[0].arg[0].value.[5].value.arg[0].value"));"), "#4619.[3].[9].[2].[1].[0].[0]")
            }
        }
        
        return __designTimeSelection(rows, "#4619.[3].[9].[3]")
    
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
        __designTimeSelection(panel.begin { response in
            if response == .OK {
                self.destinationFolderURL = panel.url
                self.showAlert = __designTimeBoolean("#4619.[3].[7].[4].modifier[0].arg[0].value.[0].[0].[1].[0]", fallback: true)
                self.alertMessage = "Selected Folder: \(self.destinationFolderURL?.path ?? __designTimeString("#4619.[3].[7].[4].modifier[0].arg[0].value.[0].[0].[2].[0].[1].value.arg[0].value.[0]", fallback: ""))"
            }
        }, "#4619.[3].[7].[4]")
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: selectPDF()) private func __preview__selectPDF() {
        #sourceLocation(file: "/Users/bahito/Library/Mobile Documents/com~apple~CloudDocs/Developer/PDF2Excel/PDF2Excel/PDF2Excel/ContentView.swift", line: 47)
        let panel = NSOpenPanel()
        panel.allowedContentTypes = [UTType.pdf]
        __designTimeSelection(panel.begin { response in
            if response == .OK {
                self.pdfURL = panel.url
                self.showAlert = __designTimeBoolean("#4619.[3].[6].[2].modifier[0].arg[0].value.[0].[0].[1].[0]", fallback: true)
                self.alertMessage = "Selected PDF: \(self.pdfURL?.path ?? __designTimeString("#4619.[3].[6].[2].modifier[0].arg[0].value.[0].[0].[2].[0].[1].value.arg[0].value.[0]", fallback: ""))"
            }
        }, "#4619.[3].[6].[2]")
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/bahito/Library/Mobile Documents/com~apple~CloudDocs/Developer/PDF2Excel/PDF2Excel/PDF2Excel/ContentView.swift", line: 13)
        __designTimeSelection(VStack {
            __designTimeSelection(HStack {
                __designTimeSelection(Button(action: __designTimeSelection(selectPDF, "#4619.[3].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value")) {
                    __designTimeSelection(Text(__designTimeString("#4619.[3].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[0].value", fallback: "Select PDF")), "#4619.[3].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0]")
                        
                }
                .padding(), "#4619.[3].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[0]")
                
                
                __designTimeSelection(Button(action: __designTimeSelection(selectDestinationFolder, "#4619.[3].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value")) {
                    __designTimeSelection(Text(__designTimeString("#4619.[3].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0].arg[0].value", fallback: "Destination")), "#4619.[3].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[1].value.[0]")
                }
                .padding(), "#4619.[3].[5].property.[0].[0].arg[0].value.[0].arg[0].value.[1]")
            }, "#4619.[3].[5].property.[0].[0].arg[0].value.[0]")
            
            __designTimeSelection(HStack {
                __designTimeSelection(TextField(__designTimeString("#4619.[3].[5].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[0].value", fallback: "Enter file name"), text: __designTimeSelection($fileName, "#4619.[3].[5].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[1].value"))
                    .padding()
                    .textFieldStyle(__designTimeSelection(RoundedBorderTextFieldStyle(), "#4619.[3].[5].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[1].arg[0].value")), "#4619.[3].[5].property.[0].[0].arg[0].value.[1].arg[0].value.[0]")
                
                __designTimeSelection(Button(action: __designTimeSelection(executeConversion, "#4619.[3].[5].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[0].value")) {
                    __designTimeSelection(Text(__designTimeString("#4619.[3].[5].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[1].value.[0].arg[0].value", fallback: "Execute")), "#4619.[3].[5].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[1].value.[0]")
                }
                .padding(), "#4619.[3].[5].property.[0].[0].arg[0].value.[1].arg[0].value.[1]")
            }, "#4619.[3].[5].property.[0].[0].arg[0].value.[1]")
        }
        .frame(width: __designTimeInteger("#4619.[3].[5].property.[0].[0].modifier[0].arg[0].value", fallback: 400), height: __designTimeInteger("#4619.[3].[5].property.[0].[0].modifier[0].arg[1].value", fallback: 200))
        .padding()
        .alert(isPresented: __designTimeSelection($showAlert, "#4619.[3].[5].property.[0].[0].modifier[2].arg[0].value")) {
            __designTimeSelection(Alert(title: __designTimeSelection(Text(__designTimeString("#4619.[3].[5].property.[0].[0].modifier[2].arg[1].value.[0].arg[0].value.arg[0].value", fallback: "Message")), "#4619.[3].[5].property.[0].[0].modifier[2].arg[1].value.[0].arg[0].value"), message: __designTimeSelection(Text(__designTimeSelection(alertMessage, "#4619.[3].[5].property.[0].[0].modifier[2].arg[1].value.[0].arg[1].value.arg[0].value")), "#4619.[3].[5].property.[0].[0].modifier[2].arg[1].value.[0].arg[1].value"), dismissButton: .default(__designTimeSelection(Text(__designTimeString("#4619.[3].[5].property.[0].[0].modifier[2].arg[1].value.[0].arg[2].value.arg[0].value.arg[0].value", fallback: "OK")), "#4619.[3].[5].property.[0].[0].modifier[2].arg[1].value.[0].arg[2].value.arg[0].value"))), "#4619.[3].[5].property.[0].[0].modifier[2].arg[1].value.[0]")
        }, "#4619.[3].[5].property.[0].[0]")
    
#sourceLocation()
    }
}

import struct PDF2Excel.ContentView
import struct PDF2Excel.ContentView_Previews

