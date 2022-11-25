//
//  Biopesticide.swift
//  Pestless
//
//  Created by Aulia Rahmi on 31/10/22.
//

import Foundation

struct BiopesticideData: Identifiable {
    let id = UUID()
    var name: String = ""
    var description: String = ""
    var usage: String = ""
    var ingredient: [String] = [""]
    var instruction: [String] = [""]
    var image: String = ""
    var pest: [PestData] = []
    //tambahin source: string
}

let biopesticideList: [BiopesticideData] = [
    //
    BiopesticideData(name: "Jeruk Nipis",
                     description: "",
                     usage: "Pemakaian 3-4 hari sekali",
                     ingredient: ["Jeruk nipis 1 buah","Sabun cuci piring cair 2-3 tetes","Air 1 liter"],
                     instruction: ["Potong jeruk nipis kecil kecil","Campurkan dengan 1 liter air","Tambahkan sabun","Aduk sampai rata","Diamkan selama 2-3 jam","Saring dan semprotkan pada tanaman yang terkena hama"],
                     image: "0",
                     pest: [PestList[1], PestList[4]]),
    BiopesticideData(name: "Ekstrak Bawang Putih",
                     description: "",
                     usage: "Campurkan 10 liter air kedalam larutan aduk rata dan semprotkan pada pagi hari",
                     ingredient: ["100 gram bawang putih","2 sdm minyak sayur","10 liter air","10 ml sabun cair/detergen"],
                     instruction: ["Campurkan bawang putih yang sudah dihaluskan dengan minyak sayur selama 24 jam","Tambahkan 1/2 liter air dan sabun","Aduk hingga rata dan saring"],
                     image: "Bawang putih",
                     pest: [PestList[1], PestList[2], PestList[4]]),
    BiopesticideData(name: "Tembakau",
                     description: "",
                     usage: "",
                     ingredient: ["Daun sirsak 50 lembar","Daun tembakau 1 genggam","Sabun colek 20 gram","Air 20 liter"],
                     instruction: ["Daun sirsak dan daun tembakau dihaluskan","Seluruh bahan diaduk dengan air 20 liter air","Endapkan semalam","Keesokan harinya larutan disaring","Larutan hasil saringan diencerkan dengan air sebanyak 50 – 60 liter","Larutan siap digunakan."],
                     image: "0",
                     pest: [PestList[2]]),
    BiopesticideData(name: "Daun Nimba dan Akar Tuba",
                     description: "",
                     usage: "",
                     ingredient: [""],
                     instruction: ["Setiap 1 kg bahan dihaluskan dan dilarutkan dalam 20 L air. takaran menyesuaikan kebutuhan. atau 100 gram campuran daun nimba dan akar tuba untuk 2liter air","Diamkan selama 3 hari dan siap digunakan"],
                     image: "0",
                     pest: [PestList[2], PestList[4]]),
    
    BiopesticideData(name: "Bawang putih dan lada",
                     description: "",
                     usage: " Semprotkan ke seluruh bagian tanaman yang terserang pada pagi atau sore hari",
                     ingredient: ["3 siung bawang putih", "1 sendok teh lada", "1 sendok sabun cair"],
                     instruction: ["Tambahkan sabun ke dalam minyak bawang putih.", "Aduk hingga rata.", "Tambahkan air lalu aduk kembali"],
                     pest: [PestList[0]]
                     
                    ),
    
    BiopesticideData(name: "Ekstrak daun kenikir",
                     description: "",
                     usage: "Semprotkan 3 kali sehari 50ml/ liter air",
                     ingredient: ["segenggam daun kenikir", "1 liter air"],
                     instruction: ["Haluskan daun kenikir lalu saring", "Rendam dengan air selama 24 jam", "Cairan dapat disemprotkan pada kepik"],
                     image: "",
                     pest: [PestList[4]])
]
