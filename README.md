# ROT.swift

This package implements a simple rotation cipher algorithm. Use it by creating an instance of ROTAlgorithm. Use its `encode(_ string:)` method to encode a string, then `decode(_ string:)` to decode that string back to the original input. You can select any rotation distance using the optional `rotationDistance` argument on the initializer. Note that while any Int is accepted, they essentially reduce to values 1-25.

**NOTE**: This is a simple package used in a demonstaration of the Swift Package Manager. It is in no way intended for real use.
