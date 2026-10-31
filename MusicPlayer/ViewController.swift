import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!

    var tracks: [Track] = TrackLibrary.tracks
    var currentIndex: Int = 0
    var audioPlayer: AVAudioPlayer?
    var isPlaying: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(for: currentIndex)
    }

    func loadTrack(at index: Int) {
        let track = tracks[index]
        
        guard let url = Bundle.main.url(forResource: track.fileName, withExtension: track.fileExtension) else {
            print("Не удалось найти файл трека: \(track.fileName)")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.delegate = self
            audioPlayer?.prepareToPlay()
        } catch {
            print("Ошибка при инициализации плеера: \(error.localizedDescription)")
        }
    }

    func updateUI(for index: Int) {
        let track = tracks[index]
        titleLabel.text = track.title
        artistLabel.text = track.artist
        coverImageView.image = UIImage(named: track.coverImageName)
    }

    func playCurrentTrack() {
        loadTrack(at: currentIndex)
        audioPlayer?.play()
        isPlaying = true
        playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
    }

    func pauseCurrentTrack() {
        audioPlayer?.pause()
        isPlaying = false
        playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
    }

    @IBAction func playPauseTapped(_ sender: UIButton) {
        if isPlaying {
            pauseCurrentTrack()
        } else {
            if audioPlayer == nil {
                loadTrack(at: currentIndex)
            }
            audioPlayer?.play()
            isPlaying = true
            playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
    }

    @IBAction func nextTapped(_ sender: UIButton) {
        currentIndex = (currentIndex + 1) % tracks.count
        updateUI(for: currentIndex)
        if isPlaying {
            playCurrentTrack()
        }
    }

    @IBAction func previousTapped(_ sender: UIButton) {
        currentIndex = (currentIndex - 1 + tracks.count) % tracks.count
        updateUI(for: currentIndex)
        if isPlaying {
            playCurrentTrack()
        }
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        nextTapped(UIButton())
    }
}
