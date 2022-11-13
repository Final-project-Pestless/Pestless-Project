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
    var pest: [String] = [""]
}

let BiopesticideList: [BiopesticideData] = [
    BiopesticideData(name: "Daun Pepaya, Daun Sirsak, Serai dan Lidah Buaya, Bawang Putih",
                     description: "",
                     usage: "1 liter untuk 5- 10 liter air, semprotkan 3 hari sekali",
                     ingredient: ["1 lembar daun pepaya","15 lembar daun sirsak","2 batang serai","1 batang lidah buaya sedang","bawang putih 3 siung","air 1 liter"],
                     instruction: ["Potong semua bahan, lalu blender","tambahkan 1 liter air dan simpan selama 24 jam maksimal 1 minggu"],
                     image: "",
                     pest: ["Arphid"]),
    BiopesticideData(name: "Jeruk Nipis",
                     description: "",
                     usage: "Pemakaian 3-4 hari sekali",
                     ingredient: ["Jeruk nipis 1 buah","Sabun cuci piring cair 2-3 tetes","Air 1 liter"],
                     instruction: ["Potong jeruk nipis kecil kecil","Campurkan dengan 1 liter air","Tambahkan sabun","Aduk sampai rata","Diamkan selama 2-3 jam","Saring dan semprotkan pada tanaman yang terkena hama"],
                     image: "",
                     pest: ["Arphid"]),
    BiopesticideData(name: "Ekstrak Bawang Putih",
                     description: "",
                     usage: "Campurkan 10 liter air kedalam larutan aduk rata dan semprotkan pada pagi hari",
                     ingredient: ["100 gram bawang putih","2 sdm minyak sayur","10 liter air","10 ml sabun cair/detergen"],
                     instruction: ["Campurkan bawang putih yang sudah dihaluskan dengan minyak sayur selama 24 jam","Tambahkan 1/2 liter air dan sabun","Aduk hingga rata dan saring"],
                     image: "",
                     pest: ["Arphid","Hama kubis","Belalang"]),
    BiopesticideData(name: "Tembakau",
                     description: "",
                     usage: "",
                     ingredient: [""],
                     instruction: [""],
                     image: "",
                     pest: [""])
]
