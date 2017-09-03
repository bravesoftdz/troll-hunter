unit uAffixes;

interface

uses uEntity, uItem;

// Prefix:
// Minotaur, Ogre, Trollish, Dragon (Str),
// Elven, Lizardman (Dex),
// Suffix:
// of Defense

type
  TSuffixBase = record
    Level: Byte;
    Color: Cardinal;
    Price: TMinMax;
    Occurence: set of TItemType;
    Durability: Word;
    Defense: TMinMax;
    Damage: TBaseDamage;
  end;

implementation

end.