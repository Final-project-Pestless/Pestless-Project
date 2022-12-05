//
//  Biopesticide.swift
//  Pestless
//
//  Created by Aulia Rahmi on 31/10/22.
//

import Foundation

struct BiopesticideData: Identifiable {
    var id: Int
    var name: String = "-"
    var description: String = "-"
    var usage: String = "-"
    var ingredient: [String] = ["-"]
    var instruction: [String] = ["-"]
    var image: String = "pesnab"
    var pest: [PestData] = []
    var source: String = "-"
    var tag: [String] = [""]
}

//0=ulat,1=kutuDaun,2=belalang,3=kutuKebul,4=kepik

let biopesticideList: [BiopesticideData] = [
    //0
    BiopesticideData(
        id: 1,
        name: "Jeruk Nipis",
                     usage: "Pemakaian 3-4 hari sekali",
                     ingredient: ["Jeruk nipis 1 buah","Sabun cuci piring cair 2-3 tetes","Air 1 liter"],
                     instruction: ["Potong jeruk nipis kecil-kecil","Campurkan dengan 1 liter air","Tambahkan sabun cuci piring","Aduk sampai rata","Diamkan selama 2-3 jam","Saring dan semprotkan pada tanaman yang terkena hama"],
                     image: "Jeruk Nipis",
                     pest: [pestList[3]],
                     source: "http://cybex.pertanian.go.id",
                     tag: ["repellent(penolak)","mengganggu hama"]
    ),
    //1
    BiopesticideData(
        id: 2,
        name: "Ekstrak Bawang Putih",
                     usage: "Campurkan 10 liter air kedalam larutan aduk rata dan semprotkan pada pagi hari",
                     ingredient: ["100 gram bawang putih","2 sdm minyak sayur","10 liter air","10 ml sabun cair/detergen"],
                     instruction: ["Campurkan bawang putih yang sudah dihaluskan dengan minyak sayur selama 24 jam","Tambahkan 1/2 liter air dan sabun","Aduk hingga rata dan saring"],
                     image: "Bawang putih",
                     pest: [pestList[1], pestList[2], pestList[4]],
                     source: "https://dinastph.lampungprov.go.id",
                     tag: ["repellent(penolak)"]
    ),
    //2
    BiopesticideData(
        id: 3,
        name: "Tembakau",
                     ingredient: ["Daun sirsak 50 lembar","Daun tembakau 1 genggam","Sabun colek 20 gram","Air 20 liter"],
                     instruction: ["Daun sirsak dan daun tembakau dihaluskan","Seluruh bahan diaduk dengan air 20 liter air","Endapkan semalam","Keesokan harinya larutan disaring","Larutan hasil saringan diencerkan dengan air sebanyak 50 - 60 liter","Larutan siap digunakan."],
                     image: "Tembakau",
                     pest: [pestList[2]],
                     source: "cybex.pertanian.go.id",
                    tag: ["bersifat racun"]
    ),
                    
    //3
    BiopesticideData(
        id: 4,
        name: "Daun Nimba dan Akar Tuba",
                     ingredient: ["?"],
                     instruction: ["Setiap 1 kg bahan dihaluskan dan dilarutkan dalam 20 L air. takaran menyesuaikan kebutuhan. atau 100 gram campuran daun nimba dan akar tuba untuk 2liter air","Diamkan selama 3 hari dan siap digunakan"],
                     image: "Daun Nimba dan Akar Tuba",
                     pest: [pestList[2], pestList[4]],
                     source: "neurafarm.com",
                     tag: ["bersifat racun"]
    ),
    //4
    BiopesticideData(
        id: 5,
        name: "Daun Sirsak dan Tembakau",
                     usage: "Dosis 250 mL larutan dilarutkan dalam 1 L air",
                     ingredient: ["?"],
                     instruction: ["50 lembar daun sirsak dan segenggam daun tembakau dihaluskan dan dilarutkan dalam 20 liter air","Aduk rata dan diamkan semalam","Saring larutan sebelum digunakan"],
                     image: "Daun Sirsak dan Tembakau",
                     pest: [pestList[2]],
                     source: "neurafarm.com",
                     tag: ["bersifat racun","membunuh"]
    ),
    //5
    BiopesticideData(
        id: 6,
        name: "Bawang Putih dan Lada",
                     usage: "Semprotkan ke seluruh bagian tanaman yang terserang pada pagi atau sore hari",
                     ingredient: ["3 siung bawang putih", "1 sendok teh lada", "1 sendok sabun cair"],
                     instruction: ["Tambahkan sabun ke dalam minyak bawang putih.", "Aduk hingga rata.", "Tambahkan air lalu aduk kembali"],
                     pest: [pestList[0]],
                     tag: ["repellent(penolak)"]
    ),
    //6
    BiopesticideData(
        id: 7,
        name: "Ekstrak Daun Kenikir",
                     usage: "Semprotkan 3 kali sehari 50ml/ liter air",
                     ingredient: ["segenggam daun kenikir", "1 liter air"],
                     instruction: ["Haluskan daun kenikir lalu saring", "Rendam dengan air selama 24 jam", "Cairan dapat disemprotkan pada kepik"],
                     pest: [pestList[4]],
                     tag: ["repellent(penolak)","antifeedant"] //"menghambat kerja sistem saraf"
    ),
                    
    //7
    BiopesticideData(
        id: 8,
        name: "Pestisida Nabati A",
                     usage: "1 liter untuk 5- 10 liter air, semprotkan 3 hari sekali",
                     ingredient: ["Daun pepaya 1 lembar","Daun sirsak 15 lembar","Serai 2 batang","Lidah buaya 1 batang ukuran sedang","Bawang putih 3 siung","Air 1 liter"],
                     instruction: ["Potong semua bahan","Blender semua bahan sampai halus.","Simpan ke dalam botol dan tambahkan 1 liter air","Simpan selama 24 jam atau maksimal 1 minggu.","Saring sebelum disemprotkan ke tanaman"],
                     pest: [pestList[0],pestList[1]],
                     source: "http://cybex.pertanian.go.id",
                     tag: ["bersifat racun"]
    )
]
