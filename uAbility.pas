unit uAbility;

interface

type
  TAbilityEnum = (abPoisoned, abBlinded, abStunned, abBurning, abRegen,
    abSleeping, abBloodlust);

type
  TSetOfAbility = set of TAbilityEnum;

type
  TAbilities = class(TObject)
  private
    FAbility: array [TAbilityEnum] of Word;
    function GetAbility(I: TAbilityEnum): Word;
    procedure SetAbility(I: TAbilityEnum; const Value: Word);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    property Ability[I: TAbilityEnum]: Word read GetAbility write SetAbility;
    function IsAbility(Value: TAbilityEnum): Boolean;
    procedure Modify(I: TAbilityEnum; Value: Integer);
    function GetName(Value: TAbilityEnum): string;
  end;

implementation

{ TAbility }

uses uTerminal, GNUGetText, uEntity;

procedure TAbilities.Modify(I: TAbilityEnum; Value: Integer);
begin
  FAbility[I] := FAbility[I] + Value;
end;

procedure TAbilities.Clear;
var
  I: TAbilityEnum;
begin
  for I := Low(TAbilityEnum) to High(TAbilityEnum) do
    Ability[I] := 0;
end;

constructor TAbilities.Create;
begin
  Self.Clear;
end;

destructor TAbilities.Destroy;
begin

  inherited;
end;

function TAbilities.GetAbility(I: TAbilityEnum): Word;
begin
  Result := FAbility[I]
end;

function TAbilities.GetName(Value: TAbilityEnum): string;
begin
  case Value of
    abPoisoned:
      Result := Terminal.Colorize(_('Poisoned'), 'Lighter Green');
    abBlinded:
      Result := Terminal.Colorize(_('Blinded'), 'White');
    abStunned:
      Result := Terminal.Colorize(_('Stunned'), 'Dark Yellow');
    abBurning:
      Result := Terminal.Colorize(_('Burning'), 'Light Red');
    abRegen:
      Result := Terminal.Colorize(_('Regen'), 'Lighter Red');
    abSleeping:
      Result := Terminal.Colorize(_('Sleeping'), 'Yellow');
    abBloodlust:
      Result := Terminal.Colorize(_('Bloodlust'), 'Dark Red');
  end;
end;

function TAbilities.IsAbility(Value: TAbilityEnum): Boolean;
begin
  Result := Ability[Value] > 0;
end;

procedure TAbilities.SetAbility(I: TAbilityEnum; const Value: Word);
begin
  FAbility[I] := Value;
end;

end.
