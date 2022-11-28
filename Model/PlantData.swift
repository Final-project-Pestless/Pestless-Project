
//  PlantData.swift
//  Pestless
//
//  Created by Local Administrator on 16/11/22.
//

import Foundation

struct PlantData : Identifiable{
    var id : UUID = UUID()
    var name: String
    var ideal: [String] = [""]
    var hama: [String] = [""]
    var pestControl: [String] = [""]
    var image: String = ""
    var pest: [PestData]?
    var biopesticide: [BiopesticideData]?
}

let plantList: [PlantData] = [
    PlantData(name: "Bayam",
              ideal: ["Tanaman bayam membutuhkan sinar matahari yang cukup dengan intensitas 70-90% setiap harinya", "Lakukan juga penyiraman setiap 2 kali sehari saat pagi dan sore"],
              hama: ["Ulat Daun", "Belalang", "Kutu Daun", "Bekicot/Siput"],
              pestControl: ["Memotong bagian daun yang sudah di serang hama", "Menggunakan musuh alami hama", "Menggoyangkan bayam untuk menjatuhkan hama"],
              image: "0"
             ),
    PlantData(name: "Selada",
              ideal: ["Rawatlah tanaman dengan menyiram, menyiangi gulma, dan memastikan sistem drainasenya baik", "Penyiraman dapat kamu lakukan dua kali sehari, setiap pagi dan sore hari", "Jika sedang musim hujan, kamu bisa mengurangi frekuensi penyiraman agar tanah tidak terlalu basah"],
              hama: ["Jangel", "Tangek", "Kutu Daun", "Trips"],
              pestControl: ["Menggunakan ekstrak bahan alami seperti bawang merah atau bawang putih yang disemprotkan ke bagian tanaman"],
              image: "0"
             ),
    PlantData(name: "Jahe",
              ideal: ["Penyiraman sehari sekali pada pagi atau sore hari", "Penyiraman tidak boleh membuat tanaman tergenang, cukup membuat tanah lembab saja", "Apabila bibit tidak tumbuh selama satu minggu, segera sulam dan ganti dengan bibit lain"],
              hama: ["Kepik", "Kumbang", "Kutu Daun", "Ulat"],
              pestControl: ["Menggunakan ekstrak dari tanaman tuba", "Memutuskan siklus hidup OPT (pergiliran tanaman dengan bukan tanaman inang)", "Menaburi rimpang dengan abu"],
              image: "0"
             ),
    PlantData(name: "Cabe Rawit",
              ideal: ["Ketinggian optimum ditanam kurang dari 500 mdpl", "Suhu lingkungan ideal 25-28° Celcius", "pH tanah optimum 6-7"],
              hama: ["Trips", "Kutu Daun Apids", "Kutu Daun Persik", "Tungau", "Kutu Kebul", "Lalat Buah", "Ulat Grayak"],
              image: "0"
              //pencegahan belum
             ),
    PlantData(name: "Tomat",
              ideal: ["Terkena sinar matahari terik langsung selama 6-8 jam per hari", "Masa tanam di akhir musim penghujan (Maret-April)", "Siram tomat di pagi hari"],
              hama: ["Kutu Daun Trips", "Ulat Buah", "Kutu Daun Apids Hijau", "Ulat Tanah", "Lalat Buah", "Ulat Grayak"],
              pestControl: ["Potong semua daun bagian bawah secara berkala untuk menghindari kontaminasi penyakit dari tanah", "Tutup tanah dengan mulsa, jerami atau potongan rumput setelah tomat berumur 5 minggu untuk mencegah gulma"],
              image: "0"
             ),
    PlantData(name: "Kangkung",
              ideal: ["Siram kangkung setiap pagi dan sore secara rutin terutama apabila terlihat layu", "Ideal ditanam pada tanah bekas menanam kacang-kacangan", "Gunakan pupuk kaya nitrogen"],
              hama: ["Bekicot", "Ulat Grayak", "Kutu Daun", "Ulat Keket"],
              image: "0"
              //pemcegahan belum
             ),
    PlantData(name: "Daun Bawang",
              ideal: ["Ketinggian optimum 250-1500 mdpl", "Suhu lingkungan ideal 18-25° Celcius", "Siram 2-3 kali sehari secara rutin", "Gunakan pupuk kandang atau kompos"],
              //hama: []
              pestControl: ["Jika ada batang yang terkena penyakit (busuk), segera pindahkan dan musnahkan agar tidak menular"],
              image: "0"
             ),
    PlantData(name: "Sereh",
              ideal: ["Tanam pada ketinggian 100-1000 mdpl", "pH optimal antara 5,5 hingga 6,5", "Suhu optimum antara 22-32° Celcius dengan kelembapan udara sekitar 85%"],
              image: "0"
              //hama belum
              //pencegahan belum
             ),
    PlantData(name: "Rosemary",
              ideal: ["Suhu optimum di atas 30° Celcius", "Mendapat sinar matahari langsung setidaknya 6 jam per hari", "pH tanah netral atau asam (<7)"],
              hama: ["Rosemary Beetle", "Scale Insect", "Apids"],
              pestControl: ["Periksa tanaman secara rutin", "Pastikan tanah tidak terlalu basah", "Gunakan Molsa"],
              image: "0"
             ),
    PlantData(name: "Basil",
              ideal: ["Dapat tumbuh dengan baik di area hangat yang terkena sinar matahari selama 6 jam sehari, hindari terkena matahari terik di siang hari", "Dapat tumbuh dengan baik di pH netral", "Tanam basuk dengan jarak 30-40cm terhadap batang lainnya"],
              hama: ["Penggorok Daun/Leaf Miner"],
              pestControl: ["Semprot tanaman dengan larutan baking soda", "Semprot tanaman dengan ekstrak daun pepaya"],
              image: "0"
             ),
    PlantData(name: "Jambu Biji",
              ideal: ["Penyiraman dilakukan sebaiknya dua kali secara rutin, jangan sampai tergenang", "Lakukan penyiangan dan penggemburan secara berkala", "Beri pupuk secara berkala"],
              hama: ["Lalat Buah", "Ulat Daun", "Ulat Putih"],
              pestControl: ["Bungkus daun untuk menghindari ulat/lalat buah"],
              image: "0"
             ),
    PlantData(name: "Jeruk",
              ideal: ["Optimal ditanam pada di lokasi hangat dengan sinar matahari yang cukup", "Penyiraman pada musim kemarau dilakukan 2-3 hari sekali"],
              hama: ["Kudu Daun", "Trips", "Ulat Peliang Daun"],
              pestControl: ["Potong tanaman yang sudah rusak"],
              image: "0"
             ),
    PlantData(name: "Bawang Merah",
              ideal: ["Penyiraman dilakukan setiap hari secara rutin", "Lakukan penyiangan secara berkala"],
              hama: ["Ulat Bawang", "Trips", "Orong-orong"],
              pestControl: ["Lakukan rotasi tanaman", "Pasang perangkap", "Gunakan musuh alami kumbang macan"],
              image: "0"
             ),
    PlantData(name: "Bawang Putih",
              ideal: ["Cocok ditanam di daratan tinggi dengan iklim kering", "Dapat tumbuh pada tanah berpasir ringan", "Tumbuh optimal pada pH tanah netral antara 6,5-7"],
              hama: ["Ulat Tanah", "Uret", "Lalat Penggorok Daun", "Ulat Bawang", "Ulat Grayak", "Kutu Daun Bawang", "Trips"],
              image: "0"
             )
]
