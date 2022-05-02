//
//  CreateHistoryArray.swift
//  History
//
//  Created by Santi Silvani on 5/1/22.
//

import Foundation

class CreateHistoryArray{
    
    var historyArray: [History] = []

    
    var imageGifAudioData = ImageGifsAudio()
    var erasStats = ErasStatsBuilder()
    
    
    
    func makeArray(){
        historyArray.append(History(timePeriod: erasStats.era1, stats: erasStats.stats1, image: imageGifAudioData.image1, audio: imageGifAudioData.audio1, gif: imageGifAudioData.gifs1))
        historyArray.append(History(timePeriod: erasStats.era2, stats: erasStats.stats2, image: imageGifAudioData.image2, audio: imageGifAudioData.audio2, gif: imageGifAudioData.gifs2))
        historyArray.append(History(timePeriod: erasStats.era3, stats: erasStats.stats3, image: imageGifAudioData.image3, audio: imageGifAudioData.audio3, gif: imageGifAudioData.gifs3))
        historyArray.append(History(timePeriod: erasStats.era4, stats: erasStats.stats4, image: imageGifAudioData.image4, audio: imageGifAudioData.audio4, gif: imageGifAudioData.gifs4))
        historyArray.append(History(timePeriod: erasStats.era5, stats: erasStats.stats5, image: imageGifAudioData.image5, audio: imageGifAudioData.audio5, gif: imageGifAudioData.gifs5))
        historyArray.append(History(timePeriod: erasStats.era6, stats: erasStats.stats6, image: imageGifAudioData.image6, audio: imageGifAudioData.audio6, gif: imageGifAudioData.gifs6))
        historyArray.append(History(timePeriod: erasStats.era7, stats: erasStats.stats7, image: imageGifAudioData.image7, audio: imageGifAudioData.audio7, gif: imageGifAudioData.gifs7))
        historyArray.append(History(timePeriod: erasStats.era8, stats: erasStats.stats8, image: imageGifAudioData.image8, audio: imageGifAudioData.audio8, gif: imageGifAudioData.gifs8))
        historyArray.append(History(timePeriod: erasStats.era9, stats: erasStats.stats9, image: imageGifAudioData.image9, audio: imageGifAudioData.audio9, gif: imageGifAudioData.gifs9))
    }
    
}


//3.1    1947–1953
//3.2    1954–1960
//3.3    1961–1965
//3.4    1966–1986
//3.5    1987–1988
//3.6    1989–1994
//3.7    1995–2005
//3.8    2006–2013
//3.9    2014–2021
