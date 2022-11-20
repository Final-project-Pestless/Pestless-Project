import Foundation

struct PestData: Identifiable {
    let id = UUID()
    var name: String = ""
    var description: String = ""
    var identity: String = ""
    var eat: String = ""
    var plant: [String] = [""]
//    var biopests: [BiopesticideData] = []
    var preventive: [String] = [""]
    var image: [String] = [""]
    
}

let PestList: [PestData] = [
    PestData(name: "Ulat",
             description: "Ulat ini biasanya memakan daun pada tanaman, jika sudah berusia matang, ulat ini akan bertransformasi menjadi kupu-kupu",
             identity: "Warna tubuh ulat ini berkisar dari putih krem ​​hingga abu-abu kecokelatan dan juga dapat memiliki garis kuning di bagian atas tubuh. Ulat thistle dewasa memiliki panjang tubuh berkisar antara 1/5-1,75 inci",
             plant: ["jagung", "padi", "tomat", "bawang"],
//             biopests: [BiopesticideList[0], BiopesticideList[3]],
             image: ["thistle"]
            ),
    PestData(name: "Aphid",
             description: "Tanda-tanda serangan kutu yang parah adalah daun bengkok dan melengkung, daun menguning, tunas kerdil atau mati, dan pertumbuhan tanaman yang buruk.",
             identity: "Kutu daun berukuran kecil (2-4 mm), berbentuk buah pir,dan bertubuh lunak. Mereka dapat berwarna hijau, hitam, merah, kuning, coklat atau abu-abu.",
             eat: "",
             plant: [""],
             preventive: [""],
             image: ["arphid"]),

    PestData(name: "ulat",
             description: "Caterpillars are insects, which means they have three body parts (head, thorax, and abdomen) and two antennae on their heads. Most caterpillars are herbivores, which means they eat plants. Caterpillars eat constantly so that they can grow. Caterpillars grow up and change into butterflies and moths.",
             identity: "Fully grown larvae range in size from ½ to 4 inches (13-102mm ) in length. Larvae range in color from pink, brown, green and blue to black. Many have spots or stripes. Some caterpillars are smooth with few hairs while others are hairy and others have spines on their bodies.",
             eat: "Leaves, Grasses, Flowers, Fruits and vegetables, Bark and twigs, Honeycomb, Fur/hair/feathers",
             plant: [""],
             preventive: ["Pluck the caterpillars off your plants and drop them into a bucket of soapy water. Be vigilant with your plants and look for eggs, as well as caterpillars.","Place cardboard or tin foil at the base of your plants to repel caterpillars. This can be an effective deterrent for some varieties. Keep the ground around your plants free from debris where eggs might hide.","Parasitic wasps don’t sting people and will happily prey on caterpillars, using the caterpillar’s body as a nest for their eggs. You can see evidence of parasitic wasps in clusters of eggs that look almost exactly like white rice. If you can, let them be."],
             image: ["ulat1","ulat2","ulat3","ulat4"]
            ),
    PestData(name: "kutuDaun",
             description: "Aphids are soft-bodied insects that use their piercing sucking mouthparts to feed on plant sap. They usually occur in colonies on the undersides of tender terminal growth. Heavily-infested leaves can wilt or turn yellow because of excessive sap removal.",
             identity: "Aphids are small, 1/16- to 1/8-inch-long (2-4 mm), pear-shaped, soft-bodied insects. They can range in color from green, black, red, yellow, brown or gray. Mature aphids can be wingless or can have wings.",
             eat: "",
             plant: ["Potato","Pepper","Cabbage","Spinach","Asparagus","Mustard","Eggplant","Tomatoes","Watermelons","Cucumbers"],
             preventive: ["Check plants for aphids regularly throughout the growing season. Because aphid populations can explode, it is important to monitor plants as often as possible. Carefully check leaves and stems for the presence of aphids.","Remove weeds from your garden to reduce potential sites for aphid attack. Weeds such as sowthistle and mustard can support large numbers of aphids.","You can physically knock aphids off plants with a strong spray of water from a garden hose. This will also help wash off any honeydew or sooty mold that may be present.","There are many natural enemies of aphids that are commonly found in gardens, including lady beetles, lacewings, syrphid fly larvae and parasitic wasps.  Because aphids can multiply very fast, it will likely take some time for the predator insects to catch up and reduce aphid numbers."],
             image: ["kutuDaun1","kutuDaun2","kutuDaun3","kutuDaun4"]
            ),
    PestData(name: "belalang",
             description: "Any of a group of jumping insects (suborder Caelifera) that are found in a variety of habitats. Grasshoppers occur in greatest numbers in lowland tropical forests, semiarid regions, and grasslands.",
             identity: "Grashopper length from 1 - 7 cm. Grasshoppers are herbivores, they eat plants. They mostly eat leaves, but also flowers, stems and seeds. Sometimes they also scavenge dead insects for extra protein.",
             eat: "",
             plant: ["Cauliflower","Cabbage","Spinach","Corn","Grass","Weeds","Flowers","Barley","Oats","Wheat","Rye","Clover"," Seeds"],
             preventive: ["Raising chickens. Not only do chickens search for and devour adult grasshoppers, they also feed on the grasshopper larva. And that of course, eliminates the following year’s population.","One of the more effective and natural methods that can be used to deter grasshoppers is to coat plants in a homemade spray made of garlic and hot peppers. Grasshoppers do not like the smell of garlic, or the fiery taste of peppers.","Dusting of your plants with ordinary all-purpose flour will do wonders in stopping grasshoppers. When ingested by the grasshoppers, flour acts as a natural insecticide, interfering with their digestive system."],
             image: ["belalang1","belalang2","belalang3","belalang4"]
            ),
    PestData(name: "kutuKebul",
             description: "Any of a group of small sap-sucking insects (order Homoptera) that are worldwide in distribution and attack citrus trees and ornamental plants, especially in interior plantscapes and greenhouses.",
             identity: "Mealybug species vary considerably in size, ranging from 1/20 to 1/5 inch long. Their oval bodies, ringed with waxy filaments, have distinct parallel segments. The waxy-white, slow-moving, wingless females typically feed in large, sticky colonies.",
             eat: "",
             plant: ["Mango","Papaya","Grapes","Pineapple","Cassava","Cacti","Sugarcane","Coffee trees","Ferns","Gardenias","Mulberry","Sunflower","Orchids"],
             preventive: ["Mealybugs can be dislodged with a steady stream of water. Repeat the treatment as necessary. This is best for light infestations, and some plants do not tolerate this kind of vigorous treatment.","Soak a cotton ball with regular rubbing alcohol and wipe it on the mealybugs, which kills mealybugs instantly and removes them. Use a solution consisting of no more than 70% isopropyl alcohol, and test it on one leaf before you apply it to the whole plant to make sure the alcohol doesn't burn it.","Lacebugs, parasitoid wasps (Leptomastix dactylopii), and a beetle sometimes known as the mealybug destroyer (Cryptolaemus montrouzieri), all naturally kill mealybugs"],
             image: ["kutuKebul1","kutuKebul2","kutuKebul3","kutuKebul4"]
            ),
    PestData(name: "kepik",
             description: "",
             identity: "",
             eat: "",
             plant: [""],
             preventive: [""],
             image: ["kepik"]
            )
             ]


