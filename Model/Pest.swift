import Foundation

struct PestData: Identifiable {
    let id = UUID()
    var name: String = ""
    var description: String = ""
    var identity: String = ""
    var plant: [String] = [""]
    var image: String = ""
    var biopests: [BiopesticideData] = []
    
    
}

let PestList: [PestData] = [
    PestData(name: "Ulat",
             description: "Ulat ini biasanya memakan daun pada tanaman, jika sudah berusia matang, ulat ini akan bertransformasi menjadi kupu-kupu",
             identity: "Warna tubuh ulat ini berkisar dari putih krem ​​hingga abu-abu kecokelatan dan juga dapat memiliki garis kuning di bagian atas tubuh. Ulat thistle dewasa memiliki panjang tubuh berkisar antara 1/5-1,75 inci",
             plant: ["jagung", "padi", "tomat", "bawang"],
             image: "thistle",
             biopests: [BiopesticideList[0], BiopesticideList[3]]
            ),
    PestData(name: "Aphid",
             description: "Tanda-tanda serangan kutu yang parah adalah daun bengkok dan melengkung, daun menguning, tunas kerdil atau mati, dan pertumbuhan tanaman yang buruk.",
             identity: "Kutu daun berukuran kecil (2-4 mm), berbentuk buah pir,dan bertubuh lunak. Mereka dapat berwarna hijau, hitam, merah, kuning, coklat atau abu-abu.",
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

