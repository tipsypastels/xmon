# If you want to raise this above 100, you may need to change the internal type to something bigger than UInt8.
# UInt8 only goes up to 127, so you can change it to UInt16 if you need above that for some reason.
# If you want negative levels (kinda weird, but idk) use `Int` types instead of `UInt`.
alias Level = UInt8
MAX_LEVEL = 100.as(Level)
