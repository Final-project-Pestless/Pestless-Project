import Foundation

struct PestData: Identifiable {
    let id = UUID()
    var name: String = ""
    var description: String = ""
    var identity: String = ""
    var plant: [String] = [""]
    var image: String = ""
    
}

let PestList: [PestData] = [
    PestData(name: "Thistle Caterpillar",
             description: "",
             identity: "",
             plant: [""],
             image: ""
            ),
    PestData(name: "Aphid",
             description: "",
             identity: "",
             plant: [""],
             image: ""
            ),
    PestData(name: "Grasshopper",
             description: "",
             identity: "",
             plant: [""],
             image: ""
            ),
    PestData(name: "Mealybug",
             description: "",
             identity: "",
             plant: [""],
             image: ""
            ),
    PestData(name: "True bug",
             description: "",
             identity: "",
             plant: [""],
             image: ""
            )
]

