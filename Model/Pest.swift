import Foundation

struct PestData: Identifiable {
    let id = UUID()
    var name: String = ""
    var description: String = ""
    var identity: String = ""
    var eat: String = ""
    var plant: String = ""
    var preventive: [String] = [""]
    var image: [String] = [""]
//    var biopests: [BiopesticideData] = []
    
}

let PestList: [PestData] = [
    PestData(name: "ulat",
             description: "Ulat ini biasanya memakan daun pada tanaman, jika sudah berusia matang, ulat ini akan bertransformasi menjadi kupu-kupu",
             identity: "Warna tubuh ulat ini berkisar dari putih krem ​​hingga abu-abu kecokelatan dan juga dapat memiliki garis kuning di bagian atas tubuh. Ulat thistle dewasa memiliki panjang tubuh berkisar antara 1/5-1,75 inci",
             eat: "Daun, rumput, bunga, dan buah",
             plant: "jagung, padi, tomat, bawang",
             preventive: ["Cabut ulat dari tanaman Anda dan masukkan ke dalam ember berisi air sabun.", "Waspadai tanaman Anda dan cari telur, serta ulat.","Letakkan karton atau kertas timah di pangkal tanaman Anda untuk mengusir ulat.","Tawon parasit adalah pemangsa ulat sebagai sarang telurnya."],
             image: ["thistle"]
//             biopests: [BiopesticideList[4]]
            ),
    PestData(name: "kutuDaun",
             description: "Tanda-tanda serangan kutu yang parah adalah daun bengkok dan melengkung, daun menguning, tunas kerdil atau mati, dan pertumbuhan tanaman yang buruk.",
             identity: "Kutu daun berukuran kecil (2-4 mm), berbentuk buah pir,dan bertubuh lunak. Mereka dapat berwarna hijau, hitam, merah, kuning, coklat atau abu-abu.",
             eat: "",
             plant: "Kentang, lada, kol, bayam, terong, tomat, semangka, dan mentimun",
             preventive: ["Periksa tanaman secara teratur sepanjang musim tanam.","Bersihkan gulma dari kebun untuk mengurangi potensi serangan kutu daun.","Anda dapat menggunakan semprotan air yang kuat dari selang taman. Ini juga akan membantu membersihkan embun madu atau jamur jelaga yang mungkin ada.","Musuh alami kutu daun diantaranya kepik, lacewings, larva lalat syrphid, dan tawon parasit."],
             image: ["arphid"]
//             biopests: [BiopesticideList[0], BiopesticideList[1]]
            ),
    
    
    PestData(name: "belalang",
             description: "Salah satu serangga yang ditemukan di berbagai habitat. Belalang muncul dalam jumlah terbesar di hutan tropis dataran rendah, daerah semi kering, dan padang rumput.",
             identity: "Panjang belalang 1 - 7 cm. Belalang adalah herbivora, mereka memakan tanaman, daun, bunga, dan biji. Kadang-kadang mereka juga mengais serangga mati untuk mendapatkan protein tambahan.",
             eat: "",
             plant: "Kembang kol, kubis, bayam, jagung, rumput, bunga, dan biji",
             preventive: ["Beternak ayam. Ayam memakan belalang dan larva belalang.","Menaburkan tanaman Anda dengan tepung serbaguna biasa membantu dalam menghentikan belalang. Ketika tertelan oleh belalang, tepung bertindak sebagai insektisida alami yang mengganggu sistem pencernaan mereka."],
             image: ["grasshopper"]
//             biopests: [BiopesticideList[2], BiopesticideList[3]]
            ),
    PestData(name: "kutuKebul",
             description: "Salah satu kelompok serangga kecil penghisap getah (ordo Homoptera) yang tersebar di seluruh dunia dan menyerang pohon jeruk dan tanaman hias, terutama pada tanaman rumahan dan rumah kaca.",
             identity: "Spesies kutu putih sangat bervariasi ukurannya, mulai dari 1/20 hingga 1/5 inci. Tubuh oval mereka, dikelilingi filamen lilin, bergerak lambat, dan tidak bersayap biasanya makan dalam koloni besar dan lengket",
             eat: "tanaman palawija, sayuran, dan buah-buahan",
             plant: "Mangga, pepaya, anggur, nanas, singkong, kaktus, tebu, pohon kopi, pakis, bunga matahari, dan anggrek",
             preventive: ["Kutu kebul dapat dibasmi dengan semprotan air.","Rendam bola kapas dengan alkohol gosok biasa dan bersihkan pada kutu putih, yang membunuh kutu putih secara instan. Gunakan larutan yang mengandung alkohol isopropil tidak lebih dari 70%, dan uji pada satu daun sebelum Anda menerapkannya ke seluruh tanaman untuk memastikan alkohol tidak membakarnya.","Lacebugs, tawon parasitoid (Leptomastix dactylopii), dan kumbang (Cryptolaemus montrouzieri), secara alami membunuh kutu putih"],
             image: ["mealybug"]
//             biopests: [BiopesticideList[0], BiopesticideList[3]]
            ),
    PestData(name: "kepik",
             description: "Hemiptera tersebar di seluruh dunia, kecuali daerah sangat dingin",
             identity: "Struktur mulutnya berbentuk seperti jarum, ",
             eat: "Kepik mengonsumsi hampir segala jenis makanan mulai dari cairan tumbuhan, biji-bijian, dan serangga lain",
             plant: "",
             preventive: ["Bersihkan kebun dari tumpukan kayu dan peralatan lain", "Pantau kesehatan tanaman secara teratur", "Gunakan screen house untuk membatasi masuknya hama"],
             image: ["truebug"]
//             biopests: [BiopesticideList[1]]
            )
]


