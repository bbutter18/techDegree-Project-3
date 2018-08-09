//
//  EventLibrary.swift
//  'BoutTimeApp
//
//  Created by Woodchuck on 8/8/18.
//  Copyright © 2018 Treehouse Island. All rights reserved.
//

import Foundation
import GameKit

struct groupOfEvents {
    
    let events: [eventCreator] = [
        
        eventCreator(event: "'Marvel Comics' was first created from 'Atlas Comics'", date: 1961),
        eventCreator(event: "Stan Lee, famous for helping create 'Spider-Man' and the 'X-Men,' was born in New-York", date: 1922),
        eventCreator(event: "Spider-Man first appeared in anthology comic book, 'Amazing Fantasy #15'", date: 1962),
        eventCreator(event: "Human Torch and Sub-Mariner meet in the first superhero crossover comic in 'Marvel Mystery No. 8'", date: 1940),
        eventCreator(event: "Superman stops a domestic abuser in his first appearance ever in 'Action Comics No 1'", date: 1938),
        eventCreator(event: "Captain Marvel (Marvel Comics' pseudo-Superman) appears when 12 year-old Billy Batson says the word 'Shazam!'", date: 1939),
        eventCreator(event: "'The Man Who Laughs' film is released, which would go on as the inspiration for 'The Joker'", date: 1928),
        eventCreator(event: "The Joker paralyzes Barbara Gordon in 'Batman: The Killing Joke'", date: 1988),
        eventCreator(event: "'The Comics Code Authority' was formed as a way for comic publishers to self-regulate and avoid government intervention", date: 1954),
        eventCreator(event: "First 'comic' ever - the woodblock printed 'Master Flashgold's Splendiferous Dream' by Koikawa Harumachi in Japan was created", date: 1775),
        eventCreator(event: "'Days of Future Past' of 'The Uncanny X-Men' #141 is released, one of the most acclaimed comic storylines", date: 1981),
        eventCreator(event: "Marvel Comics releases 'Years of Future Past,' a direct sequel to the original storyline of 'Days of Future Past'", date: 2015),
        eventCreator(event: "Wolverine's first appearance ever in a 'teaser' panel of 'The Incredible Hulk #180", date: 1974),
        eventCreator(event: "Wolverine's adamantium skeleton is 'extracted' out of him by Magneto in Marvel Comics' 'Fatal Attractions' series", date: 1993),
        eventCreator(event: "DC Comics releases Frank Miller's 'Batman: Year One' to massive critical acclaim", date: 1987),
        eventCreator(event: "The Hulk and Dr. Bruce Banner make their debut in 'The Incredible Hulk #1'", date: 1962),
        eventCreator(event: "The Fantastic Four battle Galactus and Silver Surfer in the 'Galactus Trilogy'", date: 1966),
        eventCreator(event: "The comic book market in the United States and Canada is estimated at $1.09 Billion", date: 2016),
        eventCreator(event: "Captain America crosses over into the '60's and joins the 'Avengers,' briding past and present superheroes in 'Avengers #4'", date: 1965),
        eventCreator(event: "'The Amazing Spider-Man #33' is released, marking one of the first times in a comic there was doubt if the superhero will actually come out on top", date: 1965),
        eventCreator(event: "Rob Liefeld and Fabian Nicieza introduce the world to the 'Merc with a Mouth' with Deapool in New Mutans #98", date: 1991),
        eventCreator(event: "Deadpool breaks the 4th wall in 'Dear Deapool' and goes after the comic industry in Cable & Deadpool #13", date: 2005),
        eventCreator(event: "Norman Osborn, aka The Green Goblin, kills Gwen Stacy - Spider Man's love interest - in 'The Amazing Spider-Man #121-122", date: 1973),
        eventCreator(event: "The Justice League is born in 'The Brave and the Bold #28' with Aquaman, Batman, Flash, Green Lanter, Martian Manhunter, Superman and Wonder Woman", date: 1960),
        eventCreator(event: "Wonder Woman fights Ares in 'Wonder Woman #1'", date: 1942),
        eventCreator(event: "'Flahspoint' storyline is release, where Barry Allen (Flash) witnesses Thomas Wayne as Batman and Superman being held captive by the US Government", date: 2011),
        eventCreator(event: "The illuminati deem Hulk too dangerous for Earth and send him away in a rocket ship which crashes on Planet Sakaar, starting the 'Planet Hulk' storyline", date: 2006),
        eventCreator(event: "Iron Man battles alcoholism and coping with his many misfortunes in the 'Demon in a Bottle' storyline", date: 1979),
        eventCreator(event: "Tony Stark, aka Iron Man, explores Cold War themes and battles communists in his comics' debut in 'Tales of Suspense #39'", date: 1963),
        eventCreator(event: "Superman battles Doomsday and is ultimately defeated in 'Superman: The Man of Steel #17-18'", date: 1992),
        eventCreator(event: "Thanos makes his debut and fights Drax the Destroyer and Iron Man on planet Titan, Thanos' home world, in 'The Invincible Iron Man #55'", date: 1973)
        
        
    ]
    
    func getRandomEvent() -> eventCreator {
        let randomEvent = getRandomIndex()
        return events[randomEvent]
        
    }
    
    func getRandomIndex() -> Int {
        return GKRandomSource.sharedRandom().nextInt(upperBound: events.count)
        
    }
    
}
