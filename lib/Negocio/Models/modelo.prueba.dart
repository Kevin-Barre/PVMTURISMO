class DataModel {
  final String categoria;
  final String title;
  final String imageName;
  final double price;
  DataModel(this.categoria, this.title, this.imageName, this.price);
}

List<DataModel> dataList = [
  DataModel("rios", "Cascadas Verdes", "assets/cascadasVerdes.webp", 300.8),
  DataModel("restaurantes", "Sun and Moon", "assets/sunandmoon.jpg", 136.7),
  DataModel(
    "rios",
    "Cascada Salto del Tigre",
    "assets/cascadaSaltodeltigre.webp",
    245.2,
  ),
  DataModel("hosterias", "Muricatas Hostería", "assets/muricatas.jpg", 136.7),
  DataModel("restaurantes", "Casa Mercedes", "assets/casamercedes.jpg", 136.7),
  DataModel("rios", "Balneario Río Caoní", "assets/balnearioCaoni.webp", 168.2),
  DataModel(
    "espacios recreativos",
    "Parque Central",
    "assets/parcentralpvm.jpg",
    136.7,
  ),
  DataModel("hosterias", "Hostería Remanso", "assets/remanso.jpg", 136.7),
  DataModel(
    "senderismo",
    "Santuario de Aves Rio Silanche",
    "assets/santuarioaves.webp",
    136.7,
  ),
  DataModel(
    "hosterias",
    "Hosteria el Paraiso",
    "assets/hosteriaparaiso.jpg",
    136.7,
  ),
  DataModel(
    "religión",
    "Santuario de la Pasión de nuestro Señor Jesucristo",
    "assets/santuariolacelica.jpg",
    136.7,
  ),
  DataModel(
    "hoteles",
    "Hotel Restaurant Apolo",
    "assets/hotelapolo.jpg",
    136.7,
  ),
  DataModel(
    "hoteles",
    "Hotel Cristal Azul",
    "assets/hotelcristalazul.avif",
    136.7,
  ),
  DataModel("restaurantes", "Villamaria", "assets/villamaria.jpg", 136.7),
  DataModel(
    "religión",
    "Inglesia Central Nuestra Señora del Cisne",
    "assets/iglesia.jpg",
    136.7,
  ),
];
