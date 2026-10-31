struct Track {
    let title: String
    let artist: String
    let fileName: String
    let fileExtension: String
    let coverImageName: String
}

struct TrackLibrary {
    static let tracks: [Track] = [
        Track(title: "Track 1", artist: "Artist 1", fileName: "06 Sweet Dreams (Original)", fileExtension: "mp3", coverImageName: "i-17"),
        Track(title: "Track 2", artist: "Artist 2", fileName: "Dancin", fileExtension: "mp3", coverImageName: "i-21"),
        Track(title: "Track 3", artist: "Artist 3", fileName: "Danza Kuduro", fileExtension: "mp3", coverImageName: "i-14"),
        Track(title: "Track 4", artist: "Artist 4", fileName: "Bella Ciao", fileExtension: "mp3", coverImageName: "i-13"),
        Track(title: "Track 5", artist: "Artist 5", fileName: "I Will Survive [Zona]", fileExtension: "mp3", coverImageName: "i-22"),
        Track(title: "Track 6", artist: "Artist 6", fileName: "death_bed", fileExtension: "mp3", coverImageName: "i-15"),
        Track(title: "Track 7", artist: "Artist 7", fileName: "Diamonds", fileExtension: "mp3", coverImageName: "i-18"),
        Track(title: "Track 8", artist: "Artist 8", fileName: "Riptide", fileExtension: "mp3", coverImageName: "i-20"),
        Track(title: "Track 9", artist: "Artist 9", fileName: "Shape of You", fileExtension: "mp3", coverImageName: "i-19"),
        Track(title: "Track 10", artist: "Artist 10", fileName: "Toca Toca (Radio Edit)", fileExtension: "mp3", coverImageName: "i-16")
    ]
}
