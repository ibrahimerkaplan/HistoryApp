//
// DateAPI.swift
//

import Foundation
import Alamofire

open class DateAPI {
    /**
     Get dates from the server
     
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getDates(completion: @escaping ((_ data: ApiResponse?,_ error: Error?) -> Void)) {
        getDatesWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Get dates from the server
     - GET /date
     - 
     - responseHeaders: [X-Rate-Limit(Int), X-Expires-After(Date)]
     - responseHeaders: [X-Rate-Limit(Int), X-Expires-After(Date)]
     - examples: [{contentType=application/json, example={
  "date" : "February 7",
  "data" : {
    "Events" : [ {
      "no_year_html" : "<a href=\"https://wikipedia.org/wiki/Leo_I_the_Thracian\" title=\"Leo I the Thracian\">Leo I the Thracian</a> becomes emperor of the <a href=\"https://wikipedia.org/wiki/Byzantine_Empire\" title=\"Byzantine Empire\">Byzantine Empire</a>.",
      "year" : "457",
      "html" : "457 - <a href=\"https://wikipedia.org/wiki/Leo_I_the_Thracian\" title=\"Leo I the Thracian\">Leo I the Thracian</a> becomes emperor of the <a href=\"https://wikipedia.org/wiki/Byzantine_Empire\" title=\"Byzantine Empire\">Byzantine Empire</a>.",
      "links" : [ {
        "link" : "https://wikipedia.org/wiki/Leo_I_the_Thracian",
        "title" : "Leo I the Thracian"
      }, {
        "link" : "https://wikipedia.org/wiki/Leo_I_the_Thracian",
        "title" : "Leo I the Thracian"
      } ],
      "text" : "Leo I the Thracian becomes emperor of the Byzantine Empire.[1]"
    }, {
      "no_year_html" : "<a href=\"https://wikipedia.org/wiki/Leo_I_the_Thracian\" title=\"Leo I the Thracian\">Leo I the Thracian</a> becomes emperor of the <a href=\"https://wikipedia.org/wiki/Byzantine_Empire\" title=\"Byzantine Empire\">Byzantine Empire</a>.",
      "year" : "457",
      "html" : "457 - <a href=\"https://wikipedia.org/wiki/Leo_I_the_Thracian\" title=\"Leo I the Thracian\">Leo I the Thracian</a> becomes emperor of the <a href=\"https://wikipedia.org/wiki/Byzantine_Empire\" title=\"Byzantine Empire\">Byzantine Empire</a>.",
      "links" : [ {
        "link" : "https://wikipedia.org/wiki/Leo_I_the_Thracian",
        "title" : "Leo I the Thracian"
      }, {
        "link" : "https://wikipedia.org/wiki/Leo_I_the_Thracian",
        "title" : "Leo I the Thracian"
      } ],
      "text" : "Leo I the Thracian becomes emperor of the Byzantine Empire.[1]"
    } ],
    "Births" : [ {
      "no_year_html" : "<a href=\"https://wikipedia.org/wiki/Leo_I_the_Thracian\" title=\"Leo I the Thracian\">Leo I the Thracian</a> becomes emperor of the <a href=\"https://wikipedia.org/wiki/Byzantine_Empire\" title=\"Byzantine Empire\">Byzantine Empire</a>.",
      "year" : "457",
      "html" : "457 - <a href=\"https://wikipedia.org/wiki/Leo_I_the_Thracian\" title=\"Leo I the Thracian\">Leo I the Thracian</a> becomes emperor of the <a href=\"https://wikipedia.org/wiki/Byzantine_Empire\" title=\"Byzantine Empire\">Byzantine Empire</a>.",
      "links" : [ {
        "link" : "https://wikipedia.org/wiki/Leo_I_the_Thracian",
        "title" : "Leo I the Thracian"
      }, {
        "link" : "https://wikipedia.org/wiki/Leo_I_the_Thracian",
        "title" : "Leo I the Thracian"
      } ],
      "text" : "Leo I the Thracian becomes emperor of the Byzantine Empire.[1]"
    }, {
      "no_year_html" : "<a href=\"https://wikipedia.org/wiki/Leo_I_the_Thracian\" title=\"Leo I the Thracian\">Leo I the Thracian</a> becomes emperor of the <a href=\"https://wikipedia.org/wiki/Byzantine_Empire\" title=\"Byzantine Empire\">Byzantine Empire</a>.",
      "year" : "457",
      "html" : "457 - <a href=\"https://wikipedia.org/wiki/Leo_I_the_Thracian\" title=\"Leo I the Thracian\">Leo I the Thracian</a> becomes emperor of the <a href=\"https://wikipedia.org/wiki/Byzantine_Empire\" title=\"Byzantine Empire\">Byzantine Empire</a>.",
      "links" : [ {
        "link" : "https://wikipedia.org/wiki/Leo_I_the_Thracian",
        "title" : "Leo I the Thracian"
      }, {
        "link" : "https://wikipedia.org/wiki/Leo_I_the_Thracian",
        "title" : "Leo I the Thracian"
      } ],
      "text" : "Leo I the Thracian becomes emperor of the Byzantine Empire.[1]"
    } ],
    "Deaths" : [ {
      "no_year_html" : "<a href=\"https://wikipedia.org/wiki/Leo_I_the_Thracian\" title=\"Leo I the Thracian\">Leo I the Thracian</a> becomes emperor of the <a href=\"https://wikipedia.org/wiki/Byzantine_Empire\" title=\"Byzantine Empire\">Byzantine Empire</a>.",
      "year" : "457",
      "html" : "457 - <a href=\"https://wikipedia.org/wiki/Leo_I_the_Thracian\" title=\"Leo I the Thracian\">Leo I the Thracian</a> becomes emperor of the <a href=\"https://wikipedia.org/wiki/Byzantine_Empire\" title=\"Byzantine Empire\">Byzantine Empire</a>.",
      "links" : [ {
        "link" : "https://wikipedia.org/wiki/Leo_I_the_Thracian",
        "title" : "Leo I the Thracian"
      }, {
        "link" : "https://wikipedia.org/wiki/Leo_I_the_Thracian",
        "title" : "Leo I the Thracian"
      } ],
      "text" : "Leo I the Thracian becomes emperor of the Byzantine Empire.[1]"
    }, {
      "no_year_html" : "<a href=\"https://wikipedia.org/wiki/Leo_I_the_Thracian\" title=\"Leo I the Thracian\">Leo I the Thracian</a> becomes emperor of the <a href=\"https://wikipedia.org/wiki/Byzantine_Empire\" title=\"Byzantine Empire\">Byzantine Empire</a>.",
      "year" : "457",
      "html" : "457 - <a href=\"https://wikipedia.org/wiki/Leo_I_the_Thracian\" title=\"Leo I the Thracian\">Leo I the Thracian</a> becomes emperor of the <a href=\"https://wikipedia.org/wiki/Byzantine_Empire\" title=\"Byzantine Empire\">Byzantine Empire</a>.",
      "links" : [ {
        "link" : "https://wikipedia.org/wiki/Leo_I_the_Thracian",
        "title" : "Leo I the Thracian"
      }, {
        "link" : "https://wikipedia.org/wiki/Leo_I_the_Thracian",
        "title" : "Leo I the Thracian"
      } ],
      "text" : "Leo I the Thracian becomes emperor of the Byzantine Empire.[1]"
    } ]
  },
  "url" : "https://wikipedia.org/wiki/February_7"
}}]

     - returns: RequestBuilder<ApiResponse> 
     */
    open class func getDatesWithRequestBuilder() -> RequestBuilder<ApiResponse> {
        let path = "/date"
        let URLString = ClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<ApiResponse>.Type = ClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
