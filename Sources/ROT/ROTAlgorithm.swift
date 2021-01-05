public struct ROTAlgorithm {

    public init(rotationDistance: Int = 13) {
        self.rotationDistance = rotationDistance
    }

    public func encode(_ string: String) -> String {
        rotate(string: string, by: rotationDistance)
    }

    public func decode(_ string: String) -> String {
        rotate(string: string, by: -rotationDistance)
    }

    // MARK: - Private

    private func rotate(character: UnicodeScalar, by distance: Int) -> UnicodeScalar {
        var charValue = character.value

        var rot = distance
        while rot < 0 { rot += 26 }
        let rotationDistance = UInt32(rot % 26)
        switch charValue {
            case 65...90: // Capital letters
                charValue = (charValue - 65 + rotationDistance) % 26 + 65
            case 97...122: // Lowercase letters
                charValue = (charValue - 97 + rotationDistance) % 26 + 97
            default: break // Only modify alphabet characters
        }
        return UnicodeScalar(charValue)!
    }

    private func rotate(string: String, by distance: Int) -> String {
        let rotatedUSV = string.unicodeScalars.map( { rotate(character: $0, by: distance) } )
        var resultUSV = String.UnicodeScalarView()
        resultUSV.append(contentsOf: rotatedUSV)
        return String(resultUSV)
    }

    // MARK: - Properties

    public let rotationDistance: Int
}
