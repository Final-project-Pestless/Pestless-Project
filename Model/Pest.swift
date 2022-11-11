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
             image: "thistle"
            ),
    PestData(name: "Aphid",
             description: "",
             identity: "",
             plant: [""],
             image: "arphid"
            ),
    PestData(name: "Grasshopper",
             description: "",
             identity: "",
             plant: [""],
             image: "grasshopper"
            ),
    PestData(name: "Mealybug",
             description: "",
             identity: "",
             plant: [""],
             image: "mealybug"
            ),
    PestData(name: "True bug",
             description: "",
             identity: "",
             plant: [""],
             image: "truebug"
            )
]

