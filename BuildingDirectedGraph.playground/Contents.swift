import Cocoa
import SwiftUI

struct Edge: Hashable {
    
    let destinationId: Int
    let prompt: String
    
}

// TODO: 1 - Add this enumeration to your project
enum EndingClassification: String, CaseIterable {
    case great = "Great"
    case favorable = "Favorable"
    case mediocre = "Mediocre"
    case disappointing = "Disappointing"
    case catastrophic = "Catastrophic"
}

// TODO: 2 - Add this structure to your project
struct Ending {
    let classification: EndingClassification
    let description: String
    var color: String {
        switch self.classification {
        case .great:
            return "#90C8E0"  // Light blue
        case .favorable:
            return "#FFDE5F"  // Pale yellow
        case .mediocre:
            return "#D7883C"  // Orange
        case .disappointing:
            return "#C1531E"  // Deep orange
        case .catastrophic:
            return "#AB1800"  // Deep red
        }
    }
}

// TODO: 3 - Update your story nodes to use the Ending type
struct Node: Identifiable {
    let id: Int
    let paragraphs: [String]
    let image: String?
    let edges: [Edge]
    let ending: Ending?
}

struct StoryInformation {
    let title: String
    let authorOrAuthors: String
    let seriesInfo: String
    let publisherInfo: String
}

// TODO: 4 - Replace details of this instance of StoryInformation with data for your own group's story
let storyInfo = StoryInformation(title: "Journey Under The Sea",
                                 authorOrAuthors: "R.A. Montgomery",
                                 seriesInfo: "CHOOSE YOUR OWN ADVENTURE #2",
                                 publisherInfo: "Chooseco LLC, Waitsfield, Vermont, 2006")

// A single node
let testNode = Node(id: 1,
                    paragraphs: [
                        "You are a deep sea explorer searching for the famed lost city of Atlantis. This is your most challenging and dangerous mission. Fear and excitement are now your companions.",
                        
                        "It is morning and the sun pushes up on the horizon. The sea is calm. You climb into the narrow pilot's compartment of the underwater vessel *Seeker* with your special gear. The crew of the research vessel *Maray* screws down the hatch clamps. Now begins the plunge into the depths of the ocean. The *Seeker* crew begins lowering by a strong, but thin, cable. Within minutes, you are so deep in the ocean that little light filters down to you. The silence is eerie as the *Seeker* slips deeper and deeper. You peer out the thick glass porthole and see strange white fish drifting past, sometimes stopping to look at you–an intruder from another world.",
                        
                    ],
                    image: "node-1",
                    edges: [
                        Edge(destinationId: 2,
                             prompt: "*Turn to the next page*")
                        ,
                    ],
                    ending: nil)

let emptyNode = Node(id: 0, paragraphs: [""], image: nil, edges: [], ending: Ending(classification: .great, description: "Lorem\\nipsum"))

// TODO: 5 - Replace the following list of nodes with your own group's nodes
// An array of nodes that model the narrative's directed graph
let storyNodes: [Int : Node] = [
    
    1 : testNode
    
    ,
    
    2: Node(id: 2,
         paragraphs: [
            "The cable attaching you to the *Maray* is extended to its limit. You have come to rest on a ledge near the canyon in the ocean floor that ancient myth says leads to the lost city of Atlantis.",
            
            "You have an experimental diving suit designed to protect you from the intense pressure of the deep. You should be able to leave the *Seeker* and explore the sea bottom. The new suit contains a number of the latest microprocessors enabling a variety of useful functions. It even has a built-in waterproof smart tablet with laser communicator. You can cut loose from the cable; the *Seeker* is self-propelled. You are now in another world. Remember, this is a dangerous world, an unknown world.",
            
            "As agreed, you signal the *Maray*, \"All systems GO. It's awesome down here.\"",
            
         ],
         image: nil,
         edges: [
            
            Edge(destinationId: 4,
                 prompt: "*If you decide to cut loose from the* Maray *and dive with the* Seeker *into the canyon in the ocean floor, turn to page 4.*")
            ,
            Edge(destinationId: 6, prompt: "*If you decide to explore the ledge where the* Seeker *has come to rest, turn to page 6.*")
            ,
            
         ],
         ending: nil)
    
    ,
    
    3 : Node(id: 3,
         paragraphs: [
            
            "Carefully maneuvering the *Seeker* between the walls of the canyon, you discover a large round hole. A stream of large bubbles flows steadily out of the hole. The *Seeker* is equipped with scientific equipment to analyze the bubbles. It also has sonar equipment that can measure depth. The ocean covers close to 90% of the earth and is mostly unknown. Who knows where this hole might lead?",
            
         ],
         image: nil,
         edges: [
            
            Edge(destinationId: 9,
                 prompt: "*If you decide to analyze the bubbles, turn to page 9.*")
            ,
            Edge(destinationId: 14,
                 prompt: "*If you decide to take depth readings, turn to page 14.*")
            ,
            
         ],
         ending: nil)
    
    ,
    
    4 : Node(id: 4,
         paragraphs: [
            
            "The *Maray* asks you for a more detailed status report, and you comply, telling them that you are going to cast off from the line and descend under your own power.",
            
            "Approval is given, and the *Seeker* slips silently into the undersea canyon.",
            
            "As you drop into the canyon, you turn on the *Seeker*'s searchlight. Straight ahead is a dark wall covered with a strange type of barnacle growth. To the left (port) side, you see what appears to be a grotto. The entrance is perfectly round, as if it had been cut by human hands.",
            
         ],
         image: nil,
         edges: [
            
            Edge(destinationId: 5,
                 prompt: "*Turn to the next page*")
            
         ],
         ending: nil)
    ,
    
    5 : Node(id: 5,
         paragraphs: [
            
            "White lantern fish give off a pale, greenish light. To the right (starboard) side of the *Seeker*, you see bubbles rising steadily from the floor of the canyon.",
            
         ],
         image: "node-4",
         edges: [
            
            Edge(destinationId: 3,
                 prompt: "*If you decide to investigate the bubbles, turn to page 3.*")
            
            ,
            
            Edge(destinationId: 8,
                 prompt: "*If you decide to investigate the grotto with the round entrance, turn to page 8.*")
            
            ,
            
         ],
         ending: nil)
    
    ,
    
    6 : Node(id: 6,
         paragraphs: [
            
            "Your dive suit is a tight fit and takes you some time to put it on. Finally, you slip from the airlock of the *Seeker* and stand on the ocean floor. It is a strange and marvelous world where your every move is slowed down. You begin the exploration with your halogen searchlight. The ledge hanging over the deep canyon is your starting point.",
            
         ],
         image: nil,
         edges: [
            
            Edge(destinationId: 7,
                 prompt: "*Turn to the next page*")
            
         ],
         ending: nil)
    
    ,
    
    7 : Node(id: 7,
         paragraphs: [
            
            "A strange feeling overcomes you, part warning, part terror. Then you see it. The *Seeker* is in the grips of a huge sea monster. It is similar to a squid, but it is enormous. The *Seeker* is just a toy in its long, powerful tentacles. You seek shelter behind a rock formation knowing the spear gun you carry will be useless against this monster. It looks as though it will destroy the *Seeker*. Fish of all sizes huddle with you in an attempt to escape the monster.",
            
         ],
         image: "node-6",
         edges: [
            
            Edge(destinationId: 10,
                 prompt: "*If you stay hidden close to the* Seeker, *turn to page 10.*")
            
            ,
            
            Edge(destinationId: 12,
                 prompt: "*If you try to escape in the hope that rescuers will see you, turn to page 12.*")
            
            ,
            
         ],
         ending: nil)
    
    ,
    
    8 : Node(id: 8,
         paragraphs: [
            
            "You pilot the *Seeker* through the rounded entrance to the grotto. Once inside, your searchlight picks up what appear to be docks and piers along the grotto walls. The *Seeker*'s searchlight is not very powerful. However, you do have a special laser light which would light up the grotto like daylight. Unfortunately, the laser light can only be used twice for very short periods before it must be recharged aboard the *Maray*, now more than 2,000 feet above you on the surface.",
            
         ],
         image: "node-8",
         edges: [
            
            Edge(destinationId: 13,
                 prompt: "*If you decide to cruise further into the grotto, turn to page 13.*")
            
            ,
            
            Edge(destinationId: 18,
                 prompt: "*If you decide to use the laser light, turn to page 18.*")
            
            ,
            
         ],
         ending: nil)
    
    ,
    
    9 : Node(id: 9,
         paragraphs: [
            
            "You squeeze into your dive suit. Now outside the *Seeker*, you use your miniaturized wrist computer to analyze the bubbles. As you work, you clumsily knock against the valve that dumps the compressed air necessary to make the *Seeker* rise to the surface. There is nothing to be done about it, so you continue to analyze the bubbles. They contain a high percentage of oxygen and no poisonous gases. Perhaps they are coming from some area below the sea where human–type beings can live and breathe? Perhaps they are coming from Atlantis?",
            
            "You could try to use the *Seeker*'s drilling arm to enlarge the source of the bubbles so you can explore further. But you are also worried about the *Seeker*'s loss of rising capability from bumping the valve. You might also be able to trap the bubbles and use them to raise the *Seeker*.",
            
         ],
         image: nil,
         edges: [
            
            Edge(destinationId: 21,
                 prompt: "*If you decide to drill, turn to page 21.*")
            
            ,
            Edge(destinationId: 25,
                 prompt: "*If you try to collect the bubbles coming from the hole to fill the tanks of the* Seeker, *turn to page 25.*")
            
            ,
            
         ],
         ending: nil)
    
    ,
    
    10 : Node(id: 10,
         paragraphs: [
            
            "The giant squid tosses and turns the *Seeker*, but finally the creature grows tired of its new game and lets off with an enormous squirt of water. You now are free to leave your hiding place and examine the *Seeker* for damage.",
            
            "To your dismay, the airlock entrance has been jammed shut. You are locked out of the *Seeker*. The crew of the *Maray*, however, suspected trouble when you did not respond to a routine radio check. They are now lowering an escape platform. Once on the platform, you radio them to start the slow pull to the surface. To avoid the deadly bends – rapid expansion of nitrogen bubbles in your blood – they will have to bring you up very slowly.",
            
         ],
         image: nil,
         edges: [
            
            Edge(destinationId: 11,
                 prompt: "*Turn to the next page*")
            
         ],
         ending: nil)
    
    ,
    
    11 : Node(id: 11,
         paragraphs: [
            
            "Just as the platform begins to move, the giant squid suddenly reappears. It is headed directly at you.",
            
         ],
         image: "node-10",
         edges: [
            
            Edge(destinationId: 16,
                 prompt: "*If you decide to fight the squid with your spear gun, hoping to scare it off, turn to page 16.*")
            
            ,
            
            Edge(destinationId: 19,
                 prompt: "*If you decide to signal Maray to pull you up at top speed, knowing you will get the bends, turn to page 19.*")
            
            ,
            
         ],
         ending: nil)
    
    ,
    
    12 : Node(id: 12,
         paragraphs: [
            
            "Moving cautiously, you climb up the sides of the canyon hoping to reach the ocean floor. Leaving the *Seeker* in the grips of the giant squid, you plan to signal for help with a bright yellow dye marker that will float to the surface. The *Maray* crew members above have been instructed to watch for this emergency signal. They will send help.",
            
            "Once you reach the ledge above the canyon and feel slightly safer, you see the most feared of all sea creatures – a huge Great White shark. It begins to circle towards you and you know that you are its target. You wonder whether you should fire your emergency propulsion charge that will send you rapidly to the surface. The shark is fast; he might catch you anyway. You also know that you will get the bends from the rapid rise to the surface.",
            
         ],
         image: "node-12",
         edges: [
            
            Edge(destinationId: 20,
                 prompt: "*If you decide to fire the special propulsion charge to get to the surface, turn to page 20.*")
            
            ,
            
            Edge(destinationId: 22,
                 prompt: "*If you decide to wait quietly, hoping that the shark will go away, turn to page 22.*")
            
            ,
            
         ],
         ending: nil)
    
    ,
    
    13 : Node(id: 13,
         paragraphs: [
            
            "You cruise silently into the grotto. Its roof slopes upward and you follow the slope. The depth finder shows that you are rising quite rapidly. Perhaps you will reach the surface and open air. The roof of the grotto stops sloping upward. Before you is a perfectly round metallic hatch made of a metal that you have never seen before. With the mechanical arm of the *Seeker* you try to open the hatch. No luck. Activating an electronic pulse generator, you bombard the hatch with electronic pulses – they are not meant to be hostile.",
            
         ],
         image: nil,
         edges: [
            
            Edge(destinationId: 24,
                 prompt: "*If you decide to blow the hatch open with an explosive charge, turn to page 24.*")
            
            ,
            
            Edge(destinationId: 27,
                 prompt: "*If you decide to continue transmitting radio communications through the hatch, turn to page 27.*")
            
            ,
            
         ],
         ending: nil)
    
    ,
    
    14 : Node(id: 14,
         paragraphs: [
            
            "Maneuvering the *Seeker* next to the hole, you begin to take sonar readings to determine its depth. To your amazement, the sonar readings indicate that the hole is extraordinarily deep – it might reach the center of the earth!",
            
            "What lies down there? Where are the bubbles coming from? Is Atlantis beneath you?",
            
         ],
         image: "node-14",
         edges: [
            
            Edge(destinationId: 15,
                 prompt: "*Turn to the next page*")
            
         ],
         ending: nil)
    
    ,
    
    15 : Node(id: 15,
         paragraphs: [
            
            "There is a sudden and disturbing digital reading on your instruments: a mid–ocean earthquake! The *Seeker* is not damaged, but the *Maray* might leave, and you will be abandoned. Maybe you should ascend right away and join the *Maray*. On the other hand, you are perhaps on the verge of one of the world's greatest discoveries.",
            
         ],
         image: nil,
         edges: [
            
            Edge(destinationId: 23,
                 prompt: "*If you decide to descend into the hole, turn to page 23.*")
            
            ,
            
            Edge(destinationId: 26,
                 prompt: "*If you decide to return to the surface, turn to page 26.*")
            
            ,
            
         ],
         ending: nil)
    
    ,
    
    16 : Node(id: 16,
         paragraphs: [
            
            "With a rush of water, the giant squid attacks. Two 20–foot tentacles with their pulsing suction cups reach out to ensnare you. You dive off the platform and fire two of your spears. They strike the squid close to its two monstrous eyes. The squid keeps on coming.",
            
            "One of the tentacles wraps around your diving helmet and ruptures the seal to your suit. You fire your last spear hoping to hit the monster in a vulnerable spot. Water is beginning to trickle into your suit. You signal the *Maray* to haul you up fast \"Emergency Hoist.\" You must have hit the squid. It floats away writhing and thrashing. You think you're about to black out.",
            
         ],
         image: "node-17",
         edges: [
            
            Edge(destinationId: 17,
                 prompt: "*Turn to the next page*")
            
         ],
         ending: nil)
    
    ,
    
    17 : Node(id: 17,
         paragraphs: [
            
            "You wake up on the deck of the *Maray* and are quickly rushed to the decompression chambers to ward off the effect of the bends. Several days later you are over the worst and starting to worry about diving into the abyss again. Can you do it? Do you have the nerve?",
            
         ],
         image: nil,
         edges: [
            
            Edge(destinationId: 31,
                 prompt: "*If you decide to quit the expedition now, turn to page 31.*")
            
            ,
            
            Edge(destinationId: 32,
                 prompt: "*If you decide to return to the deep, turn to page 32.*")
            
            ,
            
         ],
         ending: nil)
    
    ,
    
    18 : Node(id: 18,
         paragraphs: [
            
            "The beam from the laser light illuminates the entire grotto. Far back on the floor of the grotto is a submarine! Cautiously, you maneuver the *Seeker* closer. It's the submarine that mysteriously disappeared in the Bermuda Triangle almost a year before. The Bermuda Triangle is more than 2,000 miles away. How did the sub get here?",
            
            "It doesn't appear to be damaged, but it is covered with slimy algae. Beautiful fish swim around it as though it is their own special prize. Then you notice that the main hatch is free of algae!",
            
         ],
         image: nil,
         edges: [
            
            Edge(destinationId: 28,
                 prompt: "*If you decide to enter the submarine, turn to page 28.*")
            
            ,
            
            Edge(destinationId: 30,
                 prompt: "*If you decide to cruise on through the grotto ignoring the sub for now, turn to page 30.*")
            
            ,
            
         ],
         ending: nil)
    
    ,
    
    19 : Node(id: 19,
         paragraphs: [
            
            "As they begin the rapid hauling, you lose your ability to function in the deep. Dizziness overcomes you and your arms and legs feel weak. You lose your hold on the platform and drift in the water, exhausted. Surprisingly you see a dolphin heading right toward you. These marvelous mammals sometimes help people in trouble. Will it help you?",
            
         ],
         image: nil,
         edges: [
            
            Edge(destinationId: 34,
                 prompt: "*If you try to get help from the dolphin, turn to page 34.*")
            
            ,
            
            Edge(destinationId: 36,
                 prompt: "*If you decide to carry on alone swimming to the surface, turn to page 36.*")
            
            ,
            
         ],
         
         ending: nil)
    
    ,
    
    20 : Node(id: 20,
         paragraphs: [
            
            "You fire the special propulsion charge and zoom upward through the water, frightening schools of fish as you go. You become dizzy and lose track of where you are. The world seems upside down. The shark is nowhere around, you hope. Breaking through to the surface and floating about a half mile from the *Maray*, you unsuccessfully try to reach them with your digital communicator.",
            
            "The lookouts spot you in the water and they quickly rescue you. Unfortunately, the rapid ascent has given you a bad case of the bends. It takes a long time to decompress. And when you are finally all right, the ship's doctor informs you that your underwater days are over. Someone else will have to find Atlantis.",
            
         ],
         image: "node-20",
         edges: [],
         ending: Ending(classification: .disappointing,
                        description: "Severe case\\nof the bends"))
    
    ,
    
    21 : Node(id: 21,
         paragraphs: [
            
            "As you begin to drill, the stream of bubbles increases.",
            
            "The stream of bubbles is strong enough to ruffle the surface of the sea. You could try to surface now and locate the exact position of the bubble area. Then you could make plans with the scientists aboard the *Maray* about what to do next. On the other hand, you could simply explore the hole with the *Seeker* to determine the source of the bubbles now! There is great risk in entering the hole, but it could lead to the source of the bubbles and maybe to Atlantis.",
            
         ],
         image: nil,
         edges: [
            
            Edge(destinationId: 33,
                 prompt: "*If you try to surface, turn to page 33.*")
            
            ,
            
            Edge(destinationId: 38,
                 prompt: "*If you explore, turn to page 38.*")
            
            ,
            
         ],
         ending: nil)
    
    ,
    
    22 : Node(id: 22,
         paragraphs: [
            
            "You wait for the shark to go away. No luck! Other sharks are coming to join the hunt. They circle you, coming closer and faster each time. It is too late. There is no escape! The largest shark, jaws gaping, strikes!!!!",
            
         ],
         image: "node-22",
         edges: [],
         ending: Ending(classification: .catastrophic,
                        description: "Eaten by\\nlarge shark"))
    
    ,
    
    23 : Node(id: 23,
         paragraphs: [
            
            "Now is the time for decision. You check all the controls of the *Seeker*, grit your teeth, and push the control column into the deep dive position. Down, down you go where no person has ever ventured. The *Seeker* is built for deep, deep dives, but you are descending rapidly mile after mile into the deep. The pressure is intense, the darkness is complete, and the depth gauge indicates an incredible fifteen miles. You quickly reverse the control column. Warning lights flare up on your control panel; they show that gravitational forces are now stronger than the *Seeker*'s propulsion motors. You have passed the point of no return and your journey downward will continue in utter darkness until the water pressure is too great for the *Seeker*. This is the final voyage.",
            
         ],
         image: nil,
         edges: [],
         ending: Ending(classification: .catastrophic,
                        description: "Crushed by\\nimplosion"))
    
    ,
    
    24 : Node(id: 24,
         paragraphs: [
            
            "The only way to get beyond the door is to blast it away, or so you believe. The *Seeker*'s laser cannon is powerful and you position the *Seeker* to fire. Pushing the fire button, you send a powerful beam at the hatch. Nothing happens. Then you advance the cannon control to full emergency force. Again you push the button and the beam dissolves the hatch instantly. A flood of seawater rushes into the giant hole, carrying you with it into an air–filled cavern beyond. The water fills the cavern with speed and explosive force. You see several people scurrying towards escape hatches. IT IS TOO LATE! You did the wrong thing. There is no turning back.",
            
         ],
         image: nil,
         edges: [],
         ending: Ending(classification: .catastrophic,
                        description: "Drowned in\\ncavern"))
    
    ,
    
    25 : Node(id: 25,
         paragraphs: [
            
            "You are able to capture the bubbling gases and fill the tanks of the *Seeker*, enough to allow it to rise. Slowly, the *Seeker* rises out of the canyon, scattering schools of brightly colored fish, and brushing past underwater plants that wave like palm trees in a wind. Just as you reach the ledge at the top of the canyon, you see what appears to be an old road! Rocks along its side look like old Roman distance markers. Could this be a path that leads to the lost city of Atlantis? You anchor the *Seeker* and prepare to investigate more closely.",
            
         ],
         image: "node-25",
         edges: [
            
            Edge(destinationId: 6,
                 prompt: "*Turn to page 6.*")
            
            ,
            
         ],
         ending: nil)
    
    ,
    
]

// Function to generate output that Graphviz requires
func generateGraphvizCommands(using description: StoryInformation, with nodes: [Int : Node]) -> String {
    
    // Opening of graph
    var output = "digraph \"[map]\" {\n"

    // Start subgraph which contains table that comprises title section
    output += "subgraph { \"title\" [shape=none label=<<table border=\"0\">\n"
    output += "  <tr>\n"
    output += "    <td align=\"left\"><font face=\"Verdana,Helvetica\" point-size=\"40\"><b>\(description.title)</b></font></td>\n"
    output += "    <td width=\"100\"></td>\n"
    output += "  </tr>\n"
    output += "  <tr>\n"
    output += "    <td align=\"left\"><font face=\"Verdana,Helvetica\" point-size=\"20\">By \(description.authorOrAuthors)</font></td>\n"
    output += "    <td></td>"
    output += "  </tr>\n"
    output += "  <tr>\n"
    output += "    <td>&nbsp;</td>\n"
    output += "    <td></td>"
    output += "  </tr>\n"
    output += "  <tr>\n"
    output += "    <td align=\"left\"><font face=\"Verdana,Helvetica\" point-size=\"16\">\(description.seriesInfo)</font></td>\n"
    output += "    <td></td>"
    output += "  </tr>\n"
    output += "  <tr>\n"
    output += "    <td align=\"left\"><font face=\"Verdana,Helvetica\" point-size=\"16\">\(description.publisherInfo)</font></td>\n"
    output += "    <td></td>"
    output += "  </tr>\n"

    // End the table that comprises title section
    output += "</table>>]\n"
    output += "}\n"

    // Make empty dictionary to track endings
    var endingsCount = [String : Int]()

    // Build the graph itself from a sorted list of the nodes
    for (key, node) in nodes.sorted(by: { lhs, rhs in lhs.key < rhs.key }) {
        
        // Handle ending nodes
        if let ending = node.ending {
            
            // Make ending nodes show up in red
            output += "\(key) [style=\"filled\", fillcolor=\"\(ending.color)\"]\n"
            
            // Create an invisible node after each ending node
            output += "\"\(ending.description) \(node.id)\" [style=invis]\n"
            
            // Make a label after the ending node
            output += "\(key) -> \"\(ending.description) \(node.id)\" [labelangle=0, minlen=3,  color=white, taillabel=\"\\n\(ending.description)\", fontname=\"Helvetica Bold\"]\n"
            
            // Track endings by category
            if let valueForKey = endingsCount[ending.classification.rawValue] {
                // Increment count of endings of this type
                endingsCount[ending.classification.rawValue]! = valueForKey + 1
            } else {
                // Start count of endings of this type
                endingsCount[ending.classification.rawValue] = 1
            }
        }
            
        // Draw nodes and edges between nodes
        output += "\(key) -> {"
        for edge in node.edges {
            output += "\(edge.destinationId);"
        }
        output += "} [minlen=2]\n"
    }

    // Start subgraph which endings analysis
    output += "subgraph { \"endings\" [shape=none label=<<table border=\"0\">\n"
    output += "  <tr>\n"
    output += "  <td width=\"100\"></td>\n"
    output += "    <td colspan=\"2\" align=\"left\"><font face=\"Verdana,Helvetica\" point-size=\"20\"><b>&nbsp;</b></font></td>\n"
    output += "  </tr>\n"
    output += "  <tr>\n"
    output += "  <td></td>\n"
    output += "    <td colspan=\"2\" align=\"left\"><font face=\"Verdana,Helvetica\" point-size=\"20\"><b>&nbsp;</b></font></td>\n"
    output += "  </tr>\n"
    output += "  <tr>\n"
    output += "  <td></td>\n"
    output += "    <td colspan=\"2\" align=\"left\"><font face=\"Verdana,Helvetica\" point-size=\"20\"><b>Analysis of endings</b></font></td>\n"
    output += "  </tr>\n"

    // Make placeholders for counts of ending types
    for enumerationCase in EndingClassification.allCases {
        
        // Get count of endings for this ending type
        var countForThisEndingType = 0
        if let count = endingsCount[enumerationCase.rawValue] {
            countForThisEndingType = count
        }
        
        output += "  <tr>\n"
        output += "  <td></td>\n"
        output += "<td align=\"right\" valign=\"top\"><font face=\"Verdana,Helvetica\" point-size=\"16\">\(countForThisEndingType)</font></td>"
        output += "    <td align=\"left\" valign=\"bottom\"><font face=\"Verdana,Helvetica\" point-size=\"18\" color=\"\(Ending.init(classification: enumerationCase, description: "").color)\"><b>\(enumerationCase.rawValue)</b></font></td>\n"
        output += "  </tr>\n"
    }

    // End the table that comprises title section
    output += "</table>>]\n"
    output += "}\n"

    // Close out the graph
    output += "}\n"
    
    return output
    
}

let graphVizCommands = generateGraphvizCommands(using: storyInfo,
                                                with: storyNodes)

// Copy to the clipboard
let pasteBoard = NSPasteboard.general
pasteBoard.clearContents()
pasteBoard.setString(graphVizCommands, forType: .string)

// TODO: 6 - Paste the output from this program into a BBEdit text document named 'input.txt'.

// TODO: 7 - If you have not yet, install Homebrew.
//
//       https://brew.sh

// TODO: 8 - If you have not yet, install graphviz by running this command in the Terminal
//
//       brew install graphviz

// TODO: 9 - In the Terminal, from the folder 'input.txt' exists in, run the following command to generate your group's graph:
//
//           dot -Tpdf input.txt > output.pdf
