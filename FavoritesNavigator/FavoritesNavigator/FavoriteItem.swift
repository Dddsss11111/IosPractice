import Foundation

struct FavoriteItem {
    let title: String
    let subtitle: String
    let imageName: String
    let rating: Int
    let description: String
}

enum FavoritesData {
    static let items: [FavoriteItem] = [
        FavoriteItem(
            title: "Red Dead Redemption 2",
            subtitle: "Action Adventure • PC & PS",
            imageName: "i-22",
            rating: 5,
            description: "An epic open-world western set in America during the decline of the outlaw era in 1899. You play as Arthur Morgan, a senior member of the Van der Linde gang trying to survive against federal agents and bounty hunters. The game is famous for its deeply emotional story, living ecosystem, and extraordinary attention to detail."
        ),
        FavoriteItem(
            title: "The Last of Us Part I",
            subtitle: "Story Action • PS & PC",
            imageName: "i-23",
            rating: 5,
            description: "A post-apocalyptic action-adventure following Joel and Ellie across a devastated United States. Tasked with escorting a teenage girl who may hold the key to humanity's survival, Joel must confront both infected creatures and ruthless human factions. Its gripping narrative and memorable characters make it a modern classic."
        ),
        FavoriteItem(
            title: "The Last of Us Part II Remastered",
            subtitle: "Story Action • PC & PS",
            imageName: "i-24",
            rating: 5,
            description: "Set five years after the original journey, this sequel explores the devastating cycle of vengeance through the eyes of Ellie and Abby. The remastered edition enhances visual fidelity, frame rates, and DualSense controller feedback while adding the roguelike No Return mode. Intense stealth combat and bold storytelling define every chapter."
        ),
        FavoriteItem(
            title: "Mortal Kombat 1",
            subtitle: "Fighting • Console & PC",
            imageName: "i-25",
            rating: 4,
            description: "Liu Kang creates a reborn Mortal Kombat universe with reimagined origins for iconic fighters like Scorpion, Sub-Zero, and Raiden. The game introduces the Kameo Fighter system, allowing players to call in partner characters for combo extensions and defensive assists. Fast-paced mechanics and cinematic Fatalities keep every match exciting."
        ),
        FavoriteItem(
            title: "Mortal Kombat 11",
            subtitle: "Fighting • Console & PC",
            imageName: "i-26",
            rating: 4,
            description: "A time-bending chapter in the legendary fighting franchise where past and present heroes collide against Kronika. Players can customize character variations, gear, and special moves to fit their personal playstyle. Precision spacing, Krushing Blows, and a blockbuster story campaign make it stand out."
        ),
        FavoriteItem(
            title: "EA Sports UFC",
            subtitle: "Sports & MMA • PlayStation",
            imageName: "i-27",
            rating: 4,
            description: "Step inside the Octagon with realistic mixed martial arts physics, authentic fighter rosters, and dynamic striking animations. Players can build a custom athlete from regional shows to championship title defenses in Career Mode. Strategic stamina management and seamless submission transitions reward tactical play."
        ),
        FavoriteItem(
            title: "EA Sports FC 26",
            subtitle: "Football Sim • PlayStation",
            imageName: "i-28",
            rating: 4,
            description: "A modern football simulation featuring authentic leagues, club tournaments, and responsive ball-control physics. Modes like Career, Ultimate Team, and Clubs let you manage squads or compete online with friends. Dynamic matchday atmospheres and refined player movement capture real stadium energy."
        ),
        FavoriteItem(
            title: "Genshin Impact",
            subtitle: "Action RPG • Open World",
            imageName: "i-29",
            rating: 4,
            description: "Explore the vast fantasy world of Teyvat as the Traveler searching for a lost sibling across seven elemental nations. Combat revolves around switching between four party members to trigger powerful elemental reactions. Regular updates expand the map with new regions, quests, and orchestral music."
        ),
        FavoriteItem(
            title: "Last Day on Earth: Survival",
            subtitle: "Survival • Post-Apocalypse",
            imageName: "i-30",
            rating: 3,
            description: "A top-down survival strategy game set in a zombie-infested wasteland where resources are scarce. You must gather wood, stone, and scrap to fortify your base, craft weapons, and raid dangerous bunkers. Careful inventory planning is essential before venturing into high-risk zones."
        ),
        FavoriteItem(
            title: "Minecraft",
            subtitle: "Sandbox • Creative & Survival",
            imageName: "i-31",
            rating: 5,
            description: "An endlessly replayable sandbox universe built entirely out of blocks where imagination sets the only limit. Players can mine resources, build towering castles, engineer Redstone machines, or survive against nocturnal monsters. Cooperative multiplayer and thousands of mods keep the experience fresh for years."
        ),
        FavoriteItem(
            title: "Grand Theft Auto V",
            subtitle: "Open World • Action",
            imageName: "i-32",
            rating: 5,
            description: "Follow three distinct criminals—Michael, Franklin, and Trevor—as they pull off daring heists across the sun-soaked metropolis of Los Santos. Seamless switching between protagonists brings multiple perspectives to high-speed chases and shootouts. Beyond the campaign, GTA Online offers a massive multiplayer playground."
        ),
        FavoriteItem(
            title: "The Witcher 3: Wild Hunt",
            subtitle: "Action RPG • Fantasy",
            imageName: "i-33",
            rating: 5,
            description: "Play as Geralt of Rivia, a professional monster slayer searching for his adopted daughter Ciri across war-torn kingdoms. Every side quest features morally complex choices with lasting consequences on the world. Rich Slavic-inspired folklore, tactical alchemy, and expansive DLCs elevate the RPG genre."
        ),
        FavoriteItem(
            title: "Cyberpunk 2077",
            subtitle: "Sci-Fi RPG • Open World",
            imageName: "i-34",
            rating: 4,
            description: "Set in the neon-lit megalopolis of Night City, you play as V, a mercenary entangled with a experimental biochip carrying Johnny Silverhand. Deep cyberware upgrades allow you to specialize in netrunning hacks, stealth blades, or heavy firearms. The Phantom Liberty expansion adds a gripping spy-thriller storyline."
        ),
        FavoriteItem(
            title: "Elden Ring",
            subtitle: "Action RPG • Dark Fantasy",
            imageName: "i-35",
            rating: 5,
            description: "Created by FromSoftware in collaboration with George R. R. Martin, this dark fantasy RPG invites you to explore the Lands Between. Seamless horseback traversal connects sprawling fields, hidden catacombs, and monumental legacy dungeons. Challenging boss battles reward patience, build experimentation, and mastery."
        ),
        FavoriteItem(
            title: "God of War Ragnarök",
            subtitle: "Action Adventure • Mythology",
            imageName: "i-36",
            rating: 5,
            description: "Kratos and Atreus journey through the Nine Realms as the prophesied Norse apocalypse draws near. Fluid combat combines the Leviathan Axe, Blades of Chaos, and the Draupnir Spear against mythic gods and beasts. A heartfelt father-son bond anchors the cinematic adventure from start to finish."
        ),
        FavoriteItem(
            title: "Counter-Strike 2",
            subtitle: "Tactical Shooter • Multiplayer",
            imageName: "i-37",
            rating: 4,
            description: "The evolution of competitive 5v5 tactical first-person shooters built on the Source 2 engine. Sub-tick server updates, volumetric smoke grenades, and classic maps like Mirage and Dust II demand sharp aim and team coordination. Every round balances economy management with high-stakes clutch potential."
        ),
        FavoriteItem(
            title: "Dota 2",
            subtitle: "MOBA • Team Strategy",
            imageName: "i-38",
            rating: 4,
            description: "A deeply strategic multiplayer online battle arena where two teams of five clash to destroy the enemy Ancient. With over a hundred unique heroes unlocked from the start, no two matches ever play out the same way. Mastering map control, item timings, and teamfight execution offers limitless depth."
        ),
        FavoriteItem(
            title: "Resident Evil 4 Remake",
            subtitle: "Survival Horror • Action",
            imageName: "i-39",
            rating: 4,
            description: "Agent Leon S. Kennedy travels to a remote European village to rescue the president's daughter from a sinister cult. Modernized over-the-shoulder controls, knife parries, and tense resource management revitalise the 2005 classic. Atmospheric lighting and relentless enemy encounters keep tension high throughout."
        ),
        FavoriteItem(
            title: "Hogwarts Legacy",
            subtitle: "Action RPG • Open World",
            imageName: "i-40",
            rating: 4,
            description: "Experience life as a fifth-year student at Hogwarts School of Witchcraft and Wizardry in the 1890s. Attend magic classes, brew potions, tame magical beasts, and duel dark wizards using customizable spell combinations. Exploring secret passages inside the castle and flying across the Highlands captures pure wizarding wonder."
        ),
        FavoriteItem(
            title: "Shadow Fight 2",
            subtitle: "Action Fighting • Martial Arts",
            imageName: "i-41",
            rating: 5,
            description: "A stylish martial arts fighting game featuring silhouette-styled warriors and fluid weapon animations. Players travel across six demon-ruled provinces, upgrading swords, armor, ranged weapons, and magic spells. Precise timing and combo mastery are key to defeating Titan and closing the Gates of Shadows."
        )
    ]
}
