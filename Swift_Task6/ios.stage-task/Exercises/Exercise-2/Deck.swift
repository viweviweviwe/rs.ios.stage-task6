import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {

    //MARK: - Properties

    var cards = [Card]()
    var type: DeckType
    var trump: Suit?

    var total:Int {
        return type.rawValue
    }
}

extension Deck {

    init(with type: DeckType) {
        self.type = type
        let suits = Suit.allCases
        let values = Value.allCases
        cards = createDeck(suits: suits, values: values)
    }

    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        var starterDesk = [Card]()
        
        for suit in suits {
            for value in values {
                starterDesk.append(Card(suit: suit, value: value))
            }
        }
       
        return starterDesk
    }

    public mutating func shuffle() {

        cards = cards.shuffled()
    }

    public mutating func defineTrump() {
        
        trump = cards.first?.suit
        setTrumpCards(for: trump!)
    }

    public mutating func initialCardsDealForPlayers(players: [Player]) {
        if players.count < 7 {
            for player in players {
                player.hand = [Card]()
                for _ in 0..<6 {
                    player.hand?.append(cards.removeFirst())
                }
            }
        }
    }

    public mutating func setTrumpCards(for suit:Suit) {
        for (index,card) in cards.enumerated() {
            if card.suit == suit {
                cards[index].isTrump = true
            }
        }
    }
}

