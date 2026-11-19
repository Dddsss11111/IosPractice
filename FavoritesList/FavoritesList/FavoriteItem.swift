import Foundation

struct FavoriteItem {
    let title: String
    let subtitle: String
    let imageName: String
    let rating: Int
}

enum FavoritesData {
    static let items: [FavoriteItem] = [
        FavoriteItem(title: "Red Dead Redemption 2", subtitle: "Action Adventure • PC & PS", imageName: "i-22", rating: 5),
        FavoriteItem(title: "The Last of Us Part I", subtitle: "Story Action • PS & PC", imageName: "i-23", rating: 5),
        FavoriteItem(title: "The Last of Us Part II Remastered", subtitle: "Story Action • PC & PS", imageName: "i-24", rating: 5),
        FavoriteItem(title: "Mortal Kombat 1", subtitle: "Fighting • Console & PC", imageName: "i-25", rating: 4),
        FavoriteItem(title: "Mortal Kombat 11", subtitle: "Fighting • Console & PC", imageName: "i-26", rating: 4),
        FavoriteItem(title: "EA Sports UFC", subtitle: "Sports & MMA • PlayStation", imageName: "i-27", rating: 4),
        FavoriteItem(title: "EA Sports FC 26", subtitle: "Football Sim • PlayStation", imageName: "i-28", rating: 4),
        FavoriteItem(title: "Genshin Impact", subtitle: "Action RPG • Open World", imageName: "i-29", rating: 4),
        FavoriteItem(title: "Last Day on Earth: Survival", subtitle: "Survival • Post-Apocalypse", imageName: "i-30", rating: 3),
        FavoriteItem(title: "Minecraft", subtitle: "Sandbox • Creative & Survival", imageName: "i-31", rating: 5),
        FavoriteItem(title: "Grand Theft Auto V", subtitle: "Open World • Action", imageName: "i-32", rating: 5),
        FavoriteItem(title: "The Witcher 3: Wild Hunt", subtitle: "Action RPG • Fantasy", imageName: "i-33", rating: 5),
        FavoriteItem(title: "Cyberpunk 2077", subtitle: "Sci-Fi RPG • Open World", imageName: "i-34", rating: 4),
        FavoriteItem(title: "Elden Ring", subtitle: "Action RPG • Dark Fantasy", imageName: "i-35", rating: 5),
        FavoriteItem(title: "God of War Ragnarök", subtitle: "Action Adventure • Mythology", imageName: "i-36", rating: 5),
        FavoriteItem(title: "Counter-Strike 2", subtitle: "Tactical Shooter • Multiplayer", imageName: "i-37", rating: 4),
        FavoriteItem(title: "Dota 2", subtitle: "MOBA • Team Strategy", imageName: "i-38", rating: 4),
        FavoriteItem(title: "Resident Evil 4 Remake", subtitle: "Survival Horror • Action", imageName: "i-39", rating: 4),
        FavoriteItem(title: "Hogwarts Legacy", subtitle: "Action RPG • Open World", imageName: "i-40", rating: 4),
        FavoriteItem(title: "Shadow Fight 2", subtitle: "Action Fighting • Martial Arts", imageName: "i-41", rating: 5)
    ]
}
