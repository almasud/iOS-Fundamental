//
//  ViewController.swift
//  HelloWorld
//
//  Created by Almasud on 21/12/20.
//

import UIKit

class MainViewController: UIViewController {
    // a few constants that identify what element names we're looking for inside the XML
//    let recordKey = "InsuranceCompanies"
    let recordKey = "clasic"
//    let dictionaryKeys = Set<String>(["Time", "Top_Insurance_Companies", "No", "Name", "Market_Capitalization"])
    let dictionaryKeys = Set<String>(["app", "version", "chatbox-text"])
    
    // a few variables to hold the results as we parse the XML
    var results: [[String: String]]?         // the whole array of dictionaries
    var currentDictionary: [String: String]? // the current dictionary
    var currentValue: String?                // the current value for one of the keys in the dictionary

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func parseXMLOnline(_ sender: Any) {
        let url = URL(string: "https://raw.githubusercontent.com/efusion-nishida/hcgc-app/main/app-info.xml")
//        let url = URL(string: "https://dl.dropbox.com/s/pciza7sj9c1oah9/sample-1.xml")
        
        let urlRequest = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                print(error ?? "Unknown error")
                return
            }
            
            let parser = XMLParser(data: data)
            parser.delegate = self
            if parser.parse() {
                print(self.results ?? "No results")
            }
        }
        task.resume()
    }
    
    @IBAction func postRequest(_ sender: UIButton) {
        // GraphQL request dictionary
        let graphQLDict: [String: Any] = ["query": """
                query { queryArtists (byName: "artist") {
                    name
                    image
                    albums {
                        name
                        }
                    }
                }
            """]
        // Convert graphQLDict to Json
        let jsonData = try? JSONSerialization.data(withJSONObject: graphQLDict)
        
        // create post request
        let url = URL(string: "https://spotify-graphql-server.herokuapp.com/graphql")!
        var request = URLRequest(url: url)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")  // the request is JSON
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        
        // insert json data to the request
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }
        
        task.resume()
    }
}

extension MainViewController: XMLParserDelegate {
    
    // initialize results structure
    
    func parserDidStartDocument(_ parser: XMLParser) {
        results = []
    }
    
    // start element
    //
    // - If we're starting a "record" create the dictionary that will hold the results
    // - If we're starting one of our dictionary keys, initialize `currentValue` (otherwise leave `nil`)
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        if elementName == recordKey {
            currentDictionary = [:]
        } else if dictionaryKeys.contains(elementName) {
            currentValue = ""
        }
    }
    
    // found characters
    //
    // - If this is an element we care about, append those characters.
    // - If `currentValue` still `nil`, then do nothing.
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        currentValue? += string
    }
    
    // end element
    //
    // - If we're at the end of the whole dictionary, then save that dictionary in our array
    // - If we're at the end of an element that belongs in the dictionary, then save that value in the dictionary
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == recordKey {
            results!.append(currentDictionary!)
            currentDictionary = nil
        } else if dictionaryKeys.contains(elementName) {
            currentDictionary![elementName] = currentValue
            currentValue = nil
        }
    }
    
    // Just in case, if there's an error, report it. (We don't want to fly blind here.)
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print(parseError)
        
        currentValue = nil
        currentDictionary = nil
        results = nil
    }
    
}
