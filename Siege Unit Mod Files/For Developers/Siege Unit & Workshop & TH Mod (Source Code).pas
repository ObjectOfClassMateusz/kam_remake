*******************************************************
*  Siege Units and Town Hall Remake Revision r153796  *
*  (by cmowla - February 12, 2025)                    *
*******************************************************
(Last modified on February 25, 2025.)
(Search for @@@ for bug fixes since official/major release!  Part 26 Onward is new.)



*************************************************************************
* Part 0 - Compiling KaM Remake
*************************************************************************




=========================================================================
..\KaM_Remake.inc [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//Use secure authentication unit (KM_NetAuthSecure)
{$DEFINE USESECUREAUTH}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//Use secure authentication unit (KM_NetAuthSecure)
{.$DEFINE USESECUREAUTH}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 1 - Initial "adding a new unit stuff"
*************************************************************************




=========================================================================
..\src\common\KM_Defaults.pas [7 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    utRebel,        utRogue,        utWarrior,       utVagabond,
    //utCatapult,   utBallista,
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    utRebel,        utRogue,        utWarrior,       utVagabond,
    utCatapult, utBallista, //cmowla (Add in New Unit)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WARRIOR_MAX = utVagabond;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WARRIOR_MAX = utBallista; //cmowla (Add in New Unit)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  HUMANS_MAX = utVagabond;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  HUMANS_MAX = utBallista; //cmowla (Add in New Unit)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  UNITS_HUMAN = [HUMANS_MIN..HUMANS_MAX];
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  UNITS_HUMAN = [HUMANS_MIN..HUMANS_MAX];
  SIEGE_UNITS = [utCatapult, utBallista]; //cmowla (Add in New Unit)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  CITIZENS_CNT = Integer(CITIZEN_MAX) - Integer(CITIZEN_MIN) + 1;
  WARRIORS_CNT = Integer(WARRIOR_MAX) - Integer(WARRIOR_MIN) + 1;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  CITIZENS_CNT = Integer(CITIZEN_MAX) - Integer(CITIZEN_MIN) + 1;
  WARRIORS_CNT = Integer(WARRIOR_MAX) - Integer(WARRIOR_MIN) + 1;
  HIGH_WARRIORS = WARRIORS_CNT - 1; //cmowla (Add in New Unit)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    gtMounted           //utHorseman
    {gtRanged,gtRanged, //utCatapult, utBallista,}
    );
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    gtMounted           //utHorseman
    ,gtRanged, gtRanged //cmowla (Add in New Unit)
    );
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    5.3, 2.1        // utMetalBarbarian, utHorseman
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    5.3, 2.1        // utMetalBarbarian, utHorseman
    ,12, 12 //cmowla (Add in New Unit)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\res\KM_ResUnits.pas [6 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    -1,-1,-1,-1, {-1,-1,} //TPR warriors (can't be placed with SET_UNIT)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    -1,-1,-1,-1,-1,-1, //TPR warriors (can't be placed with SET_UNIT)  //cmowla (Add in New Unit)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    {utCatapult,utBallista}utNone,utNone, //Placeholder for Seige weapons
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    utCatapult,utBallista,  //cmowla (Add in New Unit)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    24,25,26,27, {28,29,} //TPR warriors
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    24,25,26,27,28,29, //TPR warriors  //cmowla (Add in New Unit)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




function TKMUnitSpec.SupportsAction(aAct: TKMUnitActionType): Boolean;

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    [uaWalk, uaWork, uaSpec, uaDie, uaEat], //Warrior
    [uaWalk, uaWork, uaDie, uaEat],
    [uaWalk], [uaWalk], [uaWalk], [uaWalk], [uaWalk], [uaWalk], [uaWalk], [uaWalk] //Animals
  );
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    [uaWalk, uaWork, uaSpec, uaDie, uaEat], //Warrior
    [uaWalk, uaWork, uaDie, uaEat],
    [uaWalk, uaWork, uaDie], //cmowla (Add in New Unit) - Catapult Unit Actions
    [uaWalk, uaWork, uaDie], //cmowla (Add in New Unit) - Ballista Unit Actions
    [uaWalk], [uaWalk], [uaWalk], [uaWalk], [uaWalk], [uaWalk], [uaWalk], [uaWalk] //Animals
  );
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




function TKMUnitSpec.GetFightType: TKMFightType;

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    {ftRanged,ftRanged,       //utCatapult, utBallista,}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    ,ftRanged, ftRanged //cmowla (Add in New Unit)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




function TKMUnitSpec.GetMinimapColor: Cardinal;

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    0,0,0,0,0,0,0,0,0,0,
    $B0B0B0,$B08000,$B08000,$80B0B0,$00B0B0,$B080B0,$00B000,$80B0B0); //Exact colors can be tweaked
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    0,0,0,0,0,0,0,0,0,0,0,0, //cmowla (Add in New Unit)
    $B0B0B0,$B08000,$B08000,$80B0B0,$00B0B0,$B080B0,$00B000,$80B0B0); //Exact colors can be tweaked
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\res\KM_ResSound.pas [2 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    'rebel', 'rogue', 'warrior', 'vagabond');
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    'rebel', 'rogue', 'warrior', 'vagabond','',''); //cmowla (Add in New Unit) - The sound files are in the SIEGE_UNIT_FILES_FOLDER, so we don't need to put their names in '' here.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    'bowman', 'lanceman', 'barbarian', 'cavalry');
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    'bowman', 'lanceman', 'barbarian', 'cavalry','',''); //cmowla (Add in New Unit)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\scripting\KM_Scripting.pas [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      'utBarbarian, utRebel, utRogue, utWarrior, utVagabond, ' +
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      'utBarbarian, utRebel, utRogue, utWarrior, utVagabond, utCatapult, utBallista, ' + //cmowla (Add in New Unit)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 2 - Fixing Application Startup Error
*************************************************************************
{At this point, the application compiles, but when it's started, we immediately get an error.
It "turns out", that if we hard code in the "SizeOf" statements for the following
(the same as if we didn't add in utCatapult and utBallista at all), then that fixes the problem.}
=========================================================================
..\src\res\KM_ResInterpolation.pas [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMResInterpolation.LoadFromFile(const FileName: string);
var
  S: TKMemoryStreamBinary;
begin
  if not FileExists(FileName) then Exit;

  S := TKMemoryStreamBinary.Create;
  try
    S.LoadFromFile(FileName);

    S.CheckMarker('UnitAction');
    S.Read(fUnitActions, SizeOf(fUnitActions));

    S.CheckMarker('SerfCarry ');
    S.Read(fSerfCarry, SizeOf(fSerfCarry));

    S.CheckMarker('UnitThoughts  ');
    S.Read(fUnitThoughts, SizeOf(fUnitThoughts));

    S.CheckMarker('Trees ');
    S.Read(fTrees, SizeOf(fTrees));

    S.CheckMarker('Houses');
    S.Read(fHouses, SizeOf(fHouses));

    S.CheckMarker('Beasts');
    S.Read(fBeasts, SizeOf(fBeasts));
  finally
    S.Free;
  end;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

//cmowla (Add in New Unit)
procedure TKMResInterpolation.LoadFromFile(const FileName: string);
var
  S: TKMemoryStreamBinary;
begin
  if not FileExists(FileName) then Exit;

  S := TKMemoryStreamBinary.Create;
  try
    S.LoadFromFile(FileName);

    S.CheckMarker('UnitAction');
    S.Read(fUnitActions, 3594240);

    S.CheckMarker('SerfCarry ');
    S.Read(fSerfCarry, 215040);

    S.CheckMarker('UnitThoughts  ');
    S.Read(fUnitThoughts, 8640);

    S.CheckMarker('Trees ');
    S.Read(fTrees, 245760);

    S.CheckMarker('Houses');
    S.Read(fHouses, 528960);

    S.CheckMarker('Beasts');
    S.Read(fBeasts, 43200);
  finally
    S.Free;
  end;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 3 - Fix "range check error" (boundary error) - Advanced AI
*************************************************************************
{Start any map with Advanced AI to get the error almost immediately.}




=========================================================================
..\src\ai\newAI\KM_Supervisor.pas [1 Item]


procedure TKMSupervisor.AttackCluster(aAttack: Boolean; aCCTIdx: Word; var A: pTKMGroupCounterWeightArray; const E: TKMUnitGroupArray; const H: TKMHouseArray);

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  WarriorPrice: array [utMilitia..utVagabond] of Single = (
    1.0,2.0,3.0,2.0,3.0, // utMilitia,utAxeFighter,utSwordsman,utBowman,utArbaletman,
    2.0,3.0,2.0,3.0,     // utPikeman,utHallebardman,utHorseScout,utCavalry
    3.5,1.0,1.0,3.5,1.0  // utBarbarian,utPeasant,utSlingshot,utMetalBarbarian,utHorseman
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//cmowla (Add in New Unit)
  WarriorPrice: array [WARRIOR_MIN..WARRIOR_MAX] of Single = ( //<--Notice this!
    1.0,2.0,3.0,2.0,3.0, // utMilitia,utAxeFighter,utSwordsman,utBowman,utArbaletman,
    2.0,3.0,2.0,3.0,     // utPikeman,utHallebardman,utHorseScout,utCavalry
    3.5,1.0,1.0,3.5,1.0,6,6 // utBarbarian,utPeasant,utSlingshot,utMetalBarbarian,utHorseman
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 4 - Fix remaining "boundaries"
*************************************************************************




=========================================================================
..\src\gui\KM_InterfaceGame.pas [2 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  Soldiers_Order: array[0..13] of TKMUnitType = (
    utMilitia, utAxeFighter, utSwordFighter, utBowman, utCrossbowman,
    utLanceCarrier, utPikeman, utScout, utKnight,
    utRebel, utRogue, utVagabond, utBarbarian, utWarrior);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  Soldiers_Order: array[0..HIGH_WARRIORS] of TKMUnitType = (  //<--Notice this!
    utMilitia, utAxeFighter, utSwordFighter, utBowman, utCrossbowman,
    utLanceCarrier, utPikeman, utScout, utKnight,
    utRebel, utRogue, utVagabond, utBarbarian, utWarrior, utCatapult, utBallista); //cmowla (Add in New Unit)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  MapEd_Order: array [0..13] of TKMUnitType = (
    utMilitia, utAxeFighter, utSwordFighter, utBowman, utCrossbowman,
    utLanceCarrier, utPikeman, utScout, utKnight, utBarbarian,
    utRebel, utRogue, utWarrior, utVagabond);

  MapEd_Icon: array [0..13] of Word = (
    61, 62, 63, 64, 65,
    66, 67, 68, 69, 70,
    79, 80, 81, 82);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  MapEd_Order: array [0..HIGH_WARRIORS] of TKMUnitType = (  //<--Notice this!
    utMilitia, utAxeFighter, utSwordFighter, utBowman, utCrossbowman,
    utLanceCarrier, utPikeman, utScout, utKnight, utBarbarian,
    utRebel, utRogue, utWarrior, utVagabond, utCatapult, utBallista);

  MapEd_Icon: array [0..HIGH_WARRIORS] of Word = (  //<--Notice this!
    61, 62, 63, 64, 65,
    66, 67, 68, 69, 70,
    79, 80, 81, 82, 680, 681);  //cmowla (Add in Unit Icons) - References NEW sprites in the SIEGE_UNIT_FILES_FOLDER folder.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\common\KM_Defaults.pas [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
unit KM_Defaults;
{$I KaM_Remake.inc}
interface
uses
  SysUtils;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
unit KM_Defaults;
{$I KaM_Remake.inc}
interface
uses
  SysUtils;

Var
  usersLanguage: String;  //cmowla Weapon Buildings Have "order" instead of "delivers"
//  ticksPerRun: Integer;  //cmowla siege workshop [time cycle] - Get it only (debugging).

const
  MAX_SIEGEWORKSHOPS_CLASSICAL_AI = 1;
  MAX_CATAPULTS_CLASSICAL_AI = 2;
  MAX_BALLISTAS_CLASSICAL_AI = 2;

  MAX_SIEGEWORKSHOPS_ADVANCED_AI = 1;
  MAX_CATAPULTS_ADVANCED_AI = 2;
  MAX_BALLISTAS_ADVANCED_AI = 2;
  MIN_SIEGE_WORKSHOP_BUILD_MINUTE = 53;
  MAX_SERFS_ADVANCED_AI = 95; //cmowla Advanced AI Support - MAX_SERFS_ADVANCED_AI Serf Limit

  CATAPULT_FIRE_DELAY_VS_UNITS = 65; //In ticks (30 = minimum)
  BALLISTA_FIRE_DELAY_VS_UNITS = 65; //In ticks (30 = minimum)

  CATAPULT_FIRE_DELAY_VS_HOUSES = 50; //In ticks (30 = minimum)
  BALLISTA_FIRE_DELAY_VS_HOUSES = 50; //In ticks (30 = minimum)

  CATAPULT_DAMAGE_PROBABILITY = 50; //Percent of the time a catapult will cause at least SOME damage to enemy unit (1 or 2 HP).

//This is NOT a percentage (it's a factor).
//The more catapults there are in a group, the more noticable the change is.  (The greater the value, the more the potency.)
//(45 - 55 seems to be a reasonable base range to consider.)
  CATAPULT_POTENCY = 45;

  BALLISTA_POTENCY = 80; //The percentage of the time a ballista bolt kills a unit it reaches.  (Otherwise, no damage is done.)

  SIEGE_UNIT_FILES_FOLDER = 'Siege Unit Mod Files';
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=================================================================================
..\src\res\KM_ResSound.pas [2 Items]


procedure TKMResSounds.LoadSoundsDAT; (1)

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if not FileExists(ExeDir + 'data' + PathDelim + 'sfx' + PathDelim + 'sounds.dat') then Exit;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if not FileExists(ExeDir + SIEGE_UNIT_FILES_FOLDER + PathDelim + 'sounds.dat') then Exit; //cmowla sound effects
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




procedure TKMResSounds.LoadSoundsDAT; (2)

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  S.LoadFromFile(ExeDir + 'data' + PathDelim + 'sfx' + PathDelim + 'sounds.dat');
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  S.LoadFromFile(ExeDir + SIEGE_UNIT_FILES_FOLDER + PathDelim + 'sounds.dat'); //cmowla sound effects
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=================================================================================
..\src\res\KM_ResSprites.pas [2 Items]


function TKMResSprites.LoadSprites(aRT: TRXType; aAlphaShadows: Boolean): Boolean;

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  fSprites[aRT].OverloadRXDataFromFolder(ExeDir + 'Modding graphics' + PathDelim);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  fSprites[aRT].OverloadRXDataFromFolder(ExeDir + SIEGE_UNIT_FILES_FOLDER + PathDelim);    //cmowla Game Setup
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




procedure TTGameResourceLoader.Execute;

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
                          fResSprites[RXType].OverloadGeneratedFromFolder(fAlphaShadows, ExeDir + 'Modding graphics' + PathDelim, True, IsTerminated);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
                          fResSprites[RXType].OverloadGeneratedFromFolder(fAlphaShadows, ExeDir + SIEGE_UNIT_FILES_FOLDER + PathDelim, True, IsTerminated); //cmowla Game Setup
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\res\KM_ResSound.pas [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    WarriorSoundCount: array[WARRIOR_MIN..WARRIOR_MAX, TWarriorSpeech] of byte;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    WarriorSoundCount: array[WARRIOR_MIN..utVagabond, TWarriorSpeech] of byte; //cmowla (Add in New Unit) - Only a subset of the sounds would work before I changed this!
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 5 - Siege Unit Sound Effects (from External Files)
*************************************************************************




=========================================================================
..\src\media\KM_Sound.pas [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMSoundPlayer.PlayWarrior(aUnitType: TKMUnitType; aSound: TWarriorSpeech; const aLoc: TKMPointF);
var
  wave: UnicodeString;
  hasLoc: Boolean;
  count: Byte;
begin
  if SKIP_SOUND or not fIsSoundInitialized then Exit;
  if not (aUnitType in [WARRIOR_MIN..WARRIOR_MAX]) then Exit;

  count := gRes.Sounds.WarriorSoundCount[aUnitType, aSound];

  hasLoc := not KMSamePointF(aLoc, KMPOINTF_ZERO);
  wave := gRes.Sounds.FileOfWarrior(aUnitType, aSound, Random(count));
  if FileExists(wave) then
    PlayWave(wave, aLoc, gRes.Sounds.GetSoundType(aSound), hasLoc, 1 + 3*Byte(hasLoc)); //Attenuate sounds when aLoc is valid
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMSoundPlayer.PlayWarrior(aUnitType: TKMUnitType; aSound: TWarriorSpeech; const aLoc: TKMPointF);
var
  wave: UnicodeString;
  hasLoc: Boolean;
  count: Byte;
  soundType: String;
  volumeAdjustment: Single;
begin
  if SKIP_SOUND or not fIsSoundInitialized then Exit;
  if not (aUnitType in [WARRIOR_MIN..WARRIOR_MAX]) then Exit;

//cmowla sound effects
  volumeAdjustment := 0;
  If aUnitType in SIEGE_UNITS Then begin
    Case aSound of
      spSelect: soundType := 'SELECT0';
      spRotLeft: soundType := 'LEFT0';
      spRotRight: soundType := 'RIGHT0';
      spSplit: soundType := 'HALVE0';
      spJoin: soundType := 'JOIN0';
      spHalt: soundType := 'HALT0';
      spMove: soundType := 'SEND0';
      spAttack: soundType := 'ATTACK0';
      spFormation: soundType := 'FORMAT0';
      spDeath: soundType := 'DEATH0';
    end;
    Case aUnitType of
      utCatapult:  begin
        wave := ExeDir + SIEGE_UNIT_FILES_FOLDER + PathDelim + 'Sounds' + PathDelim + 'Catapult' + PathDelim + soundType + '.wav';
        Case aSound of spSelect, spRotLeft, spRotRight, spSplit, spJoin: volumeAdjustment := 0.5; end; //Lower volume for these catapult sounds!  (Too loud!)
      end;
      utBallista:  wave := ExeDir + SIEGE_UNIT_FILES_FOLDER + PathDelim + 'Sounds' + PathDelim + 'Ballista' + PathDelim + soundType + '.wav';
    end;
   end Else begin
    count := gRes.Sounds.WarriorSoundCount[aUnitType, aSound];
    wave := gRes.Sounds.FileOfWarrior(aUnitType, aSound, Random(count));
   end;

  hasLoc := not KMSamePointF(aLoc, KMPOINTF_ZERO);
  if FileExists(wave) then
    PlayWave(wave, aLoc, gRes.Sounds.GetSoundType(aSound), hasLoc, 1 + 3*Byte(hasLoc) - volumeAdjustment); //Attenuate sounds when aLoc is valid
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\res\KM_ResSound.pas [1 Item]

procedure TKMResSounds.ScanWarriorSounds;

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  for U := WARRIOR_MIN to WARRIOR_MAX do
    for WS := Low(TWarriorSpeech) to High(TWarriorSpeech) do
      for I := 0 to 255 do
        if not FileExists(FileOfWarrior(U, WS, I)) then
        begin
          WarriorSoundCount[U, WS] := I;
          Break;
        end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  for U := WARRIOR_MIN to WARRIOR_MAX do
    for WS := Low(TWarriorSpeech) to High(TWarriorSpeech) do
      for I := 0 to 255 do
        If not FileExists(FileOfWarrior(U, WS, I))
        And (Not (U in SIEGE_UNITS)) //cmowla (Add in New Unit)
        Then begin
          WarriorSoundCount[U, WS] := I;
          Break;
        end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 6 - View Siege Unit Icons (from Map Editor)
*************************************************************************




=========================================================================
..\src\gui\pages_maped\town\KM_GUIMapEdTownUnits.pas [3 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      Button_Warriors: array [0..13] of TKMButtonFlat;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      Button_Warriors: array [0..HIGH_WARRIORS] of TKMButtonFlat;  //cmowla (Add in Unit Icons)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
constructor TKMMapEdTownUnits.Create(aParent: TKMPanel);
const
  MAPED_FISH_CNT_DEFAULT = 50;
var
  I: Integer;
  lineY: Word;
begin
  inherited Create;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
constructor TKMMapEdTownUnits.Create(aParent: TKMPanel);
const
  MAPED_FISH_CNT_DEFAULT = 50;
var
  I: Integer;
  lineY: Word;
  xOffset: Byte; //cmowla (Add in Unit Icons)
begin
  xOffset := 18;  //cmowla (Add in Unit Icons)
  inherited Create;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




constructor TKMMapEdTownUnits.Create(aParent: TKMPanel);

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  lineY := 258;

  with TKMLabel.Create(Panel_Units, 9, lineY, Panel_Units.Width, 20, gResTexts[TX_MAPED_UNITS_FORMATION_NUMBER], fntMetal, taLeft) do
  begin
    Anchors := [anLeft, anTop, anRight];
    Hint := gResTexts[TX_MAPED_UNITS_FORMATION_NUMBER_HINT];
  end;

  NumEd_WarrCount := TKMNumericEdit.Create(Panel_Units, 9, lineY + 20, 0, MAPED_GROUP_MAX_CNT);
  NumEd_WarrCount.Anchors := [anLeft, anTop, anRight];
  NumEd_WarrCount.Hint := gResTexts[TX_MAPED_UNITS_FORMATION_NUMBER_HINT];
  NumEd_WarrCount.AutoFocusable := False;
  NumEd_WarrCount.OnChange := Town_NumericChange;
  NumEd_WarrCount.Value := 1;

  with TKMLabel.Create(Panel_Units, 105, lineY, Panel_Units.Width - 100, 20, gResTexts[TX_MAPED_UNITS_FORMATION_COLUMNS], fntMetal, taLeft) do
  begin
    Anchors := [anLeft, anTop, anRight];
    Hint := gResTexts[TX_MAPED_UNITS_FORMATION_COLUMNS_HINT];
  end;

  NumEd_WarrColumns := TKMNumericEdit.Create(Panel_Units, 105, lineY + 20, 1, 25);
  NumEd_WarrColumns.Anchors := [anLeft, anTop, anRight];
  NumEd_WarrColumns.Hint := gResTexts[TX_MAPED_UNITS_FORMATION_COLUMNS_HINT];
  NumEd_WarrColumns.AutoFocusable := False;
  NumEd_WarrColumns.OnChange := Town_NumericChange;
  NumEd_WarrColumns.Value := 1;

  lineY := 310;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  lineY := 258;

  with TKMLabel.Create(Panel_Units, 9 + 2 * xOffset + 12, lineY, Panel_Units.Width, 20, gResTexts[TX_MAPED_UNITS_FORMATION_NUMBER], fntMetal, taLeft) do   //cmowla (Add in Unit Icons)
  begin
    Anchors := [anLeft, anTop, anRight];
    Hint := gResTexts[TX_MAPED_UNITS_FORMATION_NUMBER_HINT];
  end;

  NumEd_WarrCount := TKMNumericEdit.Create(Panel_Units, 9 + 2 * xOffset, lineY + 20, 0, MAPED_GROUP_MAX_CNT); //cmowla (Add in Unit Icons)
  NumEd_WarrCount.Anchors := [anLeft, anTop, anRight];
  NumEd_WarrCount.Hint := gResTexts[TX_MAPED_UNITS_FORMATION_NUMBER_HINT];
  NumEd_WarrCount.AutoFocusable := False;
  NumEd_WarrCount.OnChange := Town_NumericChange;
  NumEd_WarrCount.Value := 1;

  with TKMLabel.Create(Panel_Units, 105 + xOffset, lineY, Panel_Units.Width - 100, 20, gResTexts[TX_MAPED_UNITS_FORMATION_COLUMNS], fntMetal, taLeft) do //cmowla (Add in Unit Icons)
  begin
    Anchors := [anLeft, anTop, anRight];
    Hint := gResTexts[TX_MAPED_UNITS_FORMATION_COLUMNS_HINT];
  end;

  NumEd_WarrColumns := TKMNumericEdit.Create(Panel_Units, 105 + xOffset, lineY + 20, 1, 25); //cmowla (Add in Unit Icons)
  NumEd_WarrColumns.Anchors := [anLeft, anTop, anRight];
  NumEd_WarrColumns.Hint := gResTexts[TX_MAPED_UNITS_FORMATION_COLUMNS_HINT];
  NumEd_WarrColumns.AutoFocusable := False;
  NumEd_WarrColumns.OnChange := Town_NumericChange;
  NumEd_WarrColumns.Value := 1;

  lineY := 310;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 7 - Enable to BLOCKING Siege Units (via map editor)
*************************************************************************




=========================================================================
..\src\gui\KM_InterfaceGame.pas [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  TownHall_Order: array [0..4] of TKMUnitType = (
    utRebel, utRogue, utVagabond, utBarbarian, utWarrior);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  TownHall_Order: array [0..4] of TKMUnitType = (
    utRebel, utRogue, utVagabond, utBarbarian, utWarrior);

//cmowla siege units [Map Editor Support] - Allow blocking units (Used in [..\src\gui\pages_maped\player\KM_GUIMapEdPlayerBlockUnit.pas] and in [..\src\gui\pages_game\KM_GUIGameHouse.pas].)
  SiegeWorkshop_Order: array [0..1] of TKMUnitType = (utCatapult, utBallista);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\gui\pages_maped\player\KM_GUIMapEdPlayerBlockUnit.pas [3 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    procedure Player_BlockBarracksWarriorsRefresh;
    procedure Player_BlockTHWarriorsRefresh;
  protected
    Panel_BlockUnit: TKMPanel;
    Button_BlockUnit: array [0..13] of TKMButtonFlat;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    procedure Player_BlockBarracksWarriorsRefresh;
    procedure Player_BlockTHWarriorsRefresh;

//cmowla siege units [Map Editor Support] - Allow blocking units
procedure Player_BlockSWWarriorsClick(Sender: TObject; Shift: TShiftState);
procedure Player_BlockSWWarriorsRefresh;
  protected
//cmowla siege units [Map Editor Support] - Allow blocking units
Button_BlockSWWarriors: array [0..1] of TKMButtonFlat;
Image_BlockSWWarriors: array[0..1] of TKMImage;

    Panel_BlockUnit: TKMPanel;
    Button_BlockUnit: array [0..13] of TKMButtonFlat;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




constructor TKMMapEdPlayerBlockUnit.Create(aParent: TKMPanel);

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  TKMLabel.Create(Panel_BlockUnit, 9, 245, Panel_BlockUnit.Width - 9, 0, gResTexts[TX_MAPED_BLOCK_UNITS_IN_TOWNHALL], fntMetal, taLeft);
  for I := 0 to High(Button_BlockTHWarriors) do
  begin
    Button_BlockTHWarriors[I] := TKMButtonFlat.Create(Panel_BlockUnit, 9 + (I mod 5)*37,265+(I div 5)*37,33,33, gRes.Units[TownHall_Order[I]].GUIIcon, rxGui);
    Button_BlockTHWarriors[I].Hint := gRes.Units[TownHall_Order[I]].GUIName;
    Button_BlockTHWarriors[I].Tag := I;
    Button_BlockTHWarriors[I].OnClickShift := Player_BlockTHWarriorsClick;
    Image_BlockTHWarriors[I] := TKMImage.Create(Panel_BlockUnit, 9 + (I mod 5)*37 + 15,265+(I div 5)*37 + 15, 16, 16, 0, rxGuiMain);
    Image_BlockTHWarriors[I].Hitable := False;
    Image_BlockTHWarriors[I].ImageCenter;
  end;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  TKMLabel.Create(Panel_BlockUnit, 9, 245, Panel_BlockUnit.Width - 9, 0, gResTexts[TX_MAPED_BLOCK_UNITS_IN_TOWNHALL], fntMetal, taLeft);
  for I := 0 to High(Button_BlockTHWarriors) do
  begin
    Button_BlockTHWarriors[I] := TKMButtonFlat.Create(Panel_BlockUnit, 9 + (I mod 5)*37,265+(I div 5)*37,33,33, gRes.Units[TownHall_Order[I]].GUIIcon, rxGui);
    Button_BlockTHWarriors[I].Hint := gRes.Units[TownHall_Order[I]].GUIName;
    Button_BlockTHWarriors[I].Tag := I;
    Button_BlockTHWarriors[I].OnClickShift := Player_BlockTHWarriorsClick;
    Image_BlockTHWarriors[I] := TKMImage.Create(Panel_BlockUnit, 9 + (I mod 5)*37 + 15,265+(I div 5)*37 + 15, 16, 16, 0, rxGuiMain);
    Image_BlockTHWarriors[I].Hitable := False;
    Image_BlockTHWarriors[I].ImageCenter;
  end;

//cmowla siege units [Map Editor Support] - Allow blocking units
  TKMLabel.Create(Panel_BlockUnit, 9, 307, Panel_BlockUnit.Width - 9, 0, '@ ' + gResTexts[TX_HOUSES_NAMES_SIEGEWORKSHOP], fntMetal, taLeft);
  for I := 0 to High(Button_BlockSWWarriors) do
  begin
    Button_BlockSWWarriors[I] := TKMButtonFlat.Create(Panel_BlockUnit, 9 + (I mod 5)*37,20+307+(I div 5)*37,33,33, gRes.Units[SiegeWorkshop_Order[I]].GUIIcon, rxGui);
    Button_BlockSWWarriors[I].Hint := gRes.Units[SiegeWorkshop_Order[I]].GUIName;
    Button_BlockSWWarriors[I].Tag := I;
    Button_BlockSWWarriors[I].OnClickShift := Player_BlockSWWarriorsClick;
    Image_BlockSWWarriors[I] := TKMImage.Create(Panel_BlockUnit, 9 + (I mod 5)*37 + 15,20+307+(I div 5)*37 + 15, 16, 16, 0, rxGuiMain);
    Image_BlockSWWarriors[I].Hitable := False;
    Image_BlockSWWarriors[I].ImageCenter;
  end;
end;


procedure TKMMapEdPlayerBlockUnit.Player_BlockSWWarriorsClick(Sender: TObject; Shift: TShiftState);
var //cmowla siege units [Map Editor Support] - Allow blocking units
  K: Integer;
  W: TKMUnitType;
begin
  K := TKMButtonFlat(Sender).Tag;
  W := SiegeWorkshop_Order[K];
  gMySpectator.Hand.Locks.SetUnitBlocked(not gMySpectator.Hand.Locks.GetUnitBlocked(W), W);
  Player_BlockSWWarriorsRefresh;
end;


procedure TKMMapEdPlayerBlockUnit.Player_BlockSWWarriorsRefresh;
var //cmowla siege units [Map Editor Support] - Allow blocking units
  K: Integer;
  W: TKMUnitType;
  blocked: Boolean;
begin
  for K := 0 to High(SiegeWorkshop_Order) do
  begin
    W := SiegeWorkshop_Order[K];
    blocked := gMySpectator.Hand.Locks.GetUnitBlocked(W);
    if blocked then
      Image_BlockSWWarriors[K].TexID := 32
    else if not blocked then
      Image_BlockSWWarriors[K].TexID := 0
    else
      Image_BlockSWWarriors[K].TexID := 24;
  end;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMMapEdPlayerBlockUnit.UpdatePlayerColor;
var
  I: Integer;
  col: Cardinal;
begin
  col := gMySpectator.Hand.FlagColor;

  for I := Low(Button_BlockUnit) to High(Button_BlockUnit) do
    Button_BlockUnit[I].FlagColor := col;
  for I := Low(Button_BlockBarracksWarriors) to High(Button_BlockBarracksWarriors) do
    Button_BlockBarracksWarriors[I].FlagColor := col;
  for I := Low(Button_BlockTHWarriors) to High(Button_BlockTHWarriors) do
    Button_BlockTHWarriors[I].FlagColor := col;
end;


procedure TKMMapEdPlayerBlockUnit.Show;
begin
  Player_BlockUnitRefresh;
  Player_BlockBarracksWarriorsRefresh;
  Player_BlockTHWarriorsRefresh;
  Panel_BlockUnit.Show;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMMapEdPlayerBlockUnit.UpdatePlayerColor;
var
  I: Integer;
  col: Cardinal;
begin
  col := gMySpectator.Hand.FlagColor;

  for I := Low(Button_BlockUnit) to High(Button_BlockUnit) do
    Button_BlockUnit[I].FlagColor := col;
  for I := Low(Button_BlockBarracksWarriors) to High(Button_BlockBarracksWarriors) do
    Button_BlockBarracksWarriors[I].FlagColor := col;
  for I := Low(Button_BlockTHWarriors) to High(Button_BlockTHWarriors) do
    Button_BlockTHWarriors[I].FlagColor := col;
  for I := Low(Button_BlockSWWarriors) to High(Button_BlockSWWarriors) do //cmowla siege units [Map Editor Support] - Allow blocking units
    Button_BlockSWWarriors[I].FlagColor := col;
end;


procedure TKMMapEdPlayerBlockUnit.Show;
begin
  Player_BlockUnitRefresh;
  Player_BlockBarracksWarriorsRefresh;
  Player_BlockTHWarriorsRefresh;
  Player_BlockSWWarriorsRefresh; //cmowla siege units [Map Editor Support] - Allow blocking units
  Panel_BlockUnit.Show;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\res\KM_ResUnits.pas [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TKMUnitSpec.GetGUIIcon: Word;
begin
  case fUnitType of
    utNone, utAny:  Result := 0;
    utBarbarian:    Result := 70;
  else
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TKMUnitSpec.GetGUIIcon: Word;
begin
  case fUnitType of
    utNone, utAny:  Result := 0;
    utBarbarian:    Result := 70;

//cmowla Add in New Unit - References NEW sprites in the modding graphics folder.
    utCatapult: Result := 680;
    utBallista: Result := 681;
  else
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 8 - Enable Adding in (MANY) entirely new sprites - OPTIONAL!
*************************************************************************




=========================================================================
..\src\utils\algorithms\KM_SoftShadows.pas [4 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    procedure PrepareShadows(aIndex: Word; aOnlyShadows: Boolean);

    function IsShadowPixel(aIndex, aX, aY: Word): Boolean;
    function IsObjectPixel(aIndex, aX, aY: Word): Boolean;
  public
    constructor Create(aRXData: PRXData);
    procedure ConvertShadows(aIndex: Word; aOnlyShadows: Boolean);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//cmowla (Soften New Sprite Shadows) - We are allowing ids between 100000 and 999999 so aIndex needs to be allowed to be of type Integer.
    procedure PrepareShadows(aIndex: Integer; aOnlyShadows: Boolean);

    function IsShadowPixel(aIndex: Integer; aX, aY: Word): Boolean;
    function IsObjectPixel(aIndex, aX, aY: Word): Boolean;
  public
    constructor Create(aRXData: PRXData);
    procedure ConvertShadows(aIndex: Integer; aOnlyShadows: Boolean);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMSoftShadowConverter.ConvertShadows(aIndex: Word; aOnlyShadows: Boolean);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMSoftShadowConverter.ConvertShadows(aIndex: Integer; aOnlyShadows: Boolean); //cmowla (Soften New Sprite Shadows)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMSoftShadowConverter.PrepareShadows(aIndex: Word; aOnlyShadows: Boolean);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMSoftShadowConverter.PrepareShadows(aIndex: Integer; aOnlyShadows: Boolean);  //cmowla (Soften New Sprite Shadows)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TKMSoftShadowConverter.IsShadowPixel(aIndex, aX, aY: Word): Boolean;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TKMSoftShadowConverter.IsShadowPixel(aIndex: Integer; aX, aY: Word): Boolean; //cmowla (Soften New Sprite Shadows)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\res\KM_ResSprites.pas [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMSpritePack.DetermineImagesObjectSizeList(aIdList: TList<Integer>);
var
  I, id: Integer;
  shadowConverter: TKMSoftShadowConverter;
begin
  if aIdList.Count = 0 then Exit;

  shadowConverter := TKMSoftShadowConverter.Create(@fRXData);
  try
    for I := 0 to aIdList.Count - 1 do
    begin
      id := aIdList[I];
      if fRXData.Flag[id] <> 0 then
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//cmowla (Add in New Units in Game Mods) - Don't resize sprites for game mods.
//(Let the graphics artist make them the desired size in external software.)
//The last "id" in the units rxx file is close to 100,000.
//So to be "safe", we have this procedure not resize ids < 100000.
//That is, instruct game modders to name their ids 100000, 100001, 100002, etc.
//The game recognizes ids at least up to 999999, and so there is "no limit" to how
//many sprites can be put in the SIEGE_UNIT_FILES_FOLDER folder!
procedure TKMSpritePack.DetermineImagesObjectSizeList(aIdList: TList<Integer>);
var
  I, id: Integer;
  shadowConverter: TKMSoftShadowConverter;
begin
  if aIdList.Count = 0 then Exit;

  shadowConverter := TKMSoftShadowConverter.Create(@fRXData);
  try
    for I := 0 to aIdList.Count - 1 do
    begin
      id := aIdList[I];
      if (fRXData.Flag[id] <> 0) And (id <= 99999) then
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 9 - Potential BUG Fix - OPTIONAL
*************************************************************************




=========================================================================
..\src\gui\pages_game\KM_GUIGameUnit.pas [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMGUIGameUnit.Show_Common(aUnit: TKMUnit);
var
  hLabelWidth: Integer;
begin
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMGUIGameUnit.Show_Common(aUnit: TKMUnit);
var
  hLabelWidth: Integer;
begin
  If aUnit.Owner < 0 Then Exit; //cmowla - Potential fix to some unknown bug? (Error pulled up this line below:   Image_PlayerFlag.FlagColor := gHands[aUnit.Owner].FlagColor;)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 10 - Game Setup (General) ... - Changes will vary, depending on coder.
*************************************************************************




=================================================================================
..\KM_Revision.inc [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
GAME_REVISION_NUM=15379
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
GAME_REVISION_NUM=153796
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=================================================================================
..\src\gui\pages_menu\KM_GUIMenuCredits.pas [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      gResTexts[TX_CREDITS_ADDITIONAL_PROGRAMMING] + '|Alex|andreus|Danjb|ZblCoder||' +
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      gResTexts[TX_CREDITS_ADDITIONAL_PROGRAMMING] + '|Alex|andreus|cmowla|Danjb|ZblCoder||' + //cmowla Game Setup
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=================================================================================
..\src\common\KM_Defaults.pas [3 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  DEBUG_CFG = True; //Debug preset for most usable debug options. ON for Debug build configuration
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  DEBUG_CFG = False; //Debug preset for most usable debug options. ON for Debug build configuration  //cmowla Game Setup
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  SAVES_FOLDER_NAME = 'Saves';
  SAVES_MP_FOLDER_NAME = 'SavesMP';
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  SAVES_FOLDER_NAME = 'Saves (SU)';  //cmowla Game Setup
  SAVES_MP_FOLDER_NAME = 'SavesMP (SU)'; //cmowla Game Setup
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
initialization
begin
  {$IFNDEF USESECUREAUTH}
  GAME_VERSION_POSTFIX := GAME_VERSION_POSTFIX + ' [ UNSECURE ]';
  {$ENDIF}

  {$IFDEF DEBUG}
  GAME_VERSION_POSTFIX := GAME_VERSION_POSTFIX + ' [ DEBUG ]';
  {$ENDIF}

  {$IFDEF WDC64}
  GAME_VERSION_POSTFIX := GAME_VERSION_POSTFIX + ' [x64]';
  {$ENDIF}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
initialization
begin
  {$IFNDEF USESECUREAUTH}
  GAME_VERSION_POSTFIX := GAME_VERSION_POSTFIX + ' Siege Unit Mod (by cmowla)';   //cmowla Game Setup
  {$ENDIF}

  {$IFDEF DEBUG}
//  GAME_VERSION_POSTFIX := GAME_VERSION_POSTFIX + ' [ DEBUG ]';   //cmowla Game Setup
  {$ENDIF}

  {$IFDEF WDC64}
  GAME_VERSION_POSTFIX := GAME_VERSION_POSTFIX + ' [x64]';
  {$ENDIF}
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 11 - Siege Unit Properties [General]
*************************************************************************




=================================================================================
..\res\KM_ResUnits.pas [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
class function TKMUnitSpec.IsRanged(aUnitType: TKMUnitType): Boolean;
begin
  Result := aUnitType in [utBowman, utCrossbowman, utRogue];
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
class function TKMUnitSpec.IsRanged(aUnitType: TKMUnitType): Boolean;
begin
  Result := aUnitType in [utBowman, utCrossbowman, utRogue, utCatapult, utBallista]; //cmowla (Add in New Unit)
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 12 - Siege Unit Properties [Hunger]
*************************************************************************




=================================================================================
..\src\units\KM_Units.pas [1 Item]


function TKMUnit.UpdateState: Boolean;

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    //Make unit hungry as long as they are not currently eating in the inn
    Dec(fCondition);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    //Make unit hungry as long as they are not currently eating in the inn
      If fType in SIEGE_UNITS //cmowla siege unit heatlh  (Don't let hunger affect siege units.)
      Then fCondition := Round(Abs(fHitPoints / gRes.Units[fType].HitPoints  * 2700)) //cmowla siege unit heatlh  (Make siege weapon's condition their current HP status.)
      Else Dec(fCondition); //For non-siege units.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=================================================================================
..\src\units\KM_UnitGroup.pas [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMUnitGroup.OrderFood(aClearOffenders: Boolean; aHungryOnly: Boolean = False);
var
  I: Integer;
begin
  if aClearOffenders and CanTakeOrders then
    ClearOffenders;

  for I := 0 to Count - 1 do
    if not aHungryOnly or (fMembers[I].Condition <= UNIT_MIN_CONDITION) then
      fMembers[I].OrderFood;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMUnitGroup.OrderFood(aClearOffenders: Boolean; aHungryOnly: Boolean = False);
var
  I: Integer;
begin
  if aClearOffenders and CanTakeOrders then
    ClearOffenders;

  For I := 0 to Count - 1 do
    If (not aHungryOnly or (fMembers[I].Condition <= UNIT_MIN_CONDITION))
    And (Not (fMembers[I].UnitType in SIEGE_UNITS)) //cmowla siege unit heatlh (Don't feed an injured siege weapon!)
    Then fMembers[I].OrderFood;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=================================================================================
..\src\units\KM_UnitWarrior.pas [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMUnitWarrior.OrderFood;
begin
  if (fCondition < (UNIT_MAX_CONDITION * TROOPS_FEED_MAX)) and not fRequestedFood then
  begin
    gHands[Owner].Deliveries.Queue.AddDemand(nil, Self, wtFood, 1, dtOnce, diHigh2);
    fRequestedFood := True;
  end;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMUnitWarrior.OrderFood;
begin
  if (fCondition < (UNIT_MAX_CONDITION * TROOPS_FEED_MAX))
  and not fRequestedFood
  and (Not (Self.unitType in SIEGE_UNITS)) //cmowla siege unit heatlh
  then begin
    gHands[Owner].Deliveries.Queue.AddDemand(nil, Self, wtFood, 1, dtOnce, diHigh2);
    fRequestedFood := True;
  end;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 13 - Siege Unit Properties [Firing Range, Projectiles, Firing / Projectiles Sounds]
*************************************************************************




=================================================================================
..\src\units\KM_UnitWarrior.pas [8 Items]


function TKMUnitWarrior.GetFightMaxRange(aTileBased: Boolean = False): Single;

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  case fType of
    utBowman,
    utCrossbowman,
    utRogue:   Result := RangeMax / (Byte(REDUCE_SHOOTING_RANGE) + 1);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  case fType of
    utBowman,
    utCrossbowman,
    utRogue,
    utCatapult,
    utBallista:   Result := RangeMax / (Byte(REDUCE_SHOOTING_RANGE) + 1); //cmowla siege unit specs
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TKMUnitWarrior.GetFightMinRange: Single;
begin
  case fType of
    utBowman,
    utCrossbowman,
    utRogue:   Result := RangeMin;
    else            Result := 0.5;
  end;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TKMUnitWarrior.GetFightMinRange: Single;
begin
  case fType of
    utBowman,utCrossbowman,utRogue,utCatapult,utBallista: Result := RangeMin;
    else Result := 0.5;
  end;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMUnitWarrior.SetActionFight(aAction: TKMUnitActionType; aOpponent: TKMUnit);
var
  cycle, step: Byte;
begin
  //Archers should start in the reloading if they shot recently phase to avoid rate of fire exploit
  step := 0; //Default
  cycle := Max(gRes.Units[UnitType].UnitAnim[aAction, Direction].Count, 1);
  if (TKMUnitWarrior(Self).IsRanged) and TKMUnitWarrior(Self).NeedsToReload(cycle) then
    //Skip the unit's animation forward to 1 step AFTER firing
    step := (FiringDelay + (gGameParams.Tick - TKMUnitWarrior(Self).LastShootTime)) mod cycle;

  if (Action is TKMUnitActionWalkTo) and not TKMUnitActionWalkTo(Action).CanAbandonExternal then
    raise ELocError.Create('Unit fight overrides walk', fPositionRound);
  SetAction(TKMUnitActionFight.Create(Self, aAction, aOpponent), step);
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMUnitWarrior.SetActionFight(aAction: TKMUnitActionType; aOpponent: TKMUnit);
var
  cycle, step: Byte;
begin
  //Archers should start in the reloading if they shot recently phase to avoid rate of fire exploit
  step := 0; //Default

//cmowla siege unit specs (To avoid rate of fire exploit which results from halting siege units.)
  if (TKMUnitWarrior(Self).IsRanged) Then
    Case fType of
      utCatapult: If TKMUnitWarrior(Self).NeedsToReload(CATAPULT_FIRE_DELAY_VS_UNITS) Then step := 0;
      utBallista: If TKMUnitWarrior(Self).NeedsToReload(BALLISTA_FIRE_DELAY_VS_UNITS) Then step := 0;
      Else begin //It's a bowman, crossbowman, or rogue,
        cycle := Max(gRes.Units[UnitType].UnitAnim[aAction, Direction].Count, 1);
        If TKMUnitWarrior(Self).NeedsToReload(cycle)
        Then step := (FiringDelay + (gGameParams.Tick - TKMUnitWarrior(Self).LastShootTime)) mod cycle;
      end;
    end;

  if (Action is TKMUnitActionWalkTo) and not TKMUnitActionWalkTo(Action).CanAbandonExternal then
    raise ELocError.Create('Unit fight overrides walk', fPositionRound);
  SetAction(TKMUnitActionFight.Create(Self, aAction, aOpponent), step);
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




function TKMUnitWarrior.GetFiringDelay: Byte;

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      utRogue:  Result := SLINGSHOT_FIRING_DELAY;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      utRogue:  Result := SLINGSHOT_FIRING_DELAY;
      utCatapult:  Result := 24; //cmowla Sprites (The frame index (out of 30 frames) at which catapult throws the 3 rocks.  Starting index = 0.)
      utBallista: Result := 14; //cmowla Sprites (frame index (out of 30 frames) at which the ballista launches its bolt.  Starting index = 0.)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




function TKMUnitWarrior.GetAimingDelay: Byte;

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      utRogue:        Result := SLINGSHOT_AIMING_DELAY_MIN + KaMRandom(SLINGSHOT_AIMING_DELAY_ADD{$IFDEF RNG_SPY}, 'TKMUnitWarrior.GetAimingDelay 3'{$ENDIF});
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      utRogue:        Result := SLINGSHOT_AIMING_DELAY_MIN + KaMRandom(SLINGSHOT_AIMING_DELAY_ADD{$IFDEF RNG_SPY}, 'TKMUnitWarrior.GetAimingDelay 3'{$ENDIF});
      utCatapult:     Result := CATAPULT_FIRE_DELAY_VS_UNITS - 30 + KaMRandom(6{$IFDEF RNG_SPY}, 'TKMUnitWarrior.GetAimingDelay'{$ENDIF}); //cmowla siege unit specs
      utBallista:     Result := BALLISTA_FIRE_DELAY_VS_UNITS - 50 + KaMRandom(6{$IFDEF RNG_SPY}, 'TKMUnitWarrior.GetAimingDelay'{$ENDIF}); //cmowla siege unit specs
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




function TKMUnitWarrior.GetRangeMin: Single;

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      utRogue:  Result := RANGE_SLINGSHOT_MIN;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      utRogue:  Result := RANGE_SLINGSHOT_MIN;
      utCatapult,utBallista: Result := 4; //cmowla siege unit specs
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




function TKMUnitWarrior.GetRangeMax: Single;

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TKMUnitWarrior.GetRangeMax: Single;
const
  RANGE_ARBALETMAN_MAX  = 10.99; //KaM: Unit standing 10 tiles from us will be shot, 11 tiles not
  RANGE_BOWMAN_MAX      = 10.99;
  RANGE_SLINGSHOT_MAX   = 10.99;
begin
  Result := 0;
  if IsRanged then
    case UnitType of
      utBowman:     Result := RANGE_BOWMAN_MAX;
      utCrossbowman: Result := RANGE_ARBALETMAN_MAX;
      utRogue:  Result := RANGE_SLINGSHOT_MAX;
      else raise Exception.Create('Unknown shooter');
    end;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TKMUnitWarrior.GetRangeMax: Single;
begin
  Result := 0;
  if IsRanged then
    if UnitType in [utBowman, utCrossbowman, utRogue, utCatapult, utBallista]  //cmowla siege unit specs
    then Result := 10.99 //KaM: Unit standing 10 tiles from us will be shot, 11 tiles not
    else raise Exception.Create('Unknown shooter');
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




function TKMUnitWarrior.GetProjectileType: TKMProjectileType;

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    utRogue:  Result := ptSlingRock;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    utRogue:  Result := ptSlingRock;
    utCatapult: Result := ptCatapultRock; //cmowla projectiles
    utBallista: Result := ptBallistaBolt; //cmowla projectiles
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=================================================================================
..\src\common\KM_CommonGameTypes.pas [1 Item]

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  TKMProjectileType = (ptArrow, ptBolt, ptSlingRock, ptTowerRock); {ptBallistaRock, }
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  TKMProjectileType = (ptArrow, ptBolt, ptSlingRock, ptTowerRock, ptBallistaBolt, ptCatapultRock); //cmowla siege units [Projectiles]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=================================================================================
..\src\KM_Projectiles.pas [7 Items]

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
const
  PROJECTILE_LAUNCH_SOUND: array[TKMProjectileType] of TSoundFX = (sfxBowShoot, sfxCrossbowShoot, sfxNone, sfxRockThrow);
  PROJECTILE_HIT_SOUND:   array[TKMProjectileType] of TSoundFX = (sfxArrowHit, sfxArrowHit, sfxArrowHit, sfxNone);
  PROJECTILE_SPEED: array[TKMProjectileType] of Single = (0.75, 0.75, 0.6, 0.8);
  PROJECTILE_ARC: array[TKMProjectileType,1..2] of Single = ((1.6, 0.5), (1.4, 0.4), (2.5, 1), (1.2, 0.2)); //Arc curve and random fraction
  PROJECTILE_JITTER: array[TKMProjectileType] of Single = (0.26, 0.29, 0.26, 0.2); //Fixed Jitter added every time
  PROJECTILE_JITTER_HOUSE: array[TKMProjectileType] of Single = (0.6, 0.6, 0.6, 0); //Fixed Jitter added every time
  // Jitter added according to target's speed (moving target harder to hit) Note: Walking = 0.1, so the added jitter is 0.1*X
  PROJECTILE_PREDICT_JITTER: array[TKMProjectileType] of Single = (2, 2, 2, 3);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//cmowla Projectiles
const
  PROJECTILE_LAUNCH_SOUND: array[TKMProjectileType] of TSoundFX = (sfxBowShoot, sfxCrossbowShoot, sfxNone, sfxRockThrow, sfxBalistaShoot, sfxCatapultShoot); //cmowla sound effects
  PROJECTILE_HIT_SOUND:   array[TKMProjectileType] of TSoundFX = (sfxArrowHit, sfxArrowHit, sfxArrowHit, sfxNone, sfxSiegeBuildingSmash, sfxSiegeBuildingSmash); //cmowla sound effects
  PROJECTILE_SPEED: array[TKMProjectileType] of Single = (0.75, 0.75, 0.6, 0.8, 0.75, 0.75);
  PROJECTILE_ARC: array[TKMProjectileType,1..2] of Single = ((1.6, 0.5), (1.4, 0.4), (2.5, 1), (1.2, 0.2), (0, 0), (2.5, 1)); //Arc curve and random fraction
  PROJECTILE_JITTER: array[TKMProjectileType] of Single = (0.26, 0.29, 0.26, 0.2, 0, 1); //Fixed Jitter added every time
  PROJECTILE_JITTER_HOUSE: array[TKMProjectileType] of Single = (0.6, 0.6, 0.6, 0, 0, 1); //Fixed Jitter added every time
  PROJECTILE_PREDICT_JITTER: array[TKMProjectileType] of Single = (2, 2, 2, 3, 3, 2); //Jitter added according to target's speed (moving target harder to hit) Note: Walking = 0.1, so the added jitter is 0.1*X
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
const
  // TowerRock position is a bit different for reasons said below
  // Recruit stands in entrance, Tower middleline is X-0.75
  OFFSET_X: array [TKMDirection] of array [TKMProjectileType] of Single =
    ((0.5, 0.5, 0.5, -0.25),  // dirNA
     (0.5, 0.5, 0.7, -0.25),  // dirN
     (1.0, 0.5, 0.7, -0.25),  // dirNE
     (0.7, 0.5, 0.7, -0.25),  // dirE
     (0.7, 0.5, 0.7, -0.25),  // dirSE
     (0.4, 0.4, 0.3, -0.25),  // dirS
     (0.4, 0.4, 0.5, -0.25),  // dirSW
     (0.4, 0.4, 0.5, -0.25),  // dirW
     (0.3, 0.5, 0.5, -0.25)); // dirNW
  // Add towers height
  OFFSET_Y: array [TKMDirection] of array [TKMProjectileType] of Single =
    ((0.2, 0.2, 0.2, -0.2),  // dirNA
     (0.2, 0.2, 0.2, -0.2),  // dirN
     (0.0, 0.6, 0.5, -0.2),  // dirNE
     (0.3, 0.35,0.3, -0.2),  // dirE
     (0.5, 0.4, 0.5, -0.2),  // dirSE
     (0.3, 0.2, 0.4, -0.2),  // dirS
     (0.4, 0.4, 0.2, -0.2),  // dirSW
     (0.2, 0.3, 0.3, -0.2),  // dirW
     (0.1, 0.3, 0.3, -0.2)); // dirNW
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
const
  // TowerRock position is a bit different for reasons said below
  // Recruit stands in entrance, Tower middleline is X-0.75

//cmowla Projectiles (Added the last in ALL n-tuples below.  Made ptBallistaBolt = ptBolt (which is crossbowmen's arrow).)
                            //ballista  catapult
  OFFSET_X: array [TKMDirection] of array [TKMProjectileType] of Single =
    ((0.5, 0.5, 0.5, -0.25,     0.5,    0.5),  // dirNA
     (0.5, 0.5, 0.7, -0.25,     0.5,    0.5),  // dirN
     (1.0, 0.5, 0.7, -0.25,     0.5,    0.5),  // dirNE
     (0.7, 0.5, 0.7, -0.25,     0.5,    0.5),  // dirE
     (0.7, 0.5, 0.7, -0.25,     0.5,    0.5),  // dirSE
     (0.4, 0.4, 0.3, -0.25,     0.4,    0.5),  // dirS
     (0.4, 0.4, 0.5, -0.25,     0.4,    0.5),  // dirSW
     (0.4, 0.4, 0.5, -0.25,     0.4,    0.5),  // dirW
     (0.3, 0.5, 0.5, -0.25,     0.5,    0.5)); // dirNW   ptCatapultRock

  // Add towers height        ballista  catapult
  OFFSET_Y: array [TKMDirection] of array [TKMProjectileType] of Single =
    ((0.2, 0.2, 0.2, -0.2,      0.2,    0.2),  // dirNA
     (0.2, 0.2, 0.2, -0.2,      0.2,    0.2),  // dirN
     (0.0, 0.6, 0.5, -0.2,      0.6,    0.6),  // dirNE
     (0.3, 0.35,0.3, -0.2,      0.35,   0.35),  // dirE
     (0.5, 0.4, 0.5, -0.2,      0.4,    0.4),  // dirSE
     (0.3, 0.2, 0.4, -0.2,      0.2,    0.2),  // dirS
     (0.4, 0.4, 0.2, -0.2,      0.4,    0.4),  // dirSW
     (0.2, 0.3, 0.3, -0.2,      0.3,    0.3),  // dirW
     (0.1, 0.3, 0.3, -0.2,      0.3,    0.3)); // dirNW
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
unit KM_Projectiles;
{$I KaM_Remake.inc}
interface
uses
  KM_Units, KM_Houses,
  KM_CommonClasses, KM_CommonGameTypes, KM_Points, KM_RenderTypes;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
unit KM_Projectiles;
{$I KaM_Remake.inc}
interface
uses
  KM_Units, KM_Houses,
  KM_CommonClasses, KM_CommonGameTypes, KM_Points, KM_RenderTypes, KM_UnitWarrior, KM_UnitGroup; //cmowla siege unit specs  (added in KM_UnitWarrior and KM_UnitGroup)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//Update all items positions and kill some targets
procedure TKMProjectiles.UpdateState;
const
  H_TICKS = 6; //The number of ticks before hitting that an arrow will make the hit noise
var
  I: Integer;
  U: TKMUnit;
  H: TKMHouse;
  Damage: Smallint;
begin
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TargetPerecent(methodCaller: String; targetPercent: Byte): Boolean;
begin
  Result := KaMRandom(100 - 1 + 1{$IFDEF RNG_SPY}, methodCaller{$ENDIF}) + 1 <= targetPercent;
end;

//Update all items positions and kill some targets
procedure TKMProjectiles.UpdateState;
const
  H_TICKS = 6; //The number of ticks before hitting that an arrow will make the hit noise
var
  I: Integer;
  U: TKMUnit;
  H: TKMHouse;
  Damage: Smallint;
  nearbyUnits, unitsToHarm: Integer; //cmowla siege unit specs (Added "nearbyUnits" and "unitsToHarm" in for the catapult to search for 2 additional enemy units to harm.)
  offsetsX, offsetsY: Array of Integer; //cmowla siege unit specs (Added this in for the catapult to search for 2 additional enemy units to harm.)
  catapultsGroup: TKMUnitGroup;  //cmowla siege unit specs
  gMember, catapultCnt: Word;  //cmowla siege unit specs
begin
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




procedure TKMProjectiles.UpdateState;

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        if gMySpectator.FogOfWar.CheckRevelation(fTarget) >= 255 then
          if (fLength - H_TICKS*fSpeed <= fPosition) and (fPosition < fLength - (H_TICKS - 1) * fSpeed) then
            gSoundPlayer.Play(PROJECTILE_HIT_SOUND[fType], fTarget);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        if gMySpectator.FogOfWar.CheckRevelation(fTarget) >= 255 then
          if (fLength - H_TICKS*fSpeed <= fPosition) and (fPosition < fLength - (H_TICKS - 1) * fSpeed) then
            If Not (fType in [ptCatapultRock, ptBallistaBolt])  //cmowla sound effects (Don't want to make the building hit sound for siege weapons when hitting a unit!)
            Then gSoundPlayer.Play(PROJECTILE_HIT_SOUND[fType], fTarget);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




procedure TKMProjectiles.UpdateState;

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
              ptTowerRock: if (U <> nil) and not U.IsDeadOrDying and U.Visible
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
          //cmowla siege unit specs
            //Ballista Will damage a unit or house (but not both like the catapult).
              ptBallistaBolt: begin
              //If the bolt has made contact with a unit that's not dying and is not an animal,
                If (U <> nil) And (Not U.IsDeadOrDying) And U.Visible And (not (U is TKMUnitAnimal)) Then begin
                  If TargetPerecent('TKMProjectiles.UpdateState', BALLISTA_POTENCY) Then begin //Then, BALLISTA_POTENCY % of the time.
                    If gHands.CheckAlliance(fOwner.Owner, U.Owner)= atEnemy //If it's an enemy unit
                    Then U.HitPointsDecrease(U.HitPointsMax, fOwner) //Ballista is a 1-shot kill unit.
                    Else begin
                      If FRIENDLY_FIRE //If ranged units are allowed to harm friendly units,
                      And TargetPerecent('TKMProjectiles.UpdateState', 10) //Then 10% of the time,
                      Then U.HitPointsDecrease(1, fOwner) //Only by 1 HP.
                    end;
                  end;
                end Else begin
                  H := gHands.HousesHitTest(Round(fTarget.X), Round(fTarget.Y));
                  If (H <> nil) Then begin //If the bolt made contact with a house,
                    If gHands.CheckAlliance(fOwner.Owner, H.Owner)= atEnemy Then begin //If it's an enemy house,
                      H.AddDamage(4, fOwner); //Ballista causes 4 HP damage per hit. (100% of the time for enemy houses)
                      gSoundPlayer.Play(PROJECTILE_HIT_SOUND[fType], fTarget, True, 0.5); //Play siege weapon building hitting sound at 50% max volume.
                    end Else begin
                      If FRIENDLY_FIRE //If ranged units are allowed to harm friendly houses,
                      And TargetPerecent('TKMProjectiles.UpdateState', 20) //Then 20% of the time,
                      Then H.AddDamage(4, fOwner) //Harm friendly house by 4 HP.
                    end;
                  end;
                end;
              end;

              ptCatapultRock: begin
                H := gHands.HousesHitTest(Round(fTarget.X), Round(fTarget.Y));
                If (H <> nil) Then begin //If the rock made contact with a house,
                  If gHands.CheckAlliance(fOwner.Owner, H.Owner) = atEnemy Then begin //If it's a enemy house,
                    H.AddDamage(4, fOwner); //Each catapult rock causes 4 HP damage per hit. (100% of the time for enemy houses)
                    gSoundPlayer.Play(PROJECTILE_HIT_SOUND[fType], fTarget, True, 0.5); //Play siege weapon building hitting sound at 50% max volume.
                  end Else begin
                    If FRIENDLY_FIRE //If ranged units are allowed to harm friendly houses,
                    And TargetPerecent('TKMProjectiles.UpdateState', 20) //Then 20% of the time,
                    Then H.AddDamage(4, fOwner) //Harm friendly house by 4 HP.
                  end;
                end;

              //Catapult Damaging Unit (Will happen, regardless whether a house was damaged or not.)
                //Target tile (and 8 surrounding tiles)
                  offsetsX := [0,-1,0,1,1,1,0,-1,-1];
                  offsetsY := [0,-1,-1,-1,0,1,1,0,1];

                //Get # of catapults in the group (if catapult who shot is still alive).
                  If (fOwner <> nil) And (Not fOwner.IsDeadOrDying) Then begin
                    catapultsGroup := gHands[fOwner.Owner].UnitGroups.GetGroupByMember(TKMUnitWarrior(fOwner));
                    catapultCnt := 0;
                    For gMember := 0 to catapultsGroup.Count - 1 do
                    //If current unit is a LIVING catapult,
                      If (catapultsGroup.Members[gMember] <> nil)
                      And (Not catapultsGroup.Members[gMember].IsDeadOrDying)
                      And (catapultsGroup.Members[gMember].UnitType = utCatapult)
                    //Count it.
                      Then Inc(catapultCnt);
                  end Else catapultCnt := 1; //If catapult who shot is dying, then just count it.

                //Harm up to 2 enemy units (based on RNG and catapultCnt).
                  unitsToHarm := 2;
                  For nearByUnits := 0 to 8 do begin
                  //If there is a LIVE (non-animal) unit at this offset,
                    U := gTerrain.UnitsHitTest(Round(fTarget.X) + offsetsX[nearByUnits], Round(fTarget.Y) + offsetsY[nearByUnits]);
                    If (U <> nil) And (not U.IsDeadOrDying) And U.Visible
                    And (not (U is TKMUnitAnimal))
                    Then begin
                    //Harm the unit a certain percent of the time (determined by catapultCnt and RNG).
                      If gHands.CheckAlliance(fOwner.Owner, U.Owner) = atEnemy Then begin //If it's an enemy unit,
                        If TargetPerecent('TKMProjectiles.UpdateState', Max(100 - Trunc(catapultCnt / (CATAPULT_POTENCY / 100)), 40)) Then
                          If TargetPerecent('TKMProjectiles.UpdateState', CATAPULT_DAMAGE_PROBABILITY) //Percent of the time (48% is suffient for 1 catapult to resemble original game's damage, but less than that is not!),
                          Then U.HitPointsDecrease(2, fOwner)
                          Else U.HitPointsDecrease(1, fOwner); //The other 50% of the time, just harm it by 1 HP.
                      //Count that we harmed an enemy unit.
                        Dec(unitsToHarm);
                        If unitsToHarm = 0 Then Break;
                      end Else begin
                        If FRIENDLY_FIRE //If ranged units are allowed to harm friendly units,
						And TargetPerecent('TKMProjectiles.UpdateState', Max(100 - Trunc(catapultCnt / (CATAPULT_POTENCY / 100)), 40) //@@@ Added this line.  (Friendly units got full damage
                        And TargetPerecent('TKMProjectiles.UpdateState', 10) //Then 10% of the time,
                        Then U.HitPointsDecrease(1, fOwner) //Only by 1 HP.
                      end;
                    end;
                  end;
              end;

              ptTowerRock: if (U <> nil) and not U.IsDeadOrDying and U.Visible
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




procedure TKMProjectiles.Paint(aTickLag: Single);

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      case fItems[I].fType of
        ptArrow, ptSlingRock, ptBolt:
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      case fItems[I].fType of
        ptArrow, ptSlingRock, ptBolt, ptBallistaBolt, ptCatapultRock: //cmowla Sprites
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=================================================================================
..\src\render\KM_RenderPool.pas [3 Items]


procedure TKMRenderPool.AddProjectile(aProj: TKMProjectileType; const aRenderPos, aTilePos: TKMPointF; aDir: TKMDirection; aFlight: Single);

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  case aProj of
    ptArrow:     id := gRes.Interpolation.UnitActionByPercent(utBowman, uaSpec, aDir, aFlight);
    ptBolt:      id := gRes.Interpolation.UnitActionByPercent(utCrossbowman, uaSpec, aDir, aFlight);
    ptSlingRock: id := gRes.Interpolation.UnitActionByPercent(utRogue, uaSpec, aDir, aFlight);
    ptTowerRock: id := gRes.Interpolation.UnitActionByPercent(utRecruit, uaSpec, aDir, aFlight);
    else          id := 1; // Nothing?
  end;

  rxData := fRXData[rxUnits];

  cornerX := rxData.Pivot[id].X / CELL_SIZE_PX - 1;
  cornerY := (rxData.Pivot[id].Y + rxData.Size[id].Y) / CELL_SIZE_PX - 1;

  case aProj of
    ptArrow, ptBolt, ptSlingRock:  ground := aTilePos.Y + (0.5 - Abs(Min(aFlight, 1) - 0.5)) - 0.5;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  id := 0; //cmowla Sprites (To remove the compiler warning that " 'id' might not have been initialized.)
  case aProj of
    ptArrow:     id := gRes.Interpolation.UnitActionByPercent(utBowman, uaSpec, aDir, aFlight);
    ptBolt:      id := gRes.Interpolation.UnitActionByPercent(utCrossbowman, uaSpec, aDir, aFlight);
    ptSlingRock: id := gRes.Interpolation.UnitActionByPercent(utRogue, uaSpec, aDir, aFlight);
    ptTowerRock: id := gRes.Interpolation.UnitActionByPercent(utRecruit, uaSpec, aDir, aFlight);
    ptBallistaBolt: id := ballistaBoltIDs[TKMDirectionToInt[aDir] + 1]; //cmowla Sprites (ballista bolts)
    ptCatapultRock: begin
	  //(To have watchtower stone, just comment out/remove the case of below and uncomment the following line!)  //cmowla Sprites
	  //id := gRes.Interpolation.UnitActionByPercent(utRecruit, uaSpec, aDir, aFlight);  //cmowla Sprites
      Case gRes.Interpolation.UnitActionByPercent(utRecruit, uaSpec, aDir, aFlight) of  //cmowla Sprites
          4186: id := 9266;
          4187: id := 9267;
          4188: id := 9268;
          4189: id := 9269;
          4190: id := 9270;
          Else id := 9266; //For HD Animations, rocks appear and disappear on their path, so . . .
      end;
    end;
    else         id := 1; // Nothing?
  end;

  rxData := fRXData[rxUnits];

  cornerX := rxData.Pivot[id].X / CELL_SIZE_PX - 1;
  cornerY := (rxData.Pivot[id].Y + rxData.Size[id].Y) / CELL_SIZE_PX - 1;

  case aProj of
    ptArrow, ptBolt, ptSlingRock, ptBallistaBolt, ptCatapultRock:  ground := aTilePos.Y + (0.5 - Abs(Min(aFlight, 1) - 0.5)) - 0.5;  //cmowla Sprites
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
unit KM_RenderPool;
{$I KaM_Remake.inc}

interface
uses
  {$IFDEF Unix} LCLIntf, LCLType, {$ENDIF}
  Classes,
  dglOpenGL, SysUtils, KromOGLUtils, KromUtils, Math,
  KM_Defaults, KM_CommonTypes, KM_CommonClasses, KM_Pics, KM_Points, KM_Render, KM_Viewport,
  KM_RenderTerrain, KM_ResHouses, KM_ResSprites, KM_Units, KM_HandEntity,
  KM_Houses, KM_Terrain, KM_CommonGameTypes, KM_RenderDebug,
  KM_ResTypes;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
unit KM_RenderPool;
{$I KaM_Remake.inc}

interface
uses
  {$IFDEF Unix} LCLIntf, LCLType, {$ENDIF}
  Classes,
  dglOpenGL, SysUtils, KromOGLUtils, KromUtils, Math,
  KM_Defaults, KM_CommonTypes, KM_CommonClasses, KM_Pics, KM_Points, KM_Render, KM_Viewport,
  KM_RenderTerrain, KM_ResHouses, KM_ResSprites, KM_Units, KM_HandEntity,
  KM_Houses, KM_Terrain, KM_CommonGameTypes, KM_RenderDebug,
  KM_ResTypes;

//cmowla Sprites & Siege Unit HD Animations (put here instead of above "constructor TKMRenderPool.Create(aViewport: TKMViewport; aRender: TKMRender);" because [..\src\res\KM_ResInterpolation.pas] needs to access these arrays for HD Animations.
  Const TKMDirectionToInt: Array [TKMDirection] of ShortInt = (-1, 0, 1, 2, 3, 4, 5, 6, 7);
  Var catapultWorkIDs, catapultDieIDs, catapultWalkIDs: Array[0..8] of Array of Integer;
  Var ballistaWorkIDs, ballistaDieIDs, ballistaWalkIDs: Array[0..8] of Array of Integer;
  Var ballistaBoltIDs: Array of Integer;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  fHouseOutline   := TKMPointList.Create;
  // fSampleHouse := TOBJModel.Create;
  // fSampleHouse.LoadFromFile(ExeDir + 'Store.obj');
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  fHouseOutline   := TKMPointList.Create;
  // fSampleHouse := TOBJModel.Create;
  // fSampleHouse.LoadFromFile(ExeDir + 'Store.obj');

//cmowla Sprites aaa
//Arrays have a length of 20.
  catapultWalkIDs[0] := [0];
  catapultWalkIDs[1] := [8226,8227,8228,8229,8230,8231,8232,8233,8234,8235,8236,8237,8238,8239,8240,8241,8242,8243,8244,8245];
  catapultWalkIDs[2] := [8251,8252,8253,8254,8255,8256,8257,8258,8259,8260,8261,8262,8263,8264,8265,8266,8267,8268,8269,8270];
  catapultWalkIDs[3] := [8276,8277,8278,8279,8280,8281,8282,8283,8284,8285,8286,8287,8288,8289,8290,8291,8292,8293,8294,8295];
  catapultWalkIDs[4] := [8301,8302,8303,8304,8305,8306,8307,8308,8309,8310,8311,8312,8313,8314,8315,8316,8317,8318,8319,8320];
  catapultWalkIDs[5] := [8345,8326,8327,8328,8329,8330,8331,8332,8333,8334,8335,8336,8337,8338,8339,8340,8341,8342,8343,8344];
  catapultWalkIDs[6] := [8351,8352,8353,8354,8355,8356,8357,8358,8359,8360,8361,8362,8363,8364,8365,8366,8367,8368,8369,8370];
  catapultWalkIDs[7] := [8376,8377,8378,8379,8380,8381,8382,8383,8384,8385,8386,8387,8388,8389,8390,8391,8392,8393,8394,8395];
  catapultWalkIDs[8] := [8401,8402,8403,8404,8405,8406,8407,8408,8409,8410,8411,8412,8413,8414,8415,8416,8417,8418,8419,8420];

  ballistaWalkIDs[0] := [0];
  ballistaWalkIDs[1] := [8426,8427,8428,8429,8430,8431,8432,8433,8434,8435,8436,8437,8438,8439,8440,8441,8442,8443,8444,8445];
  ballistaWalkIDs[2] := [8451,8452,8453,8454,8455,8456,8457,8458,8459,8460,8461,8462,8463,8464,8465,8466,8467,8468,8469,8470];
  ballistaWalkIDs[3] := [8476,8477,8478,8479,8480,8481,8482,8483,8484,8485,8486,8487,8488,8489,8490,8491,8492,8493,8494,8495];
  ballistaWalkIDs[4] := [8501,8502,8503,8504,8505,8506,8507,8508,8509,8510,8511,8512,8513,8514,8515,8516,8517,8518,8519,8520];
  ballistaWalkIDs[5] := [8526,8527,8528,8529,8530,8531,8532,8533,8534,8535,8536,8537,8538,8539,8540,8541,8542,8543,8544,8545];
  ballistaWalkIDs[6] := [8551,8552,8553,8554,8555,8556,8557,8558,8559,8560,8561,8562,8563,8564,8565,8566,8567,8568,8569,8570];
  ballistaWalkIDs[7] := [8576,8577,8578,8579,8580,8581,8582,8583,8584,8585,8586,8587,8588,8589,8590,8591,8592,8593,8594,8595];
  ballistaWalkIDs[8] := [8601,8602,8603,8604,8605,8606,8607,8608,8609,8610,8611,8612,8613,8614,8615,8616,8617,8618,8619,8620];


//All arrays have a length of 30.  (Two frames are repeated several times each.)
//30 instead of 21 (catapult) or 20 (ballista), because the siege units inherited all characteristics of the rogue.
//Due to the added DELAY to the rogue, work/attack sequence increased from 26 (the default) to 30.
  catapultWorkIDs[0] := [0];
  catapultWorkIDs[1] := [8012,8012,8012,8012,8012,8012,8012,8012,8013,8014,8015,8016,8017,8018,8019,8020,8021,8001,8001,8001,8002,8003,8008,8005,8006,8007,8004,8009,8010,8011];
  catapultWorkIDs[2] := [8033,8033,8033,8033,8033,8033,8033,8033,8038,8039,8040,8041,8042,8043,8044,8045,8046,8026,8026,8026,8027,8028,8029,8030,8031,8032,8037,8034,8035,8036];
  catapultWorkIDs[3] := [8062,8062,8062,8062,8062,8062,8062,8062,8063,8064,8065,8066,8067,8068,8069,8070,8071,8051,8051,8051,8052,8053,8054,8055,8056,8057,8058,8059,8060,8061];
  catapultWorkIDs[4] := [8112,8112,8112,8112,8112,8112,8112,8112,8113,8114,8115,8116,8117,8118,8119,8120,8121,8101,8101,8101,8102,8103,8104,8105,8106,8107,8108,8109,8110,8111];
  catapultWorkIDs[5] := [8137,8137,8137,8137,8137,8137,8137,8137,8138,8139,8140,8141,8142,8143,8144,8145,8146,8126,8126,8126,8127,8128,8129,8130,8132,8131,8133,8134,8135,8136];
  catapultWorkIDs[6] := [8162,8162,8162,8162,8162,8162,8162,8162,8163,8164,8165,8166,8167,8168,8169,8170,8171,8151,8151,8151,8152,8153,8154,8155,8156,8157,8158,8159,8160,8161];
  catapultWorkIDs[7] := [8187,8187,8187,8187,8187,8187,8187,8187,8188,8189,8190,8191,8192,8193,8194,8195,8196,8176,8176,8176,8177,8178,8179,8180,8181,8182,8183,8184,8185,8186];
  catapultWorkIDs[8] := [8212,8212,8212,8212,8212,8212,8212,8212,8213,8214,8215,8216,8217,8218,8219,8220,8221,8201,8201,8201,8202,8203,8204,8205,8206,8207,8208,8209,8210,8211];

  ballistaWorkIDs[0] := [0];
  ballistaWorkIDs[1] := [8826,8826,8826,8826,8826,8826,8826,8826,8826,8827,8828,8829,8830,8831,8832,8833,8834,8835,8836,8836,8836,8837,8838,8839,8840,8841,8842,8843,8844,8845];
  ballistaWorkIDs[2] := [8851,8851,8851,8851,8851,8851,8851,8851,8851,8852,8853,8854,8855,8856,8857,8858,8859,8860,8861,8861,8861,8862,8863,8864,8865,8866,8867,8868,8869,8870];
  ballistaWorkIDs[3] := [8876,8876,8876,8876,8876,8876,8876,8876,8876,8877,8878,8879,8880,8881,8882,8883,8884,8885,8886,8886,8886,8887,8888,8889,8890,8891,8892,8893,8894,8895];
  ballistaWorkIDs[4] := [8901,8901,8901,8901,8901,8901,8901,8901,8901,8902,8903,8904,8905,8906,8907,8908,8909,8910,8911,8911,8911,8912,8913,8914,8915,8916,8917,8918,8919,8920];
  ballistaWorkIDs[5] := [8926,8926,8926,8926,8926,8926,8926,8926,8926,8927,8928,8929,8930,8931,8932,8933,8934,8935,8936,8936,8936,8937,8938,8939,8940,8941,8942,8943,8943,8943]; //@@@ 8944,8945 to 8943,8943 (Ballista firing South would JERK Southeast on the last 2 frames!  The original game didn't use these frames?
  ballistaWorkIDs[6] := [8951,8951,8951,8951,8951,8951,8951,8951,8951,8952,8953,8954,8955,8956,8957,8958,8959,8960,8961,8961,8961,8962,8963,8964,8965,8966,8967,8968,8969,8970];
  ballistaWorkIDs[7] := [8976,8976,8976,8976,8976,8976,8976,8976,8976,8977,8978,8979,8980,8981,8982,8983,8984,8985,8986,8986,8986,8987,8988,8989,8990,8991,8992,8993,8994,8995];
  ballistaWorkIDs[8] := [9001,9001,9001,9001,9001,9001,9001,9001,9001,9002,9003,9004,9005,9006,9007,9008,9009,9010,9011,9011,9011,9012,9013,9014,9015,9016,9017,9018,9019,9020];

//Arrays have a length of 22. (But the 0th index is SKIPPED for death animations...Don't know why, but the last index IS VISITIED, despite the "offset".)
//Used the STILL_FRAME (from WalkIDs) as the first frame of death (just to "remove the flag" as the first frame of animation).
  catapultDieIDs[0] := [0];
  catapultDieIDs[1] := [0,8244,8626,8627,8628,8629,8630,8631,8632,8633,8634,8635,8636,8637,8638,8639,8640,8641,8642,8643,8644,8645];
  catapultDieIDs[2] := [0,8253,8651,8652,8653,8654,8655,8656,8657,8658,8659,8660,8661,8662,8663,8664,8665,8666,8667,8668,8669,8670];
  catapultDieIDs[3] := [0,8278,8676,8677,8678,8679,8680,8681,8682,8683,8684,8685,8686,8687,8688,8689,8690,8691,8692,8693,8694,8695];
  catapultDieIDs[4] := [0,8302,8701,8702,8703,8704,8705,8706,8707,8708,8709,8710,8711,8712,8713,8714,8715,8716,8717,8718,8719,8720];
  catapultDieIDs[5] := [0,8331,8726,8727,8728,8729,8730,8731,8732,8733,8734,8735,8736,8737,8738,8739,8740,8741,8742,8743,8744,8745];
  catapultDieIDs[6] := [0,8358,8751,8752,8753,8754,8755,8756,8757,8758,8759,8760,8761,8762,8763,8764,8765,8766,8767,8768,8769,8770];
  catapultDieIDs[7] := [0,8382,8776,8777,8778,8779,8780,8781,8782,8783,8784,8785,8786,8787,8788,8789,8790,8791,8792,8793,8794,8795];
  catapultDieIDs[8] := [0,8407,8801,8802,8803,8804,8805,8806,8807,8808,8809,8810,8811,8812,8813,8814,8815,8816,8817,8818,8819,8829];

  ballistaDieIDs[0] := [0];
  ballistaDieIDs[1] := [0,8429,9026,9027,9028,9029,9030,9031,9032,9033,9034,9035,9036,9037,9038,9039,9040,9041,9042,9043,9044,9045];
  ballistaDieIDs[2] := [0,8453,9051,9052,9053,9054,9055,9056,9057,9058,9059,9060,9061,9062,9063,9064,9065,9066,9067,9068,9069,9070];
  ballistaDieIDs[3] := [0,8478,9076,9077,9078,9079,9080,9081,9082,9083,9084,9085,9086,9087,9088,9089,9090,9091,9092,9093,9094,9095];
  ballistaDieIDs[4] := [0,8502,9101,9102,9103,9104,9105,9106,9107,9108,9109,9110,9111,9112,9113,9114,9115,9116,9117,9118,9119,9120];
  ballistaDieIDs[5] := [0,8532,9126,9127,9128,9129,9130,9131,9132,9133,9134,9135,9136,9137,9138,9139,9140,9141,9142,9143,9144,9145];
  ballistaDieIDs[6] := [0,8558,9151,9152,9153,9154,9155,9156,9157,9158,9159,9160,9161,9162,9163,9164,9165,9166,9167,9168,9169,9170];
  ballistaDieIDs[7] := [0,8582,9176,9177,9178,9179,9180,9181,9182,9183,9184,9185,9186,9187,9188,9189,9190,9191,9192,9193,9194,9195];
  ballistaDieIDs[8] := [0,8607,9201,9202,9203,9204,9205,9206,9207,9208,9209,9210,9211,9212,9213,9214,9215,9216,9217,9218,9219,9220];

//Has a length of 9 (0th index is for dirNA.)
  ballistaBoltIDs := [0,9227,9228,9229,9230,9231,9232,9233,9226];
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=================================================================================
..\src\units\actions\KM_UnitActionFight.pas [2 Items]


procedure TKMUnitActionFight.MakeSound(IsHit: Boolean);

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if makeBattleCry then
    gSoundPlayer.PlayWarrior(fUnit.UnitType, spBattleCry, fUnit.PositionF);

  case fUnit.UnitType of
    utCrossbowman: gSoundPlayer.Play(sfxCrossbowDraw, fUnit.PositionF); // Aiming
    utBowman:     gSoundPlayer.Play(sfxBowDraw,      fUnit.PositionF); // Aiming
    utRogue:  gSoundPlayer.Play(sfxSlingerShoot, fUnit.PositionF);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  If makeBattleCry
  And (Not (fUnit.UnitType in SIEGE_UNITS)) //cmowla sound effects  (Added in the 'And' and the right condition.)
  Then gSoundPlayer.PlayWarrior(fUnit.UnitType, spBattleCry, fUnit.PositionF);

  case fUnit.UnitType of
    utCrossbowman: gSoundPlayer.Play(sfxCrossbowDraw, fUnit.PositionF); // Aiming
    utBowman:     gSoundPlayer.Play(sfxBowDraw,      fUnit.PositionF); // Aiming
    utRogue:  gSoundPlayer.Play(sfxSlingerShoot, fUnit.PositionF);
    utCatapult, utBallista: ; //Their draw sounds are in function TKMUnitActionFight.ExecuteProcessRanged below. //cmowla sound effects
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




function TKMUnitActionFight.ExecuteProcessRanged(Step: Byte): Boolean;

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if Step = W.FiringDelay then
  begin
    W.SetLastShootTime; //Record last time the warrior shot

    //Fire the arrow
    gProjectiles.AimTarget(fUnit.PositionF, fOpponent, W.ProjectileType, fUnit, W.RangeMax, W.RangeMin);

    fFightDelay := -1; //Reset
  end;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if Step = W.FiringDelay then
  begin
    W.SetLastShootTime; //Record last time the warrior shot

    //Fire the arrow
    gProjectiles.AimTarget(fUnit.PositionF, fOpponent, W.ProjectileType, W, W.RangeMax, W.RangeMin);

  //cmowla Projectiles (Added 2 additional projectiles for catapult) - for attacking units only!
    If W.UnitType = utCatapult Then begin
      gProjectiles.AimTarget(W.PositionF, fOpponent, W.ProjectileType, W, W.RangeMax, W.RangeMin);
      gProjectiles.AimTarget(W.PositionF, fOpponent, W.ProjectileType, W, W.RangeMax, W.RangeMin);
    end;

    fFightDelay := -1; //Reset
  end Else begin
    Case W.UnitType of
      utCatapult: If Step = 5 Then gSoundPlayer.Play(sfxCatapultReload, W.PositionF); //cmowla sound effects  (Catapult draw sound when attacking houses.)
      utBallista: If Step = 20 Then gSoundPlayer.Play(sfxunknown76, W.PositionF); //cmowla sound effects  (Ballista draw sound when attacking houses.)
    end;
  end;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=================================================================================
..\src\units\actions\KM_UnitActionStay.pas [1 Item]


procedure TKMUnitActionStay.MakeSound(Cycle, Step: Byte);

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    utWoodCutter:  case ActionType of
                      uaWork: if (fUnit.AnimStep mod Cycle = 3) and (fUnit.Direction <> dirN) then gSoundPlayer.Play(sfxChopTree, fUnit.PositionF,True)
                      else     if (fUnit.AnimStep mod Cycle = 0) and (fUnit.Direction =  dirN) then gSoundPlayer.Play(sfxWoodcutterDig, fUnit.PositionF,True);
                    end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    utWoodCutter:  case ActionType of
                      uaWork: if (fUnit.AnimStep mod Cycle = 3) and (fUnit.Direction <> dirN) then gSoundPlayer.Play(sfxChopTree, fUnit.PositionF,True)
                      else     if (fUnit.AnimStep mod Cycle = 0) and (fUnit.Direction =  dirN) then gSoundPlayer.Play(sfxWoodcutterDig, fUnit.PositionF,True);
                    end;

  //cmowla sound effects  (Catapult draw sound when attacking houses.)
    utCatapult: If fUnit.AnimStep = 5 Then gSoundPlayer.Play(sfxCatapultReload, fUnit.PositionF);

  //cmowla sound effects  (Ballista draw sound when attacking houses.)
    utBallista: If fUnit.AnimStep = 20 Then gSoundPlayer.Play(sfxunknown76, fUnit.PositionF);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=================================================================================
..\src\units\tasks\KM_UnitTaskAttackHouse.pas [3 Items]


function TKMTaskAttackHouse.Execute: TKMTaskResult;

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
              //Calculate base aiming delay
              Delay := AimingDelay;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
              //Calculate base aiming delay
                Case UnitType of //cmowla siege unit specs... and cmowla Projectiles
                  utCatapult: Delay := CATAPULT_FIRE_DELAY_VS_HOUSES - 30; //(Siege units should fire at buildings at a similar rate to original game
                  utBallista: Delay := BALLISTA_FIRE_DELAY_VS_HOUSES - 30; //(Siege units should fire at buildings at a similar rate to original game
                  Else Delay := AimingDelay; //Default for bowmen, crossbowmen, and rogues.
                end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
              if gMySpectator.FogOfWar.CheckTileRevelation(Round(PositionF.X), Round(PositionF.Y)) >= 255 then
              case UnitType of
                utCrossbowman: gSoundPlayer.Play(sfxCrossbowDraw, PositionF); //Aiming
                utBowman:     gSoundPlayer.Play(sfxBowDraw,      PositionF); //Aiming
                utRogue:  ;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
              if gMySpectator.FogOfWar.CheckTileRevelation(Round(PositionF.X), Round(PositionF.Y)) >= 255 then
              case UnitType of
                utCrossbowman: gSoundPlayer.Play(sfxCrossbowDraw, PositionF); //Aiming
                utBowman:     gSoundPlayer.Play(sfxBowDraw,      PositionF); //Aiming
                utRogue,utCatapult,utBallista: ; //cmowla sound effects - Siege units drawing sounds for attacking buildings are executed in "procedure TKMUnitActionStay.MakeSound(".
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
              //Launch the missile and forget about it
              //Shooting range is not important now, houses don't walk (except Howl's Moving Castle perhaps)
              //todo: Slingers (rogues) should launch rock part on SLINGSHOT_FIRING_DELAY like they do in ActionFight (animation looks wrong now)
              gProjectiles.AimTarget(PositionF, fHouse, ProjectileType, fUnit, RangeMax, RangeMin);

              SetLastShootTime; //Record last time the warrior shot
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            //Launch the missile and forget about it
            //Shooting range is not important now, houses don't walk (except Howl's Moving Castle perhaps)
            //todo: Slingers (rogues) should launch rock part on SLINGSHOT_FIRING_DELAY like they do in ActionFight (animation looks wrong now)
              gProjectiles.AimTarget(PositionF, fHouse, ProjectileType, fUnit, RangeMax, RangeMin);

            //cmowla Projectiles (added 2 additional rocks for catapult) - for attacking houses only!
              If UnitType = utCatapult Then begin
                gProjectiles.AimTarget(PositionF, fHouse, ProjectileType, fUnit, RangeMax, RangeMin);
                gProjectiles.AimTarget(PositionF, fHouse, ProjectileType, fUnit, RangeMax, RangeMin);
              end;

              SetLastShootTime; //Record last time the warrior shot
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=================================================================================
..\src\media\KM_Sound.pas [3 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function PlaySound(aSoundID: TSoundFX; const aFile: UnicodeString; const Loc: TKMPointF; aSoundType: TKMSoundType;
                       aAttenuated: Boolean; aVolume: Single; aRadius: Single; aFadeMusic, aLooped: Boolean; aFromScript: Boolean = False): Integer;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function PlaySound(aSoundID: TSoundFX; aFile: UnicodeString; const Loc: TKMPointF; aSoundType: TKMSoundType; //cmowla sound effects - (Removed const from const aFile.)
                       aAttenuated: Boolean; aVolume: Single; aRadius: Single; aFadeMusic, aLooped: Boolean; aFromScript: Boolean = False): Integer;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TKMSoundPlayer.PlaySound(aSoundID: TSoundFX; const aFile: UnicodeString; const Loc: TKMPointF; aSoundType: TKMSoundType;
                                  aAttenuated: Boolean; aVolume: Single; aRadius: Single; aFadeMusic, aLooped: Boolean;
                                  aFromScript: Boolean = False): Integer;
var
  dif: array[1..3]of Single;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TKMSoundPlayer.PlaySound(aSoundID: TSoundFX; aFile: UnicodeString; const Loc: TKMPointF; aSoundType: TKMSoundType;  //cmowla sound effects - (Removed const from const aFile.)
                                  aAttenuated: Boolean; aVolume: Single; aRadius: Single; aFadeMusic, aLooped: Boolean;
                                  aFromScript: Boolean = False): Integer;
var
  dif: array[1..3]of Single;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




function TKMSoundPlayer.PlaySound(  ... Same function as ^^

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (aSoundID = sfxNone) and (aFile = '') then Exit;

  //Do not play game sounds, if game is ready to stop
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (aSoundID = sfxNone) and (aFile = '') then Exit;

//cmowla sound effects (code block below).
  If aSoundID = sfxCatapultShoot Then begin
    aFile := ExeDir + SIEGE_UNIT_FILES_FOLDER + PathDelim + 'Sounds' + PathDelim + 'Catapult Shoot.wav';
    If FileExists(aFile) = False Then Exit;
    aSoundID := sfxNone;
  end;

  //Do not play game sounds, if game is ready to stop
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 14 - Siege Unit Properties [Sprites / Animations]
*************************************************************************
//(Note:  The "sprite arrays" were added earlier in Part 13.)



=========================================================================
..\src\res\KM_ResUnits.pas [2 Items]


constructor TKMResUnits.Create; (1)

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
{ TKMUnitsDatCollection }
constructor TKMResUnits.Create;
const
  DEF_SCOUT_SIGHT = 9;
  DEF_HORSEMAN_ATTACK = 40;
  DEF_PEASANT_ATTACK_HORSE = 60;
  DEF_PIKEMAN_ATTACK_HORSE = 55;
  DEF_MOUNTED_SPEED = 39;
var
  UT: TKMUnitType;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
{ TKMUnitsDatCollection }
constructor TKMResUnits.Create;
const
  DEF_SCOUT_SIGHT = 9;
  DEF_HORSEMAN_ATTACK = 40;
  DEF_PEASANT_ATTACK_HORSE = 60;
  DEF_PIKEMAN_ATTACK_HORSE = 55;
  DEF_MOUNTED_SPEED = 39;
var
  UT: TKMUnitType;
  unitDirI: TKMDirection; //cmowla (Add in New Unit) [Sprites]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




constructor TKMResUnits.Create; (2)

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if fItems[utVagabond].fUnitDat.Speed = DEF_MOUNTED_SPEED then
    fItems[utVagabond].fUnitDat.Speed := 40;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if fItems[utVagabond].fUnitDat.Speed = DEF_MOUNTED_SPEED then
    fItems[utVagabond].fUnitDat.Speed := 40;

//cmowla (Add in New Unit) [Sprites]
    For unitDirI := dirN to dirNW do begin
      fItems[utCatapult].fUnitSprite.Act[uaDie].Dir[unitDirI].Count := 22;
      fItems[utBallista].fUnitSprite.Act[uaDie].Dir[unitDirI].Count := 22;
      fItems[utCatapult].fUnitSprite.Act[uaWalk].Dir[unitDirI].Count := 20;
      fItems[utBallista].fUnitSprite.Act[uaWalk].Dir[unitDirI].Count := 20;
    end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=================================================================================
..\src\render\KM_RenderPool.pas [5 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMRenderPool.AddUnit(aUnit: TKMUnitType; aUID: Integer; aAct: TKMUnitActionType; aDir: TKMDirection; StepId: Integer; StepFrac: Single;
                              pX,pY: Single; FlagColor: TColor4; NewInst: Boolean; DoImmediateRender: Boolean = False;
                              DoHighlight: Boolean = False; HighlightColor: TColor4 = 0);
var
  cornerX, cornerY, ground: Single;
  id, id0: Integer;
  R: TRXData;
begin
  id := gRes.Interpolation.UnitAction(aUnit, aAct, aDir, StepId, StepFrac);
  id0 := gRes.Interpolation.UnitAction(aUnit, aAct, aDir, UNIT_STILL_FRAMES[aDir], 0.0);
  if id <= 0 then exit;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMRenderPool.AddUnit(aUnit: TKMUnitType; aUID: Integer; aAct: TKMUnitActionType; aDir: TKMDirection; StepId: Integer; StepFrac: Single;
                              pX,pY: Single; FlagColor: TColor4; NewInst: Boolean; DoImmediateRender: Boolean = False;
                              DoHighlight: Boolean = False; HighlightColor: TColor4 = 0);
var
  cornerX, cornerY, ground: Single;
  id, id0: Integer;
  R: TRXData;
begin
//------------------------------------------------------------------------------
//cmowla Sprites bbb     gHands.GetUnitByUID(aUID).AnimStep := 0;  (To actually change the StepId from this code module!)
  id := 0; //(To remove the compiler warning that " 'id' might not have been initialized.)
  Case aUnit of
    utCatapult: begin
      Case aAct of
        //uaWalk: id := catapultWalkIDs[TKMDirectionToInt[aDir] + 1][StepId Mod 19];
        uaWork: begin
        //StepID grows past array length when unit is attacking units (but not when attacking houses).
        //This will (on occasion) throw off the animation (rock appears to be thrown too late, catapult arm is not where it should be, etc.).
        //So, if StepId exceeds 29, set it to 0 (both the actual animStep counter and StepId).
          If StepId > 29 Then begin
            gHands.GetUnitByUID(aUID).AnimStep := 0;
            StepId := 0;
          end;
          id := catapultWorkIDs[TKMDirectionToInt[aDir] + 1][StepId];
        end;
        uaDie: id := catapultDieIDs[TKMDirectionToInt[aDir] + 1][StepId Mod 21]; //Probably unnecessary for the "Mod 21" here, but JUST IN CASE!
        Else id := gRes.Interpolation.UnitAction(aUnit, aAct, aDir, StepId, StepFrac); //Command that was originally here.
      end;
    end;

    utBallista: begin
      Case aAct of
        //uaWalk: id := ballistaWalkIDs[TKMDirectionToInt[aDir] + 1][StepId Mod 19];
        uaWork: begin
        //StepID grows past array length when unit is attacking units (but not when attacking houses).
        //This will (on occasion) throw off the animation (bolt appears to be lanuced too late, ballista bow is not stretched where it should be, etc.).
        //So, if StepId exceeds 29, set it to 0 (both the actual animStep counter and StepId).
          If StepId > 29 Then begin  //Must be 28 insead of 29, due to 1 less frame than the catapult (despite the spread of 30 in the initilization of this array?)
            gHands.GetUnitByUID(aUID).AnimStep := 0;
            StepId := 0;
          end;
          id := ballistaWorkIDs[TKMDirectionToInt[aDir] + 1][StepId];
        end;
        uaDie: id := ballistaDieIDs[TKMDirectionToInt[aDir] + 1][StepId Mod 21];
        Else id := gRes.Interpolation.UnitAction(aUnit, aAct, aDir, StepId, StepFrac); //Command that was originally here.
      end;
    end;

    Else id := gRes.Interpolation.UnitAction(aUnit, aAct, aDir, StepId, StepFrac); //Command that was originally here.
  end;

  if id <= 0 then exit;
  id0 := gRes.Interpolation.UnitAction(aUnit, aAct, aDir, UNIT_STILL_FRAMES[aDir], 0.0);
//------------------------------------------------------------------------------
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    procedure AddSpriteG(aRX: TRXType; aID: Integer; aUID: Integer; pX,pY,gX,gY: Single; aTeam: Cardinal = $0; aAlphaStep: Single = -1);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    procedure AddSpriteG(aRX: TRXType; aID: Integer; aUID: Integer; pX,pY,gX,gY: Single; aTeam: Cardinal = $0; aAlphaStep: Single = -1; xOff: Single = 0; yOff: Single = 0); //cmowla siege units [flag sprite offsets]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  flagX := pX + (R.Pivot[idFlag].X + FlagXOffset[UNIT_TO_GROUP_TYPE[aUnit], aDir]) / CELL_SIZE_PX - 0.5;
  flagY := gTerrain.RenderFlatToHeight(pX, pY) + (R.Pivot[idFlag].Y + FlagYOffset[UNIT_TO_GROUP_TYPE[aUnit], aDir] + R.Size[idFlag].Y) / CELL_SIZE_PX - 2.25;

  if DoImmediateRender then
    RenderSprite(rxUnits, idFlag, flagX, flagY, FlagColor)
  else
    fRenderList.AddSpriteG(rxUnits, idFlag, 0, flagX, flagY, pX, ground, FlagColor);
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  flagX := pX + (R.Pivot[idFlag].X + FlagXOffset[UNIT_TO_GROUP_TYPE[aUnit], aDir]) / CELL_SIZE_PX - 0.5;
  flagY := gTerrain.RenderFlatToHeight(pX, pY) + (R.Pivot[idFlag].Y + FlagYOffset[UNIT_TO_GROUP_TYPE[aUnit], aDir] + R.Size[idFlag].Y) / CELL_SIZE_PX - 2.25;

//cmowla siege units [flag sprite offsets]
  if DoImmediateRender then
    RenderSprite(rxUnits, idFlag, flagX, flagY, FlagColor)
  else begin
    Case aUnit of
      utCatapult: begin
        Case aDir of
          dirN:  fRenderList.AddSpriteG(rxUnits, idFlag, 0, flagX, flagY, pX, ground, FlagColor, -1, -0.24, -0.57);
          dirNE: fRenderList.AddSpriteG(rxUnits, idFlag, 0, flagX, flagY, pX, ground, FlagColor, -1, -0.17, -0.64);
          dirE:  fRenderList.AddSpriteG(rxUnits, idFlag, 0, flagX, flagY, pX, ground, FlagColor, -1,  0.08, -0.58);
          dirSE: fRenderList.AddSpriteG(rxUnits, idFlag, 0, flagX, flagY, pX, ground, FlagColor, -1,  0.2,  -0.51);
          dirS:  fRenderList.AddSpriteG(rxUnits, idFlag, 0, flagX, flagY, pX, ground, FlagColor, -1,  0.19, -0.44);
          dirSW: fRenderList.AddSpriteG(rxUnits, idFlag, 0, flagX, flagY, pX, ground, FlagColor, -1,  0.04, -0.41);
          dirW:  fRenderList.AddSpriteG(rxUnits, idFlag, 0, flagX, flagY, pX, ground, FlagColor, -1, -0.06, -0.42);
          dirNW: fRenderList.AddSpriteG(rxUnits, idFlag, 0, flagX, flagY, pX, ground, FlagColor, -1, -0.17, -0.6);
        end;
      end;
      utBallista: begin
        Case aDir of
          dirN:  fRenderList.AddSpriteG(rxUnits, idFlag, 0, flagX, flagY, pX, ground, FlagColor, -1, -0.19, -0.22);
          dirNE: fRenderList.AddSpriteG(rxUnits, idFlag, 0, flagX, flagY, pX, ground, FlagColor, -1, -0.05, -0.16);
          dirE:  fRenderList.AddSpriteG(rxUnits, idFlag, 0, flagX, flagY, pX, ground, FlagColor, -1, 0.13, -0.16);
          dirSE: fRenderList.AddSpriteG(rxUnits, idFlag, 0, flagX, flagY, pX, ground, FlagColor, -1, 0.21, 0.13);
          dirS:  fRenderList.AddSpriteG(rxUnits, idFlag, 0, flagX, flagY, pX, ground, FlagColor, -1, 0.22, 0.12);
          dirSW: fRenderList.AddSpriteG(rxUnits, idFlag, 0, flagX, flagY, pX, ground, FlagColor, -1, 0.08, 0.2);
          dirW:  fRenderList.AddSpriteG(rxUnits, idFlag, 0, flagX, flagY, pX, ground, FlagColor, -1, 0.01, 0.1);
          dirNW: fRenderList.AddSpriteG(rxUnits, idFlag, 0, flagX, flagY, pX, ground, FlagColor, -1, -0.22, -0.12);
        end;
      end;
      Else fRenderList.AddSpriteG(rxUnits, idFlag, 0, flagX, flagY, pX, ground, FlagColor);
    end;
  end;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMRenderList.AddSpriteG(aRX: TRXType; aId: Integer; aUID: Integer; pX,pY,gX,gY: Single; aTeam: Cardinal = $0; aAlphaStep: Single = -1);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMRenderList.AddSpriteG(aRX: TRXType; aId: Integer; aUID: Integer; pX,pY,gX,gY: Single; aTeam: Cardinal = $0; aAlphaStep: Single = -1; xOff: Single = 0; yOff: Single = 0); //cmowla siege units [flag sprite offsets]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




procedure TKMRenderList.AddSpriteG(aRX: TRXType; aId: Integer; aUID: Integer; pX,pY,gX,gY: Single; aTeam: Cardinal = $0; aAlphaStep: Single = -1);

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  fRenderList[fCount].Loc        := KMPointF(pX, pY); // Position of sprite, floating-point
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  fRenderList[fCount].Loc        := KMPointF(pX + xOff, pY + yOff); // Position of sprite, floating-point //cmowla siege units [sprites]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 15 - Siege Workshop [Adding to Menus]
*************************************************************************




=========================================================================
..\src\gui\KM_InterfaceGame.pas [2 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  GUI_HOUSE_COUNT = 28; // Number of KaM houses to show in GUI
  GUIHouseOrder: array [1..GUI_HOUSE_COUNT] of TKMHouseType = (
    htSchool, htInn, htQuarry, htWoodcutters, htSawmill,
    htFarm, htMill, htBakery, htSwine, htButchers,
    htVineyard, htGoldMine, htCoalMine, htMetallurgists, htWeaponWorkshop,
    htTannery, htArmorWorkshop, htStables, htIronMine, htIronSmithy,
    htWeaponSmithy, htArmorSmithy, htBarracks, htStore, htWatchTower,
    htFishermans, htMarket, htTownHall);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  GUI_HOUSE_COUNT = 29; // Number of KaM houses to show in GUI //cmowla siege workshop [GUI house button]
  GUIHouseOrder: array [1..GUI_HOUSE_COUNT] of TKMHouseType = (
    htSchool, htInn, htQuarry, htWoodcutters, htSawmill,
    htFarm, htMill, htBakery, htSwine, htButchers,
    htVineyard, htGoldMine, htCoalMine, htMetallurgists, htWeaponWorkshop,
    htTannery, htArmorWorkshop, htStables, htIronMine, htIronSmithy,
    htWeaponSmithy, htArmorSmithy, htBarracks, htStore, htWatchTower,
    htFishermans, htMarket, htTownHall, htSiegeWorkshop);  //cmowla siege workshop [GUI house button]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(HouseType: (htSawmill, htWeaponWorkshop, htArmorWorkshop, htNone); UnitType: (utCarpenter, utNone)),
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    (HouseType: (htSawmill, htWeaponWorkshop, htArmorWorkshop, htSiegeWorkshop); UnitType: (utCarpenter, utNone)),  //cmowla siege workshop [GUI house icon] - Added siege workshop to building count stat menu.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 16 - Siege Workshop [Building Selection Panel / GUI]
*************************************************************************




=========================================================================
..\src\controls\KM_ControlsWaresRow.pas [2 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  // Production cost bar
  TKMCostsRow = class(TKMControl)
  public
    RX: TRXType;
    TexID1, TexID2: Word;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  // Production cost bar
  TKMCostsRow = class(TKMControl)
  public
    RX: TRXType;
    TexID1, TexID2, TexID3, TexID4, TexID5: Word;  //cmowla siege workshop [weapon cost display] (Added in TexID3, TexID4, TexID5.)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




procedure TKMCostsRow.Paint;

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    if TexID1 <> 0 then
      TKMRenderUI.WritePicture(AbsLeft+Width-40, AbsTop, 20, Height, [], RX, TexID1);
    if TexID2 <> 0 then
      TKMRenderUI.WritePicture(AbsLeft+Width-20, AbsTop, 20, Height, [], RX, TexID2);
  end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    if TexID1 <> 0 then
      TKMRenderUI.WritePicture(AbsLeft+Width-40, AbsTop, 20, Height, [], RX, TexID1);
    if TexID2 <> 0 then
      TKMRenderUI.WritePicture(AbsLeft+Width-20, AbsTop, 20, Height, [], RX, TexID2);

  //cmowla siege workshop [weapon cost display] - TexID order:  5 4 3 1 2
    If TexID3 <> 0 Then TKMRenderUI.WritePicture(AbsLeft+Width - 60, AbsTop, 20, Height, [], RX, TexID3);
    If TexID4 <> 0 Then TKMRenderUI.WritePicture(AbsLeft+Width - 80, AbsTop, 20, Height, [], RX, TexID4);

  //For "Option 1" (x5 plank, x5 iron bar) in procedure TKMGUIGameHouse.ShowSiegeWorkshop(aHouse: TKMHouse); in [..\src\gui\pages_game\KM_GUIGameHouse.pas].
    If TexID5 <> 0 Then TKMRenderUI.WritePicture(AbsLeft+Width - 90, AbsTop, 20, Height, [], RX, TexID5);

  //For "Option 2" (5 plank, 5 iron bar icon) in procedure TKMGUIGameHouse.ShowSiegeWorkshop(aHouse: TKMHouse); in [..\src\gui\pages_game\KM_GUIGameHouse.pas].
//    If TexID5 <> 0 Then TKMRenderUI.WritePicture(AbsLeft+Width - 100, AbsTop, 20, Height, [], RX, TexID5);
  end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\gui\pages_game\KM_GUIGameHouse.pas [5 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function GetEquipAmount(Shift: TShiftState): Integer;
  protected
    Panel_House: TKMPanel;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function GetEquipAmount(Shift: TShiftState): Integer;

 //cmowla siege workshop
    procedure Create_SiegeWorkshop;
    procedure ShowSiegeWorkshop(aHouse: TKMHouse);
    procedure House_SiegeWorkshop_Change(Sender: TObject; aValue: Integer);
  protected
 //cmowla siege workshop
  Image_CATAPULT_SIEGE_UNIT, Image_BALLISTA_SIEGE_UNIT: TKMImage;  //cmowla siege workshop [panel scoll images]
  SiegeWorkshopOrderRow: Array [1..2] of TKMWareOrderRow; //cmowla siege workshop [weapon order buttons]
  CostRowCostX5s: Array [1..4] of TKMLabel; //cmowla siege workshop [weapon cost display]

    Panel_House: TKMPanel;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




constructor TKMGUIGameHouse.Create(aParent: TKMPanel; aSetViewportEvent: TPointFEvent);

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        Label_DepletedMsg := TKMLabel.Create(Panel_House_Common,0,0,TB_WIDTH,0,'',fntGrey,taLeft);
        Label_DepletedMsg.WordWrap := True;
        Label_DepletedMsg.Hide;
      end;

  Create_HouseMarket;
  Create_HouseStore;
  Create_HouseSchool;
  Create_HouseBarracks;
  Create_HouseTownhall;
  Create_HouseWoodcutter;
  Create_HouseArmorWorkshop;
end;


// Market page
procedure TKMGUIGameHouse.Create_HouseMarket;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        Label_DepletedMsg := TKMLabel.Create(Panel_House_Common,0,0,TB_WIDTH,0,'',fntGrey,taLeft);
        Label_DepletedMsg.WordWrap := True;
        Label_DepletedMsg.Hide;
      end;

  Create_HouseMarket;
  Create_HouseStore;
  Create_HouseSchool;
  Create_HouseBarracks;
  Create_HouseTownhall;
  Create_HouseWoodcutter;
  Create_HouseArmorWorkshop;
  Create_SiegeWorkshop; //cmowla siege workshop
end;


//cmowla siege workshop (Entire procedure, of course!)
procedure TKMGUIGameHouse.Create_SiegeWorkshop;
var i: Integer;
begin //Left and Top Offsets are may not be specified in the object declarations (they may be set to 0 there), but they will be in the lines that follow if not.

//cmowla siege workshop [panel scoll images]
  Image_CATAPULT_SIEGE_UNIT := TKMImage.Create(Panel_House,0,0,40,40,549,rxGUI);
  Image_CATAPULT_SIEGE_UNIT.Left := 12;
  Image_CATAPULT_SIEGE_UNIT.Top := 190;

  Image_BALLISTA_SIEGE_UNIT := TKMImage.Create(Panel_House,0,0,40,40,550);
  Image_BALLISTA_SIEGE_UNIT.Left := Image_CATAPULT_SIEGE_UNIT.Left + 24 + Image_CATAPULT_SIEGE_UNIT.Height + 24;
  Image_BALLISTA_SIEGE_UNIT.Top := 190;

//cmowla siege workshop [weapon order buttons]
  SiegeWorkshopOrderRow[1] := TKMWareOrderRow.Create(Panel_House_Common, Image_CATAPULT_SIEGE_UNIT.Left, 0, Trunc(TB_WIDTH / 4.0), 25);
  SiegeWorkshopOrderRow[1].Top := Image_BALLISTA_SIEGE_UNIT.Top + 30;
  SiegeWorkshopOrderRow[1].MouseWheelStep := HOUSE_ORDER_ROW_MOUSEWHEEL_STEP;
  SiegeWorkshopOrderRow[1].WareRow.RX := rxGui;
  SiegeWorkshopOrderRow[1].OnChange := House_SiegeWorkshop_Change;
  SiegeWorkshopOrderRow[1].OrderRemHint := gResTexts[TX_HOUSE_ORDER_DEC_HINT];
  SiegeWorkshopOrderRow[1].OrderAddHint := gResTexts[TX_HOUSE_ORDER_INC_HINT];

  SiegeWorkshopOrderRow[2] := TKMWareOrderRow.Create(Panel_House_Common, SiegeWorkshopOrderRow[1].Left + 88, 0, Trunc(TB_WIDTH / 4.0), 25);
  SiegeWorkshopOrderRow[2].Top := Image_BALLISTA_SIEGE_UNIT.Top + 30;
  SiegeWorkshopOrderRow[2].MouseWheelStep := HOUSE_ORDER_ROW_MOUSEWHEEL_STEP;
  SiegeWorkshopOrderRow[2].WareRow.RX := rxGui;
  SiegeWorkshopOrderRow[2].OnChange := House_SiegeWorkshop_Change;
  SiegeWorkshopOrderRow[2].OrderRemHint := gResTexts[TX_HOUSE_ORDER_DEC_HINT];
  SiegeWorkshopOrderRow[2].OrderAddHint := gResTexts[TX_HOUSE_ORDER_INC_HINT];

//cmowla siege workshop [weapon cost display] (for "Option 1" only).  (Offset .Left by +4 if you want the caption to be (x5) instead of x5.)
  CostRowCostX5s[1] := TKMLabel.Create(Panel_House,130 - 10,SiegeWorkshopOrderRow[1].Top + 123,'x5',fntGrey,taCenter);
  CostRowCostX5s[2] := TKMLabel.Create(Panel_House,170 - 2,SiegeWorkshopOrderRow[1].Top + 123,'x5',fntGrey,taCenter);
  CostRowCostX5s[3] := TKMLabel.Create(Panel_House,130 - 10,SiegeWorkshopOrderRow[1].Top + 123 + 24,'x5',fntGrey,taCenter);
  CostRowCostX5s[4] := TKMLabel.Create(Panel_House,170 - 2,SiegeWorkshopOrderRow[1].Top + 123 + 24,'x5',fntGrey,taCenter);
  For i := 1 to 4 do CostRowCostX5s[i].Hide;
end;


//cmowla siege workshop [weapon order buttons]
{Not really necessary (can be merged with "procedure TKMGUIGameHouse.House_OrderChange(", but having this procedure:
  [1] Saves unnecessary looping
  [2] Allows us to delcare SiegeWorkshopOrderRow as SiegeWorkshopOrderRow: Array[1..2] instead of SiegeWorkshopOrderRow: Array[1..4].}
procedure TKMGUIGameHouse.House_SiegeWorkshop_Change(Sender: TObject; aValue: Integer);
var
  I: Integer;
  H: TKMHouse;
begin
  If Not (gMySpectator.Selected is TKMHouse) Then Exit;
  H := TKMHouse(gMySpectator.Selected);
  For I := 1 to 2 do
    If (Sender = SiegeWorkshopOrderRow[I]) //(Onclick on + or - for Catapult or Ballista.)
    And Not gMySpectator.Hand.Locks.GetUnitBlocked(SiegeWorkshop_Order[I - 1]) //Unit is not blocked
    Then gGame.GameInputProcess.CmdHouse(gicHouseOrderProduct, H, I, aValue);
end;

//cmowla siege workshop (Onclick on siege workshop house event.)
procedure TKMGUIGameHouse.ShowSiegeWorkshop(aHouse: TKMHouse);
var i: Integer; textConstant: Word;
begin

  //cmowla Weapon Buildings Have "order" instead of "delivers"
    If usersLanguage = 'eng'
    Then textConstant := TX_HOUSE_WEAPON_ORDERS
    Else textConstant := TX_HOUSE_DELIVERS;

//cmowla siege workshop [panel, general]
  //Delivery (x1) clause
    Label_Common_Offer.Caption := gResTexts[textConstant];
    Label_Common_Offer.Top := 90;
    Label_Common_Offer.Show;

//cmowla siege workshop [weapon order buttons]
  //Get and display the current order count for catapult.
    SiegeWorkshopOrderRow[1].OrderCount := aHouse.WareOrder[1];
    SiegeWorkshopOrderRow[1].Show;

  //Get and display the current order count for ballista.
    SiegeWorkshopOrderRow[2].OrderCount := aHouse.WareOrder[2];
    SiegeWorkshopOrderRow[2].Show;

//cmowla siege workshop [panel scoll images]
  //Dynamically change the player color of the siege unit scroll image GUI icons.
  //Must keep showing them, because they are hidden at the start of other "common" buildings.
    Image_CATAPULT_SIEGE_UNIT.FlagColor := gHands[aHouse.Owner].FlagColor;
    Image_CATAPULT_SIEGE_UNIT.Show;

    Image_BALLISTA_SIEGE_UNIT.FlagColor := gHands[aHouse.Owner].FlagColor;
    Image_BALLISTA_SIEGE_UNIT.Show;

    If gMySpectator.Hand.Locks.GetUnitBlocked(utCatapult) //If it's blocked, dim the scroll image.
    Then Image_CATAPULT_SIEGE_UNIT.Lightness := -0.62
    Else Image_CATAPULT_SIEGE_UNIT.Lightness := 0; //restore it for players whose buildings may be selected for which the unit is NOT blocked.

    If gMySpectator.Hand.Locks.GetUnitBlocked(utBallista)
    Then Image_BALLISTA_SIEGE_UNIT.Lightness := -0.62
    Else Image_BALLISTA_SIEGE_UNIT.Lightness := 0;

//cmowla siege workshop [weapon cost display]
  //"Cost:" (the word only)
    Label_Common_Costs.Top := SiegeWorkshopOrderRow[1].Top + 30;
    Label_Common_Costs.Show;

  //Weapon names from previously selecting another building may be visible.  Hide them.
    For i := 1 to 4 do CostsRow_Costs[i].Caption := '';


//Siege unit cost display   (TexID order:  5 4 3 1 2)
  //See the last 3 lines in "procedure TKMCostsRow.Paint;" and see the "TexID1, TexID2, TexID3, TexID4, TexID5: Word;"
  //declaration (both in "src\controls\KM_ControlsWaresRow.pas") for more information.

//-----------------------[Option 1]----------------------- (x5 plank, x5 iron bar)
   For i := 1 to 4 do CostRowCostX5s[i].Show;
  //Catapult Cost Information
    CostsRow_Costs[1].Caption := gResTexts[TX_UNITS_CATAPULT];
    CostsRow_Costs[1].Top :=  Label_Common_Costs.Top + 15;
    CostsRow_Costs[1].TexID5 := gRes.Wares[wtTimber].GUIIcon;
    CostsRow_Costs[1].TexID4 := 0;
    CostsRow_Costs[1].TexID3 := 0;
    CostsRow_Costs[1].TexID1 := gRes.Wares[wtIron].GUIIcon;
    CostsRow_Costs[1].TexID2 := 0;
    CostsRow_Costs[1].Show;

  //Ballista Cost Information
    CostsRow_Costs[2].Caption := gResTexts[TX_UNITS_BALLISTA];
    CostsRow_Costs[2].Top :=  CostsRow_Costs[1].Top + 24;
    CostsRow_Costs[2].TexID5 := gRes.Wares[wtTimber].GUIIcon;
    CostsRow_Costs[2].TexID4 := 0;
    CostsRow_Costs[2].TexID3 := 0;
    CostsRow_Costs[2].TexID1 := gRes.Wares[wtIron].GUIIcon;
    CostsRow_Costs[2].TexID2 := 0;
    CostsRow_Costs[2].Show;

////-----------------------[Option 2]----------------------- (5 plank, 5 iron bar icon)
//  //Catapult Cost Information
//    CostsRow_Costs[1].Caption := gResTexts[TX_UNITS_CATAPULT];
//
//    //Row of timber icons
//      CostsRow_Costs[1].Top :=  Label_Common_Costs.Top + 15;
//      CostsRow_Costs[1].TexID1 := gRes.Wares[wtTimber].GUIIcon;
//      CostsRow_Costs[1].TexID2 := gRes.Wares[wtTimber].GUIIcon;
//      CostsRow_Costs[1].TexID3 := gRes.Wares[wtTimber].GUIIcon;
//      CostsRow_Costs[1].TexID4 := gRes.Wares[wtTimber].GUIIcon;
//      CostsRow_Costs[1].TexID5 := gRes.Wares[wtTimber].GUIIcon;
//      CostsRow_Costs[1].Show;
//
//    //Row of iron bar icons
//      CostsRow_Costs[2].Top :=  CostsRow_Costs[1].Top + 20;
//      CostsRow_Costs[2].TexID1 := gRes.Wares[wtIron].GUIIcon;
//      CostsRow_Costs[2].TexID2 := gRes.Wares[wtIron].GUIIcon;
//      CostsRow_Costs[2].TexID3 := gRes.Wares[wtIron].GUIIcon;
//      CostsRow_Costs[2].TexID4 := gRes.Wares[wtIron].GUIIcon;
//      CostsRow_Costs[2].TexID5 := gRes.Wares[wtIron].GUIIcon;
//      CostsRow_Costs[2].Show;
//
//  //Ballista Cost Information
//      CostsRow_Costs[3].Caption := gResTexts[TX_UNITS_BALLISTA];
//
//    //Row of timber icons
//      CostsRow_Costs[3].Top :=  CostsRow_Costs[2].Top + 24;
//      CostsRow_Costs[3].TexID1 := gRes.Wares[wtTimber].GUIIcon;
//      CostsRow_Costs[3].TexID2 := gRes.Wares[wtTimber].GUIIcon;
//      CostsRow_Costs[3].TexID3 := gRes.Wares[wtTimber].GUIIcon;
//      CostsRow_Costs[3].TexID4 := gRes.Wares[wtTimber].GUIIcon;
//      CostsRow_Costs[3].TexID5 := gRes.Wares[wtTimber].GUIIcon;
//      CostsRow_Costs[3].Show;
//
//    //Row of iron bar icons
//      CostsRow_Costs[4].Top :=  CostsRow_Costs[3].Top + 20;
//      CostsRow_Costs[4].TexID1 := gRes.Wares[wtIron].GUIIcon;
//      CostsRow_Costs[4].TexID2 := gRes.Wares[wtIron].GUIIcon;
//      CostsRow_Costs[4].TexID3 := gRes.Wares[wtIron].GUIIcon;
//      CostsRow_Costs[4].TexID4 := gRes.Wares[wtIron].GUIIcon;
//      CostsRow_Costs[4].TexID5 := gRes.Wares[wtIron].GUIIcon;
//      CostsRow_Costs[4].Show;
end;

// Market page
procedure TKMGUIGameHouse.Create_HouseMarket;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -



procedure TKMGUIGameHouse.Show(aHouse: TKMHouse; aAskDemolish: Boolean);

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  Button_HouseDeliveryMode.TexID := DELIVERY_MODE_SPRITE[aHouse.NewDeliveryMode];

  Label_House_UnderConstruction.Hide;
  Image_HouseConstructionWood.Hide;
  Image_HouseConstructionStone.Hide;
  Label_HouseConstructionWood.Hide;
  Label_HouseConstructionStone.Hide;
  Label_House_Demolish.Hide;
  Button_House_DemolishYes.Hide;
  Button_House_DemolishNo.Hide;
  Panel_House.Show;

  case aHouse.HouseType of
    htMarket:         begin
                        House_MarketFill(TKMHouseMarket(aHouse));
                        Panel_HouseMarket.Show;
                      end;
    htStore:          begin
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  Button_HouseDeliveryMode.TexID := DELIVERY_MODE_SPRITE[aHouse.NewDeliveryMode];

  Label_House_UnderConstruction.Hide;
  Image_HouseConstructionWood.Hide;
  Image_HouseConstructionStone.Hide;
  Label_HouseConstructionWood.Hide;
  Label_HouseConstructionStone.Hide;
  Label_House_Demolish.Hide;
  Button_House_DemolishYes.Hide;
  Button_House_DemolishNo.Hide;
  Panel_House.Show;

//cmowla siege workshop [panel scoll images]
  //Hide stuff explicitely on the siege workshop page.
  //This obviously is not necessary if the siege workshop had its "own page" like
  //the armory workshop, but I don't think it's "worth it", JUST TO AVOID THIS!
    Image_CATAPULT_SIEGE_UNIT.Hide;
    Image_BALLISTA_SIEGE_UNIT.Hide;

//cmowla siege workshop [weapon cost display]
  For I := 1 to 4 do begin
    CostsRow_Costs[I].TexID3 := 0;
    CostsRow_Costs[I].TexID4 := 0;
    CostsRow_Costs[I].TexID5 := 0;
    CostRowCostX5s[I].Hide;
  end;

  case aHouse.HouseType of
    htMarket:         begin
                        House_MarketFill(TKMHouseMarket(aHouse));
                        Panel_HouseMarket.Show;
                      end;
    htStore:          begin
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




procedure TKMGUIGameHouse.Show(aHouse: TKMHouse; aAskDemolish: Boolean);

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    htArmorWorkshop:  ShowArmorWorkshop(aHouse);
    htTownHall:       ShowTownHall(aHouse);
  else
    //First thing - hide everything
    for I := 0 to Panel_House_Common.ChildCount - 1 do
      Panel_House_Common.Childs[I].Hide;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    htArmorWorkshop:  ShowArmorWorkshop(aHouse);
    htTownHall:       ShowTownHall(aHouse);
    htSiegeWorkshop:  begin //cmowla siege workshop [panel, general] - Click on house event.
                          For I := 0 to Panel_House_Common.ChildCount - 1 do Panel_House_Common.Childs[I].Hide;
                          rowRes := 1; line := 0; base := 2;
                          ShowCommonDemand(aHouse, base, line, rowRes);
                          ShowCommonOutput(aHouse, base, line, rowRes);
                          ShowSiegeWorkshop(aHouse); //Instead of ShowCommonOrders(aHouse, base, line, rowRes)
                      end
  else
  //First thing - hide everything
    for I := 0 to Panel_House_Common.ChildCount - 1 do
      Panel_House_Common.Childs[I].Hide;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMGUIGameHouse.ShowCommonOrders(aHouse: TKMHouse; Base: Integer; var Line, RowRes: Integer);
var
  I: Integer;
  W: TKMWareType;
begin
  //Show Orders
  if gRes.Houses[aHouse.HouseType].DoesOrders then
  begin
    Label_Common_Offer.Show;
    Label_Common_Offer.Caption := gResTexts[TX_HOUSE_DELIVERS] + '(x' + IntToStr(gRes.Houses[aHouse.HouseType].ResProductionX) + '):';
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMGUIGameHouse.ShowCommonOrders(aHouse: TKMHouse; Base: Integer; var Line, RowRes: Integer);
var
  I: Integer;
  W: TKMWareType;
  textConstant: Word;
begin
  //Show Orders
  if gRes.Houses[aHouse.HouseType].DoesOrders then
  begin

  //cmowla Weapon Buildings Have "order" instead of "delivers"
    If usersLanguage = 'eng'
    Then textConstant := TX_HOUSE_WEAPON_ORDERS
    Else textConstant := TX_HOUSE_DELIVERS;

    Label_Common_Offer.Show;
    Label_Common_Offer.Caption := gResTexts[textConstant];
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\data\text\text.eng.libx [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
137:Needs:
140:Delivers
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
137:Needs:
138:Orders
140:Delivers
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\KM_TextIDs.inc [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
TX_HOUSE_NEEDS = 137; //Needs:
TX_HOUSE_DELIVERS = 140; //Delivers
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
TX_HOUSE_NEEDS = 137; //Needs:
TX_HOUSE_WEAPON_ORDERS = 138; //Weapon building orders //cmowla Weapon Buildings Have "order" instead of "delivers"
TX_HOUSE_DELIVERS = 140; //Delivers
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\res\KM_ResLocales.pas [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMResLocales.SetUserLocale(const aLocale: AnsiString);
begin
  //Make sure user locale is valid
  if IndexByCode(aLocale) <> -1 then
    fUserLocale := aLocale
  else
    fUserLocale := DefaultLocale;

  FallbackLocale := LocaleByCode(fUserLocale).FallbackLocale;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMResLocales.SetUserLocale(const aLocale: AnsiString);
begin
  //Make sure user locale is valid
  if IndexByCode(aLocale) <> -1 then
    fUserLocale := aLocale
  else
    fUserLocale := DefaultLocale;
  usersLanguage := fUserLocale; //cmowla Weapon Buildings Have "order" instead of "delivers"
  FallbackLocale := LocaleByCode(fUserLocale).FallbackLocale;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 17 - Siege Workshop [Processing Weapon Orders / Siege Unit Creation]
*************************************************************************




=========================================================================
..\src\houses\KM_Houses.pas [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TKMHouse.PickOrder: Byte;
var
  I, resI: Integer;
  ware: TKMWareType;
//  BestBid: Single;
//  TotalLeft: Integer;
//  LeftRatio: array [1..4] of Single;
begin
  Result := 0;

  if WARFARE_ORDER_SEQUENTIAL then
    for I := 0 to 3 do
    begin
      resI := ((fLastOrderProduced + I) mod 4) + 1; //1..4
      ware := gRes.Houses[fType].WareOutput[resI];
      if (WareOrder[resI] > 0) //Player has ordered some of this
      and (CheckWareOut(ware) < MAX_WARES_IN_HOUSE) //Output of this is not full
      //Check we have wares to produce this weapon. If both are the same type check > 1 not > 0
      and ((WARFARE_COSTS[ware,1] <> WARFARE_COSTS[ware,2]) or (CheckWareIn(WARFARE_COSTS[ware,1]) > 1))
      and ((WARFARE_COSTS[ware,1] = wtNone) or (CheckWareIn(WARFARE_COSTS[ware,1]) > 0))
      and ((WARFARE_COSTS[ware,2] = wtNone) or (CheckWareIn(WARFARE_COSTS[ware,2]) > 0)) then
      begin
        Result := resI;
        fLastOrderProduced := resI;
        Break;
      end;
    end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TKMHouse.PickOrder: Byte;
var
  I, resI: Integer;
  ware: TKMWareType;
//  BestBid: Single;
//  TotalLeft: Integer;
//  LeftRatio: array [1..4] of Single;
begin
  Result := 0;

//cmowla siege workshop [weapon order buttons] - This IF statement and the code block below (when the IF is true).
  If (ftype = htSiegeWorkshop) Then begin
    If WARFARE_ORDER_SEQUENTIAL Then
      For I := 0 to 1 do begin
        resI := ((fLastOrderProduced + I) Mod 2) + 1;
        If (WareOrder[resI] > 0) //Player has ordered some of this
        And (CheckWareIn(wtIron) + CheckWareOut(wtIron) = 5)
        And (CheckWareIn(wtTimber) + CheckWareOut(wtTimber) = 5)
        Then begin
          Result := resI;
          fLastOrderProduced := resI;
          Break;
        end;
      end
  end Else begin
    if WARFARE_ORDER_SEQUENTIAL then
      for I := 0 to 3 do
      begin
        resI := ((fLastOrderProduced + I) mod 4) + 1; //1..4
        ware := gRes.Houses[fType].WareOutput[resI];
        if (WareOrder[resI] > 0) //Player has ordered some of this
        and (CheckWareOut(ware) < MAX_WARES_IN_HOUSE) //Output of this is not full
        //Check we have wares to produce this weapon. If both are the same type check > 1 not > 0
        and ((WARFARE_COSTS[ware,1] <> WARFARE_COSTS[ware,2]) or (CheckWareIn(WARFARE_COSTS[ware,1]) > 1))
        and ((WARFARE_COSTS[ware,1] = wtNone) or (CheckWareIn(WARFARE_COSTS[ware,1]) > 0))
        and ((WARFARE_COSTS[ware,2] = wtNone) or (CheckWareIn(WARFARE_COSTS[ware,2]) > 0))
        then
        begin
          Result := resI;
          fLastOrderProduced := resI;
          Break;
        end;
      end;
  end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\res\KM_ResHouses.pas [2 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    ( //Siege workshop
    PlanYX:           ((0,0,0,0), (0,0,0,0), (0,1,1,1), (0,2,1,1));
    NeedsPlayerOrder: True;
    BuildIcon:        324;
    TabletSpriteId:   274;
    Input:            (wtTimber,       wtIron,      wtNone,       wtNone);
    Output:           (wtNone,       wtNone,       wtNone,       wtNone);
    UnlockedByHouse:  htIronSmithy;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    ( //Siege workshop
    PlanYX:           ((0,0,0,0), (0,0,0,0), (0,1,1,1), (0,2,1,1));
    NeedsPlayerOrder: True;
    BuildIcon:        324;
    TabletSpriteId:   274;
    Input:            (wtTimber,       wtIron,      wtNone,       wtNone);

//cmowla siege workshop [weapon selection] (wtCrossbow = utCatapult, wtBow = utBallista)
//Interacts with:
	//"procedure TKMUnitWorkPlan.FindPlan("  in [..\src\units\KM_UnitWorkPlan.pas] and
	//"function TKMTaskMining.Execute" in [..\src\units\tasks\KM_UnitTaskMining.pas].
    Output:           (wtCrossbow,wtBow,wtNone,wtNone);
    UnlockedByHouse:  htIronSmithy;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TKMHouseSpec.IsWorkshop: Boolean;
begin
  Result := fHouseType in [htWeaponSmithy, htArmorSmithy, htWeaponWorkshop, htArmorWorkshop];
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TKMHouseSpec.IsWorkshop: Boolean;
begin
  Result := fHouseType in [htWeaponSmithy, htArmorSmithy, htWeaponWorkshop, htArmorWorkshop, htSiegeWorkshop]; //cmowla siege workshop [KaM economy]
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\units\KM_UnitWorkPlan.pas [1 Item]


procedure TKMUnitWorkPlan.FindPlan(aUnit: TKMUnit; aHome: TKMHouseType; aProduct: TKMWareType; aLoc: TKMPoint; aPlantAct: TKMPlantAct);

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
                      end;
    utBaker:         if aHome = htMill then
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
                      end

						//cmowla siege workshop [weapon selection & time cycle]
						//(wtCrossbow = utCatapult, wtBow = utBallista)
						//Interacts with:
							//"const HOUSE_DAT_X: array [HOUSE_MIN..HOUSE_MAX] of THouseInfo"  in [..\src\res\KM_ResHouses.pas] and
							//"function TKMTaskMining.Execute" in [..\src\units\tasks\KM_UnitTaskMining.pas].
                      else If aHome = htSiegeWorkshop Then begin
                        If (aProduct = wtCrossbow) //See the Siege workshop portion of "HOUSE_DAT_X: array [HOUSE_MIN..HOUSE_MAX] of THouseInfo" in [..\src\res\KM_ResHouses.pas].
                        Then ResourcePlan(wtTimber,5,wtIron,5,wtCrossbow) //Catapult
                        Else ResourcePlan(wtTimber,5,wtIron,5,wtBow);//Ballista
                        SubActAdd(haWork1, siegeWorkshopWorkAnimCnt / High(siegeWorkshopSpritesArray2D[0]) * 1.0); //See "constructor TKMResHouses.Create;" in [..\src\res\KM_ResHouses.pas].
                        fIssued := True;
                      end;

    utBaker:         if aHome = htMill then
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\units\tasks\KM_UnitTaskMining.pas [2 Items]


function TKMTaskMining.Execute: TKMTaskResult;

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  ResAcquired: Boolean;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  ResAcquired: Boolean;
  siegeUnitTrained: TKMUnit; //cmowla siege workshop [weapon creation]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




function TKMTaskMining.Execute: TKMTaskResult; (2)

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            end;

            if ResAcquired then
            begin
              Home.WareAddToOut(WorkPlan.Product1, WorkPlan.ProdCount1);
              Home.WareAddToOut(WorkPlan.Product2, WorkPlan.ProdCount2);
              gHands[fUnit.Owner].Stats.WareProduced(WorkPlan.Product1, WorkPlan.ProdCount1);
              gHands[fUnit.Owner].Stats.WareProduced(WorkPlan.Product2, WorkPlan.ProdCount2);
              gScriptEvents.ProcWareProduced(fUnit.Home, WorkPlan.Product1, WorkPlan.ProdCount1);
              gScriptEvents.ProcWareProduced(fUnit.Home, WorkPlan.Product2, WorkPlan.ProdCount2);
            end;

            Home.SetState(hstIdle);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            end;

            if ResAcquired then
            begin
              Home.WareAddToOut(WorkPlan.Product1, WorkPlan.ProdCount1);
              Home.WareAddToOut(WorkPlan.Product2, WorkPlan.ProdCount2);

            //cmowla siege workshop [weapon creation]
              If Home.HouseType = htSiegeWorkshop Then begin

              //Immediately remove the "dummy resource" (wtCrossbow = utCatapult, wtBow = utBallista) that was produced (so that user cannot see it before it becomes visible)!
              //(And also, that the resource doesn't get counted towards "being produced" in game stats, etc.)
				//Interacts with:
					//"const HOUSE_DAT_X: array [HOUSE_MIN..HOUSE_MAX] of THouseInfo"  in [..\src\res\KM_ResHouses.pas] and
					//"procedure TKMUnitWorkPlan.FindPlan("  in [..\src\units\KM_UnitWorkPlan.pas].

              //(Code retrieved from looking at Actions.TakeWaresFromEx scripting function.)
                If (Home <> nil) And (Home.IsDestroyed = False) Then begin
                  Home.WareTake(WorkPlan.Product1, 1, False); //False is to specify that this was NOT done from a script.

                //Create the siege weapon.
                  If WorkPlan.Product1 = wtCrossbow  //<---wtCrossbow, etc. corresponds with the default "output" resources a house can have (KM_ResHouses).
                  Then siegeUnitTrained := gHands[Home.Owner].TrainUnit(utCatapult, Home)
                  Else siegeUnitTrained := gHands[Home.Owner].TrainUnit(utBallista, Home);

                //Get it to walk (roll) out of the siege workshop.
					//Let it appear that the siege unit is "coming out of the garage"... and not the FRONT DOOR!
					//Unit will be made visible (when it's time) in "procedure TKMUnitActionGoInOut.WalkOut;" in [..\src\units\actions\KM_UnitActionGoInOut.pas].
						siegeUnitTrained.Visible := False;

                  siegeUnitTrained.SetActionGoIn(uaWalk, gdGoOutside, Home);

                //Count this as a soldier equipped in game stats.
                  If Assigned(siegeUnitTrained.OnUnitTrained) Then siegeUnitTrained.OnUnitTrained(siegeUnitTrained);

                end;
              end Else begin
                gHands[fUnit.Owner].Stats.WareProduced(WorkPlan.Product1, WorkPlan.ProdCount1);
                gHands[fUnit.Owner].Stats.WareProduced(WorkPlan.Product2, WorkPlan.ProdCount2);
                gScriptEvents.ProcWareProduced(fUnit.Home, WorkPlan.Product1, WorkPlan.ProdCount1);
                gScriptEvents.ProcWareProduced(fUnit.Home, WorkPlan.Product2, WorkPlan.ProdCount2);
              end;
            end;

            Home.SetState(hstIdle);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\units\KM_UnitWarrior.pas [1 Item]


procedure TKMUnitWarrior.SetActionGoIn(aAction: TKMUnitActionType; aGoDir: TKMGoInDirection; aHouse: TKMHouse);

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  Assert((aHouse.HouseType = htBarracks) or (aHouse.HouseType = htTownHall), 'Only Barracks and TownHall so far');
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  Assert(aHouse.HouseType in [htBarracks, htTownHall, htSiegeWorkshop], 'In Barracks, TownHall, and Siege workshop only!'); //cmowla siege workshop [weapon creation]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\units\actions\KM_UnitActionGoInOut.pas [1 Item]




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMUnitActionGoInOut.WalkOut;
begin
  fUnit.Direction := KMGetDirection(fDoor, fStreet);
  fUnit.PositionNext := fStreet;
  gTerrain.UnitAdd(fUnit.PositionNext, fUnit); //Unit was not occupying tile while inside
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMUnitActionGoInOut.WalkOut;
begin

//cmowla siege workshop [weapon creation] - Helps to make it "appear" that siege unit is coming out of the "garage".
  If (fHouse.HouseType = htSiegeWorkshop)
  And (fUnit.UnitType in SIEGE_UNITS)
  Then fUnit.Visible := True;

  fUnit.Direction := KMGetDirection(fDoor, fStreet);
  fUnit.PositionNext := fStreet;
  gTerrain.UnitAdd(fUnit.PositionNext, fUnit); //Unit was not occupying tile while inside
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 18 - Siege Workshop [Working Animiation & Sound]
*************************************************************************




=========================================================================
..\src\res\KM_ResHouses.pas [3 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
unit KM_ResHouses;
{$I KaM_Remake.inc}
interface
uses
  Classes, Math, SysUtils,
  KM_CommonClasses, KM_CommonTypes, KM_Defaults,
  KM_ResTypes;

const
  HOUSE_MIN = htArmorSmithy;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
unit KM_ResHouses;
{$I KaM_Remake.inc}
interface
uses
  Classes, Math, SysUtils,
  KM_CommonClasses, KM_CommonTypes, KM_Defaults,
  KM_ResTypes;

//cmowla siege workshop [time cycle, sprites, sound effects]
  Var siegeWorkshopWorkAnimCnt: Word; //Put here for [..\src\units\KM_UnitWorkPlan.pas] to be able to access it for sprite execution AND building time run cycle.
      siegeWorkshopFrames: Array of SmallInt; //Here for [..\src\houses\KM_Houses.pas] to be able to access it for sounds.
      siegeWorkshopSpritesArray2D: Array[0..26] of Array of SmallInt; //No particular reason that this is here except to be "grouped with" the above two.

const
  HOUSE_MIN = htArmorSmithy;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




constructor TKMResHouses.Create; (1)

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
var
  H: TKMHouseType;
  I: Integer;
begin
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
var
  H: TKMHouseType;
  I: Integer;
  j, counter: Integer; //cmowla siege workshop [sprites]
begin
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




constructor TKMResHouses.Create; (2)

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  fMarketBeastAnim[2].MoveY := MARKET_WARES_OFF_Y;

  //ExportCSV(ExeDir+'Houses.csv');
end;


destructor TKMResHouses.Destroy;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  fMarketBeastAnim[2].MoveY := MARKET_WARES_OFF_Y;

//cmowla siege workshop [time cycle] (and sprites)
//No particular reason that all but the last subarray of this 2D array have a length of 30.
//0s are a part of first and last (and 2nd-to-last) subarrays to represent delays from when the carpenter disappears to when he appears idle (and siege unit comes out), etc.
  siegeWorkshopSpritesArray2D[0] := [0,0,1695,1695,1695,1693,1691,1691,1691,1692,1693,1694,1695,1695,1695,1693,1691,1691,1692,1693,1694,1695,1695,1695,1693,1691,1691,1692,1693,1694];
  siegeWorkshopSpritesArray2D[1] := [1695,1696,1697,1698,1699,1700,1701,1702,1703,1704,1705,1706,1707,1708,1709,1710,1709,1707,1705,1706,1705,1706,1706,1707,1708,1709,1710,1710,1709,1707];
  siegeWorkshopSpritesArray2D[2] := [1705,1706,1705,1705,1706,1707,1708,1709,1710,1709,1707,1705,1706,1705,1706,1707,1708,1709,1710,1709,1707,1705,1706,1704,1703,1702,1701,1700,1699,1698];
  siegeWorkshopSpritesArray2D[3] := [1697,1695,1695,1695,1693,1691,1692,1692,1692,1693,1694,1695,1695,1695,1693,1691,1691,1692,1693,1694,1695,1695,1695,1693,1691,1691,1692,1693,1694,1695];
  siegeWorkshopSpritesArray2D[4] := [1696,1697,1698,1699,1700,1701,1702,1703,1704,1705,1706,1707,1708,1709,1710,1709,1707,1705,1706,1705,1706,1706,1707,1708,1709,1710,1710,1709,1707,1705];
  siegeWorkshopSpritesArray2D[5] := [1706,1705,1705,1706,1707,1708,1709,1710,1709,1707,1705,1706,1705,1706,1707,1708,1709,1710,1709,1707,1705,1706,1704,1703,1702,1701,1700,1699,1698,1697];
  siegeWorkshopSpritesArray2D[6] := [1695,1695,1695,1693,1691,1692,1692,1692,1693,1694,1695,1695,1695,1693,1691,1691,1692,1693,1694,1695,1695,1695,1693,1691,1691,1692,1693,1694,1695,1696];
  siegeWorkshopSpritesArray2D[7] := [1697,1698,1699,1700,1701,1702,1703,1704,1705,1706,1707,1708,1709,1710,1709,1707,1705,1706,1705,1706,1706,1707,1708,1709,1710,1710,1709,1707,1705,1706];
  siegeWorkshopSpritesArray2D[8] := [1705,1705,1706,1707,1708,1709,1710,1709,1707,1705,1706,1705,1706,1707,1708,1709,1710,1709,1707,1705,1706,1704,1703,1702,1701,1700,1699,1698,1697,1695];
  siegeWorkshopSpritesArray2D[9] := [1695,1695,1693,1691,1692,1692,1692,1693,1694,1695,1695,1695,1693,1691,1691,1692,1693,1694,1695,1695,1695,1693,1691,1691,1692,1693,1694,1695,1696,1697];
  siegeWorkshopSpritesArray2D[10] := [1698,1699,1700,1701,1702,1703,1704,1705,1706,1707,1708,1709,1710,1709,1707,1705,1706,1705,1706,1706,1707,1708,1709,1710,1710,1709,1707,1705,1706,1705];
  siegeWorkshopSpritesArray2D[11] := [1705,1706,1707,1708,1709,1710,1709,1707,1705,1706,1705,1706,1707,1708,1709,1710,1709,1707,1705,1706,1704,1703,1702,1701,1700,1699,1698,1697,1695,1695];
  siegeWorkshopSpritesArray2D[12] := [1695,1693,1691,1692,1692,1692,1693,1694,1695,1695,1695,1693,1691,1691,1692,1693,1694,1695,1695,1695,1693,1691,1691,1692,1693,1694,1695,1696,1697,1698];
  siegeWorkshopSpritesArray2D[13] := [1699,1700,1701,1702,1703,1704,1705,1706,1707,1708,1709,1710,1709,1707,1705,1706,1705,1706,1706,1707,1708,1709,1710,1710,1709,1707,1705,1706,1705,1705];
  siegeWorkshopSpritesArray2D[14] := [1706,1707,1708,1709,1710,1709,1707,1705,1706,1705,1706,1707,1708,1709,1710,1709,1707,1705,1706,1704,1703,1702,1701,1700,1699,1698,1697,1695,1695,1695];
  siegeWorkshopSpritesArray2D[15] := [1693,1691,1692,1692,1692,1693,1694,1695,1695,1695,1693,1691,1691,1692,1693,1694,1695,1695,1695,1693,1691,1691,1692,1693,1694,1695,1696,1697,1698,1699];
  siegeWorkshopSpritesArray2D[16] := [1700,1701,1702,1703,1704,1705,1706,1707,1708,1709,1710,1709,1707,1705,1706,1705,1706,1706,1707,1708,1709,1710,1710,1709,1707,1705,1706,1705,1705,1706];
  siegeWorkshopSpritesArray2D[17] := [1707,1708,1709,1710,1709,1707,1705,1706,1705,1706,1707,1708,1709,1710,1709,1707,1705,1706,1704,1703,1702,1701,1700,1699,1698,1697,1695,1695,1695,1693];
  siegeWorkshopSpritesArray2D[18] := [1691,1692,1692,1692,1693,1694,1695,1695,1695,1693,1691,1691,1692,1693,1694,1695,1695,1695,1693,1691,1691,1692,1693,1694,1695,1696,1697,1698,1699,1700];
  siegeWorkshopSpritesArray2D[19] := [1701,1702,1703,1704,1705,1706,1707,1708,1709,1710,1709,1707,1705,1706,1705,1706,1706,1707,1708,1709,1710,1710,1709,1707,1705,1706,1705,1705,1706,1707];
  siegeWorkshopSpritesArray2D[20] := [1708,1709,1710,1709,1707,1705,1706,1705,1706,1707,1708,1709,1710,1709,1707,1705,1706,1704,1703,1702,1701,1700,1699,1698,1697,1695,1695,1695,1693,1691];
  siegeWorkshopSpritesArray2D[21] := [1692,1692,1692,1693,1694,1695,1695,1695,1693,1691,1691,1692,1693,1694,1695,1695,1695,1693,1691,1691,1692,1693,1694,1695,1696,1697,1698,1699,1700,1701];
  siegeWorkshopSpritesArray2D[22] := [1702,1703,1704,1705,1706,1707,1708,1709,1710,1709,1707,1705,1706,1705,1706,1706,1707,1708,1709,1710,1710,1709,1707,1705,1706,1705,1705,1706,1707,1708];
  siegeWorkshopSpritesArray2D[23] := [1709,1710,1709,1707,1705,1706,1705,1706,1707,1708,1709,1710,1709,1707,1705,1706,1704,1703,1702,1701,1700,1699,1698,1697,1695,1695,1695,1693,1691,1692];
  siegeWorkshopSpritesArray2D[24] := [1692,1692,1693,1694,1695,1695,1695,1693,1691,1691,1692,1693,1694,1695,1695,1695,1693,1691,1691,1692,1693,1694,1695,1696,1697,1698,1699,1700,1701,1702];
  siegeWorkshopSpritesArray2D[25] := [1703,1704,1705,1706,1707,1708,1709,1710,1709,1707,1705,1706,1705,1706,1707,1708,1709,1710,1710,1709,1707,0,0,0,0,0,0,0,0,0];
  siegeWorkshopSpritesArray2D[26] := [0,0,0,0,0,0,0,0,0,0];

  fItems[htSiegeWorkshop].fHouseDat.Anim[haWork1].Count := Length(siegeWorkshopSpritesArray2D[0]);
  For i := 0 to High(siegeWorkshopSpritesArray2D) do For j := 0 to High(siegeWorkshopSpritesArray2D[i]) do Inc(siegeWorkshopWorkAnimCnt);
  SetLength(siegeWorkshopFrames, siegeWorkshopWorkAnimCnt);
  For i := 0 to High(siegeWorkshopSpritesArray2D) do
    For j := 0 to High(siegeWorkshopSpritesArray2D[i]) do begin
      siegeWorkshopFrames[counter] := siegeWorkshopSpritesArray2D[i][j];
      Inc(counter);
    end;

  //ExportCSV(ExeDir+'Houses.csv');
end;


destructor TKMResHouses.Destroy;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\render\KM_RenderPool.pas [1 Item]


procedure TKMRenderPool.AddHouseWork(aHouse: TKMHouseType; const aLoc: TKMPoint; aActSet: TKMHouseActionSet; aAnimStep, aAnimStepPrev: Cardinal; aFlagColor: TColor4; aDoImmediateRender: Boolean = False; aDoHighlight: Boolean = False; aHighlightColor: TColor4 = 0);

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        id := gRes.Interpolation.House(aHouse, AT, gTerrain.AnimStep, gGameParams.TickFrac)
      else
      begin
        //If the anim step is able to be interpolated from the last frame (to avoid incorrect looping)
        if aAnimStep = aAnimStepPrev+1 then
          id := gRes.Interpolation.House(aHouse, AT, aAnimStepPrev, gGameParams.TickFrac)
        else
          id := A.Step[aAnimStep mod Byte(A.Count) + 1] + 1;
      end;

      cornerX := aLoc.X + (rxData.Pivot[id].X + A.MoveX) / CELL_SIZE_PX - 1;
      cornerY := aLoc.Y + (rxData.Pivot[id].Y + A.MoveY + rxData.Size[id].Y) / CELL_SIZE_PX - 1
                       - gTerrain.LandExt^[aLoc.Y + 1, aLoc.X].RenderHeight / CELL_HEIGHT_DIV;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        id := gRes.Interpolation.House(aHouse, AT, gTerrain.AnimStep, gGameParams.TickFrac)
      else
      begin
      //If the anim step is able to be interpolated from the last frame (to avoid incorrect looping)

      //cmowla siege workshop [sprites]
        If (AT = haWork1) And (aHouse = htSiegeWorkshop) Then begin
          If aAnimStep < siegeWorkshopWorkAnimCnt
          Then id := siegeWorkshopFrames[aAnimStep]
          Else If aAnimStep < siegeWorkshopWorkAnimCnt + 12 Then id := 0 Else id := 1685;
        end Else begin
          if aAnimStep = aAnimStepPrev + 1
          then id := gRes.Interpolation.House(aHouse, AT, aAnimStepPrev, gGameParams.TickFrac)
          else id := A.Step[aAnimStep mod Byte(A.Count) + 1] + 1;
        end;
      end;

      cornerX := aLoc.X + (rxData.Pivot[id].X + A.MoveX) / CELL_SIZE_PX - 1;
      cornerY := aLoc.Y + (rxData.Pivot[id].Y + A.MoveY + rxData.Size[id].Y) / CELL_SIZE_PX - 1
                       - gTerrain.LandExt^[aLoc.Y + 1, aLoc.X].RenderHeight / CELL_HEIGHT_DIV;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\houses\KM_Houses.pas [1 Item]

procedure TKMHouse.MakeSound;

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    htSwine:         if ((work = haWork2)and(step in [10,20]))or((work = haWork3)and(step = 1)) then gSoundPlayer.Play(sfxButcherCut, fPosition);
    //htWatchTower:  Sound handled by projectile itself
  end;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    htSwine:         if ((work = haWork2)and(step in [10,20]))or((work = haWork3)and(step = 1)) then gSoundPlayer.Play(sfxButcherCut, fPosition);
    //htWatchTower:  Sound handled by projectile itself
    htSiegeWorkshop:    If (WorkAnimStep > 0) And (WorkAnimStep < siegeWorkshopWorkAnimCnt) Then //cmowla siege workshop [sound effects]
                          If (siegeWorkshopFrames[WorkAnimStep - 1 + 1] = 1695)
                          And (siegeWorkshopFrames[WorkAnimStep + 1] = 1693)
                          And (siegeWorkshopFrames[WorkAnimStep + 1 + 1] = 1691)
                          Then gSoundPlayer.Play(sfxsaw, fPosition)
                          Else If (siegeWorkshopFrames[WorkAnimStep - 1] = 1707)
                               And (siegeWorkshopFrames[WorkAnimStep] = 1705)
                               And (siegeWorkshopFrames[WorkAnimStep + 1] = 1706)
                               Then gSoundPlayer.Play(sfxCarpenterHammer, fPosition);
  end;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 19 - Siege Workshop [Map Editor Building Selection Panel / GUI]
*************************************************************************




=========================================================================
..\src\gui\pages_maped\KM_GUIMapEdHouse.pas [1 Item]


procedure TKMMapEdHouse.ShowCommonResources;

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      Label_House_Input.Show;
    end
    else
      ResRow_Ware_Input[I].Hide;
  end;

  Label_House_Output.Hide;
  for I := 0 to 3 do
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      Label_House_Input.Show;
    end
    else
      ResRow_Ware_Input[I].Hide;
  end;

  Label_House_Output.Hide;

//cmowla siege workshop [Map Editor Support] - Hides the Order rows, as it's hidden for the schoolhouse and town hall (buildings that train units directly).
  If fHouse.HouseType = htSiegeWorkshop then begin
    For I := 0 to 3 do ResRow_Ware_Output[I].Hide;
    Exit;
  end;

  for I := 0 to 3 do
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 20 - Siege Workshop [Classical AI Support]
*************************************************************************




=========================================================================
..\src\ai\KM_AIMayor.pas [2 Items]


procedure TKMayor.CheckWeaponOrderCount; (1)

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
var
  I,K: Integer;
  H: TKMHouse;
  WareOrder: Integer;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
var
  I,K: Integer;
  H: TKMHouse;
  WareOrder: Integer;
  carpenter: TKMUnit;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




procedure TKMayor.CheckWeaponOrderCount; (2)

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      htWeaponWorkshop:  for K := 1 to 4 do
                            if gRes.Houses[H.HouseType].WareOutput[K] = wtAxe then
                              H.WareOrder[K] := Round(WarfareRatios[wtAxe] * PORTIONS)
                            else
                            if gRes.Houses[H.HouseType].WareOutput[K] = wtLance then
                              H.WareOrder[K] := Round(WarfareRatios[wtLance] * PORTIONS)
                            else
                            if gRes.Houses[H.HouseType].WareOutput[K] = wtBow then
                              H.WareOrder[K] := Round(WarfareRatios[wtBow] * PORTIONS);
    end;
  end;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      htWeaponWorkshop:  for K := 1 to 4 do
                            if gRes.Houses[H.HouseType].WareOutput[K] = wtAxe then
                              H.WareOrder[K] := Round(WarfareRatios[wtAxe] * PORTIONS)
                            else
                            if gRes.Houses[H.HouseType].WareOutput[K] = wtLance then
                              H.WareOrder[K] := Round(WarfareRatios[wtLance] * PORTIONS)
                            else
                            if gRes.Houses[H.HouseType].WareOutput[K] = wtBow then
                              H.WareOrder[K] := Round(WarfareRatios[wtBow] * PORTIONS);

//cmowla siege workshop [Classical AI Support]
      htSiegeWorkshop: begin
                          If H.HasWorker Then begin
                            carpenter := H.Worker;
                            If carpenter.isIdle Then begin
                              If Not gHands[fOwner].Locks.GetUnitBlocked(utCatapult) //If unit is not blocked in map editor,
                              Then H.WareOrder[1] := Max(0, Trunc((MAX_CATAPULTS_CLASSICAL_AI - gHands[fOwner].Stats.GetUnitQty(utCatapult)) /  gHands[fOwner].Stats.GetHouseQty(htSiegeWorkshop))); //Max of MAX_CATAPULTS_CLASSICAL_AI catapults "alive" at any given time

                              If Not gHands[fOwner].Locks.GetUnitBlocked(utBallista) //If unit is not blocked in map editor,
                              Then H.WareOrder[2] := Max(0, Trunc((MAX_BALLISTAS_CLASSICAL_AI - gHands[fOwner].Stats.GetUnitQty(utBallista)) / gHands[fOwner].Stats.GetHouseQty(htSiegeWorkshop))); //Max of MAX_BALLISTAS_CLASSICAL_AI ballistas "alive" at any given time.
                            end;
                          end;
      end;
    end;
  end;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\ai\KM_AICityPlanner.pas [1 Item]


function TKMCityPlanner.FindPlaceForHouse(aHouse: TKMHouseType; out aLoc: TKMPoint): Boolean;

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    htWeaponSmithy:    Result := NextToHouse(aHouse, [htIronSmithy, htCoalMine, htBarracks], [], aLoc);
    htWeaponWorkshop:  Result := NextToHouse(aHouse, [htSawmill, htBarracks], [], aLoc);

    htCoalMine:      Result := NextToOre(aHouse, wtCoal, aLoc);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    htWeaponSmithy:    Result := NextToHouse(aHouse, [htIronSmithy, htCoalMine, htBarracks], [], aLoc);
    htWeaponWorkshop:  Result := NextToHouse(aHouse, [htSawmill, htBarracks], [], aLoc);
    htSiegeWorkshop:  Result := NextToHouse(aHouse, [htSawmill, htIronSmithy], [], aLoc); //cmowla siege workshop [Classical AI Support] - siege workshop location

    htCoalMine:      Result := NextToOre(aHouse, wtCoal, aLoc);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\ai\KM_AIMayorBalance.pas [1 Item]


procedure TKMayorBalance.AppendWeaponry;

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    wtHorse:       with fWarfare.Horse do
                    case PickMin([FarmTheory, StablesTheory]) of
                      0: Append(htFarm);
                      1: Append(htStables);
                    end;
  end;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    wtHorse:       with fWarfare.Horse do
                    case PickMin([FarmTheory, StablesTheory]) of
                      0: Append(htFarm);
                      1: Append(htStables);
                    end;
  end;

  //cmowla siege workshop [Classical AI Support] - build extra iron mine (if possible) and the siege workshop.
    If HouseCount(htSiegeWorkshop) < MAX_SIEGEWORKSHOPS_CLASSICAL_AI Then begin
	  with fWarfare.SteelArmor do case PickMin([IronTheory]) of 0: Append(htIronMine) end;
	  Append(htSiegeWorkshop);
    end;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\hands\KM_Hand.pas [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TKMHand.FindCityCenter: TKMPoint;
const
  IMPORTANT_HOUSES: array[0..4] of TKMHouseType = (htStore, htInn, htSchool, htBarracks, htTownhall);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TKMHand.FindCityCenter: TKMPoint;
const
  IMPORTANT_HOUSES: array[0..5] of TKMHouseType = (htStore, htInn, htSchool, htBarracks, htTownhall, htSiegeWorkshop); //cmowla siege workshop [Classical AI support] - Identifying enemies
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\navmesh\KM_NavMeshInfluences.pas [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  function PlayerActive(aPL: TKMHandID): Boolean;
  const
    TARGET_HOUSES: TKMHouseTypeSet = [htBarracks, htStore, htSchool, htTownhall];
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  function PlayerActive(aPL: TKMHandID): Boolean;
  const
    TARGET_HOUSES: TKMHouseTypeSet = [htBarracks, htStore, htSchool, htTownhall, htSiegeWorkshop]; //cmowla siege workshop [Classical AI support] - Identifying enemies
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 21 - Siege Workshop [Advanced AI Support]
*************************************************************************
//Process orders and build up to max siege workshops (if they are healthy).  Will REBUILD destroyed siege workshops (if destroyed by enemies).



=========================================================================
..\src\ai\newAI\KM_CityManagement.pas [3 Items]


procedure TKMCityManagement.OrderWeapons(); (1)

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMCityManagement.OrderWeapons();
const
  WEAPONS_PER_A_UPDATE = 25;
  PRODUCTION_HOUSES = [htArmorSmithy, htArmorWorkshop, htWeaponSmithy, htWeaponWorkshop];
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMCityManagement.OrderWeapons();
const
  WEAPONS_PER_A_UPDATE = 25;
  PRODUCTION_HOUSES = [htArmorSmithy, htArmorWorkshop, htWeaponSmithy, htWeaponWorkshop, htSiegeWorkshop]; //cmowla siege workshop [Advanced AI Support] - weapon orders
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




procedure TKMCityManagement.OrderWeapons(); (2)

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  H: TKMHouse;
begin
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  H: TKMHouse;
  carpenter: TKMUnit;
begin
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




procedure TKMCityManagement.OrderWeapons(); (3)

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
          if (H.HouseType <> HT) then
            Continue;
          for K := 1 to 4 do
            H.WareOrder[K] := 0;
          H.WareOrder[MaxIdx] := WEAPONS_PER_A_UPDATE; // With update each 1-2 minutes there is not need to calculate something more
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
          if (H.HouseType <> HT) then
            Continue;

        //cmowla siege workshop [Advanced AI Support] - weapon order
          if (HT = htSiegeWorkshop) then begin
            If H.HasWorker Then begin
              carpenter := H.Worker;
              If carpenter.isIdle Then begin
                If Not gMySpectator.Hand.Locks.GetUnitBlocked(utCatapult) //If unit is not blocked in map editor,
                Then H.WareOrder[1] := Max(0, Trunc((MAX_CATAPULTS_ADVANCED_AI - gHands[fOwner].Stats.GetUnitQty(utCatapult)) / gHands[fOwner].Stats.GetHouseQty(htSiegeWorkshop))); //Max of MAX_CATAPULTS_ADVANCED_AI catapults "alive" at any given time

                If Not gMySpectator.Hand.Locks.GetUnitBlocked(utBallista) //If unit is not blocked in map editor,
                Then H.WareOrder[2] := Max(0, Trunc((MAX_BALLISTAS_ADVANCED_AI - gHands[fOwner].Stats.GetUnitQty(utBallista)) / gHands[fOwner].Stats.GetHouseQty(htSiegeWorkshop))); //Max of MAX_BALLISTAS_ADVANCED_AI ballistas "alive" at any given time.
              end;
            end;
          end Else begin
			for K := 1 to 4 do H.WareOrder[K] := 0;
			H.WareOrder[MaxIdx] := WEAPONS_PER_A_UPDATE; // With update each 1-2 minutes there is not need to calculate something more
		  end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\hands\KM_Hand.pas


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMHand.AddHousePlan(aHouseType: TKMHouseType; const aLoc: TKMPoint);
var
  loc: TKMPoint;
begin
  loc.X := aLoc.X - gRes.Houses[aHouseType].EntranceOffsetX;
  loc.Y := aLoc.Y;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMHand.AddHousePlan(aHouseType: TKMHouseType; const aLoc: TKMPoint);
var
  loc: TKMPoint;
begin
  loc.X := aLoc.X - gRes.Houses[aHouseType].EntranceOffsetX;
  loc.Y := aLoc.Y;

//cmowla siege workshop [Advanced AI Support] - Place siege workshop house plan.
  If IsComputer And fAI.Setup.NewAI //Player is Advanced AI
  And (aHouseType = htSiegeWorkshop)
  Then begin
    If (fStats.GetHouseQty(htSiegeWorkshop) >= MAX_SIEGEWORKSHOPS_ADVANCED_AI) Then Exit;
    If (fStats.HouseInitialCount(htSiegeWorkshop) + fStats.HousePlannedCount(htSiegeWorkshop) - fStats.HouseLostCount(htSiegeWorkshop) >= MAX_SIEGEWORKSHOPS_ADVANCED_AI)
    Then Exit;
  end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\hands\KM_HandStats.pas [3 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function GetHousePlans(aType: TKMHouseType): Integer; overload;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function GetHousePlans(aType: TKMHouseType): Integer; overload;

  //cmowla siege workshop [Advanced AI Support] - Place siege workshop house plan.
    function HouseInitialCount(HT: TKMHouseType): Integer;
    function HousePlannedCount(HT: TKMHouseType): Integer;
    function HouseLostCount(HT: TKMHouseType): Integer;
    function AdvancedAICanBuildSiegeWorkshop: Boolean;
    procedure ChangeInitialWareAmount(aWare: TKMWareType; aCount: Cardinal); //cmowla Advanced AI Support - Give Food At Mission Start
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//How many houses are planned in progress and ready
function TKMHandStats.GetHouseTotal(aType: TKMHouseType): Integer;
begin
  Result := GetHouseQty(aType) + GetHouseWip(aType);
end;

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//How many houses are planned in progress and ready
function TKMHandStats.GetHouseTotal(aType: TKMHouseType): Integer;
begin
  Result := GetHouseQty(aType) + GetHouseWip(aType);
end;


//cmowla siege workshop [Advanced AI Support] - Place siege workshop house plan.
  function TKMHandStats.HouseInitialCount(HT: TKMHouseType): Integer;
  begin
    Result := Houses[HT].Initial;
  end;

  function TKMHandStats.HousePlannedCount(HT: TKMHouseType): Integer;
  begin
    Result := Houses[HT].Planned;
  end;

  function TKMHandStats.HouseLostCount(HT: TKMHouseType): Integer;
  begin
    Result := Houses[HT].Lost;
  end;

  function TKMHandStats.AdvancedAICanBuildSiegeWorkshop: Boolean;
  begin
    If Houses[htSiegeWorkshop].Initial + Houses[htSiegeWorkshop].Planned - Houses[htSiegeWorkshop].Lost >= MAX_SIEGEWORKSHOPS_ADVANCED_AI
    Then Result := False
    Else Result := True;
  end;

  procedure TKMHandStats.ChangeInitialWareAmount(aWare: TKMWareType; aCount: Cardinal);
  begin //cmowla Advanced AI Support - Give Food At Mission Start
    Wares[aWare].Initial := aCount;
  end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\ai\newAI\KM_CityBuilder.pas [1 Item]


function SelectHouse(const aSetOfWare: TSetOfWare): Boolean;

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      HT := PRODUCTION_WARE2HOUSE[ WareOrder[K] ];
      if (RequiredHouses[HT] <= 0) then // wtLeather and wtPig require the same building so avoid to place 2 houses at once
        Continue;
      // Farms and wineyards should be placed ASAP because fields may change evaluation of terrain and change tpBuild status of surrouding tiles!
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      HT := PRODUCTION_WARE2HOUSE[ WareOrder[K] ];
      if (RequiredHouses[HT] <= 0) then // wtLeather and wtPig require the same building so avoid to place 2 houses at once
        Continue;

  //cmowla siege workshop [Advanced AI Support] - Place siege workshop house plan.
      If (aTick >= 600 * MIN_SIEGE_WORKSHOP_BUILD_MINUTE) //It's MIN_SIEGE_WORKSHOP_BUILD_MINUTE minutes or later,
      And gHands[fOwner].Stats.AdvancedAICanBuildSiegeWorkshop //Advanced AI does multiple plans for 1 siege workshop (Houses[htSiegeWorkshop].Planned), so we must prevent that (and use it to determine if AAI needs to build SWs or not).
      Then HT := htSiegeWorkshop;

      // Farms and wineyards should be placed ASAP because fields may change evaluation of terrain and change tpBuild status of surrouding tiles!
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\ai\newAI\KM_Supervisor.pas [2 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TKMSupervisor.HasAssets(aPL: TKMHandID; aIncludeArmy: Boolean = True): Boolean;
const
  HOUSE_TYPES: array of TKMHouseType = [htBarracks, htStore, htSchool, htTownhall];
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TKMSupervisor.HasAssets(aPL: TKMHandID; aIncludeArmy: Boolean = True): Boolean;
const
  HOUSE_TYPES: array of TKMHouseType = [htBarracks, htStore, htSchool, htTownhall, htSiegeWorkshop]; //cmowla siege workshop [Advanced AI Support] - Identifying enemies
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  function FindTargetAssets(aTeamIdx: Byte; var aTargetSoldiers: Boolean; var aPolygons: TKMWordArray): Integer;
  const
    SCANNED_HOUSES = [htStore, htSchool, htBarracks, htTownhall];
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  function FindTargetAssets(aTeamIdx: Byte; var aTargetSoldiers: Boolean; var aPolygons: TKMWordArray): Integer;
  const
    SCANNED_HOUSES = [htStore, htSchool, htBarracks, htTownhall, htSiegeWorkshop]; //cmowla siege workshop [Advanced AI Support] - Identifying enemies
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\ai\newAI\KM_Eye.pas [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TKMEye.GetCityCenterPoints(aMultiplePoints: Boolean = False): TKMPointArray;
const
  SCANNED_HOUSES = [htStore, htSchool, htBarracks, htTownhall];
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TKMEye.GetCityCenterPoints(aMultiplePoints: Boolean = False): TKMPointArray;
const
  SCANNED_HOUSES = [htStore, htSchool, htBarracks, htTownhall, htSiegeWorkshop]; //cmowla siege workshop [Advanced AI Support] - Identifying enemies
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\ai\newAI\KM_ArmyAttackNew.pas [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
const
  // Houses in TARGET_HOUSES will be selected as a primary target (so the company will come to this point but it will not attack it because of this list)
  TARGET_HOUSES: TKMHouseTypeSet = [htBarracks, htStore, htSchool, htTownhall];
  // Houses in SCAN_HOUSES will be destroyed when they are in radius (it should also contain TARGET_HOUSES)
  SCAN_HOUSES: TKMHouseTypeSet = [htWatchTower, htBarracks, htStore, htSchool, htTownhall];
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
const
  // Houses in TARGET_HOUSES will be selected as a primary target (so the company will come to this point but it will not attack it because of this list)
  TARGET_HOUSES: TKMHouseTypeSet = [htBarracks, htStore, htSchool, htTownhall, htSiegeWorkshop]; //cmowla siege workshop [Advanced AI Support] - Identifying enemies
  // Houses in SCAN_HOUSES will be destroyed when they are in radius (it should also contain TARGET_HOUSES)
  SCAN_HOUSES: TKMHouseTypeSet = [htWatchTower, htBarracks, htStore, htSchool, htTownhall, htSiegeWorkshop]; //cmowla siege workshop [Advanced AI Support] - Identifying enemies
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\ai\newAI\KM_ArmyManagement.pas [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
const
  ARMY_VECTOR_SCAN_HOUSES_DEF: TKMHouseTypeSet = [htBarracks, htStore, htSchool, htTownhall];
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  ARMY_VECTOR_SCAN_HOUSES_DEF: TKMHouseTypeSet = [htBarracks, htStore, htSchool, htTownhall, htSiegeWorkshop]; //cmowla siege workshop [Advanced AI Support] - Identifying enemies
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 22 - Siege Workshop [Game Win Condition Support]
*************************************************************************




=========================================================================
..\src\mission\KM_MapTypes.pas [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  GOAL_BUILDINGS_HOUSES: array[0..3] of TKMHouseType = (htStore, htSchool, htBarracks, htTownHall);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  GOAL_BUILDINGS_HOUSES: array[0..4] of TKMHouseType = (htStore, htSchool, htBarracks, htTownHall, htSiegeWorkshop);  //cmowla siege workshop [important building]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 23 - Lower Catapult Shoot Sound's Volume
*************************************************************************




=========================================================================
..\src\KM_Projectiles.pas [1 Item]

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (gMySpectator.FogOfWar.CheckTileRevelation(KMPointRound(aStart).X, KMPointRound(aStart).Y) >= 255) then
    gSoundPlayer.Play(PROJECTILE_LAUNCH_SOUND[aProjType], aStart);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (gMySpectator.FogOfWar.CheckTileRevelation(KMPointRound(aStart).X, KMPointRound(aStart).Y) >= 255) then
    If aProjType = ptCatapultRock
    Then gSoundPlayer.Play(PROJECTILE_LAUNCH_SOUND[aProjType], aStart, True, 0.5) //cmowla sound effects (play catapult shoot sound at 50% max volume.  (Too loud!)
    Else gSoundPlayer.Play(PROJECTILE_LAUNCH_SOUND[aProjType], aStart);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 25 - Make Warrior (Metal Barbarian) an Iron-Armored Troop (and cost 10 gold) AND add Militia to Town Hall (and cost 3 gold)
*************************************************************************




=========================================================================
..\src\ai\newAI\KM_Supervisor.pas [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//cmowla (Add in New Unit)
  WarriorPrice: array [WARRIOR_MIN..WARRIOR_MAX] of Single = ( //<--Notice this!
    1.0,2.0,3.0,2.0,3.0, // utMilitia,utAxeFighter,utSwordsman,utBowman,utArbaletman,
    2.0,3.0,2.0,3.0,     // utPikeman,utHallebardman,utHorseScout,utCavalry
    3.5,1.0,1.0,3.5,1.0,6,6 // utBarbarian,utPeasant,utSlingshot,utMetalBarbarian,utHorseman
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//cmowla (Add in New Unit)
  WarriorPrice: array [WARRIOR_MIN..WARRIOR_MAX] of Single = ( //<--Notice this!
    1.0,2.0,3.0,2.0,3.0, // utMilitia,utAxeFighter,utSwordsman,utBowman,utArbaletman,
    2.0,3.0,2.0,3.0,     // utPikeman,utHallebardman,utHorseScout,utCavalry
    3.5,1.0,1.0,4,1.0,6,6 // utBarbarian,utPeasant,utSlingshot,utMetalBarbarian,utHorseman  //cmowla town hall changes
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\common\KM_Defaults.pas [2 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    5.3, 2.1        // utMetalBarbarian, utHorseman  //cmowla town hall changes
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    6.3, 2.1        // utMetalBarbarian, utHorseman  //cmowla town hall changes
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  GAME_VERSION_POSTFIX := GAME_VERSION_POSTFIX + ' Siege Unit Mod (by cmowla)';   //cmowla Game Setup
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  GAME_VERSION_POSTFIX := GAME_VERSION_POSTFIX + ' Siege Unit/TH Mod (by cmowla)';   //cmowla Game Setup   //cmowla town hall changes
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\gui\KM_InterfaceGame.pas [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  TownHall_Order: array [0..4] of TKMUnitType = (
    utRebel, utRogue, utVagabond, utBarbarian, utWarrior);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  TownHall_Order: array [0..5] of TKMUnitType = (utRebel, utMilitia, utRogue, utVagabond, utBarbarian, utWarrior); //cmowla town hall changes
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\res\KM_ResUnits.pas [3 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  TH_TROOP_COST: array[0..4] of Byte;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  TH_TROOP_COST: array[0..5] of Byte; //cmowla town hall changes
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  TH_DEFAULT_TROOP_COST: array[0..4] of Byte = (2, 3, 5, 8, 8); //rebel / rogue / vagabond / barbarian / warrior
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  TH_DEFAULT_TROOP_COST: array[0..5] of Byte = (2, 3, 3, 5, 8, 10); //rebel / militia / rogue / vagabond / barbarian / warrior //cmowla town hall changes
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




constructor TKMResUnits.Create;

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  for UT := UNIT_MIN to UNIT_MAX do
  begin
    fItems[UT].fUnitSpecInfo.StepsPerTile          := Round(1    / fItems[UT].Speed);
    fItems[UT].fUnitSpecInfo.StepsPerTileDiag      := Round(1.41 / fItems[UT].Speed);
    fItems[UT].fUnitSpecInfo.StepsPerTileStorm     := Round(1    / (fItems[UT].Speed * STORM_SPEEDUP));
    fItems[UT].fUnitSpecInfo.StepsPerTileStormDiag := Round(1.41 / (fItems[UT].Speed * STORM_SPEEDUP));
  end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  for UT := UNIT_MIN to UNIT_MAX do
  begin
    fItems[UT].fUnitSpecInfo.StepsPerTile          := Round(1    / fItems[UT].Speed);
    fItems[UT].fUnitSpecInfo.StepsPerTileDiag      := Round(1.41 / fItems[UT].Speed);
    fItems[UT].fUnitSpecInfo.StepsPerTileStorm     := Round(1    / (fItems[UT].Speed * STORM_SPEEDUP));
    fItems[UT].fUnitSpecInfo.StepsPerTileStormDiag := Round(1.41 / (fItems[UT].Speed * STORM_SPEEDUP));
  end;

  fItems[utWarrior].fUnitDat.Defence := 3;  //cmowla town hall changes (Make warrior an iron armored troop.)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 26 - Fix r15379's Campaign Progress BUG @@@
*************************************************************************
..\src\mission\KM_Campaigns.pas [2 Items]


procedure TKMCampaignsCollection.CampaignAdd(aCampaign: TKMCampaign);


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    SortCampaigns;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    //SortCampaigns; //cmowla campaign fix
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMCampaignsScanner.Execute;
var
  aPath: string;
  camp: TKMCampaign;
  searchRec: TSearchRec;
begin
  aPath := ExeDir + CAMPAIGNS_FOLDER_NAME + PathDelim;

  if not DirectoryExists(aPath) then Exit;

  try
    FindFirst(aPath + '*', faDirectory, searchRec);
    try
      repeat
        if (searchRec.Name <> '.') and (searchRec.Name <> '..')
          and (searchRec.Attr and faDirectory = faDirectory)
          and FileExists(aPath + searchRec.Name + PathDelim + 'info.cmp') then
        begin
          if SLOW_CAMPAIGN_SCAN then
            Sleep(2000);

          camp := TKMCampaign.Create;
          camp.LoadFromPath(aPath + searchRec.Name + PathDelim);
          fOnAdd(camp);
          // Load progress after each loaded campaign to collect info about unlocked maps before showing the campaign in the list
          // Its an overkill, but not a huge one, since everything is done in async thread anyway
          //
          // Todo: refactor
          // atm we can't show menu before all of the camoaigns are loaded.
          // this is because we call 'SaveProgress' on some events, f.e. when show campaign map
          // and if all of the campaigns are not loaded yet (including their progress)
          // then on that save some of the campaign data will be lost
          fOnLoadProgress(camp.ShortName);
          fOnAddDone(Self);
        end;
      until (FindNext(searchRec) <> 0) or Terminated;
    finally
      FindClose(searchRec);
    end;
  finally
    if not Terminated and Assigned(fOnComplete) then
      fOnComplete(Self);
  end;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMCampaignsScanner.Execute;
var
  aPath: string;
  camp: TKMCampaign;
  searchRec: TSearchRec;
  I: Integer;
  campaignArr, tempCampaignArr: Array of TKMCampaign;
begin
  aPath := ExeDir + CAMPAIGNS_FOLDER_NAME + PathDelim;

  if not DirectoryExists(aPath) then Exit;

  try
    FindFirst(aPath + '*', faDirectory, searchRec);
    try
      repeat
        if (searchRec.Name <> '.') and (searchRec.Name <> '..')
          and (searchRec.Attr and faDirectory = faDirectory)
          and FileExists(aPath + searchRec.Name + PathDelim + 'info.cmp') then
        begin
          if SLOW_CAMPAIGN_SCAN then
            Sleep(2000);

          camp := TKMCampaign.Create;
          camp.LoadFromPath(aPath + searchRec.Name + PathDelim);

		//cmowla campaign fix
          If (camp.ShortName = 'TPR') Or (camp.ShortName = 'TSK') Then begin
          //Prepend campaign to campaignArr
            SetLength(tempCampaignArr, 0);
            SetLength(tempCampaignArr, Length(campaignArr) + 1);
            For i := 0 to High(campaignArr) do tempCampaignArr[i + 1] := campaignArr[i];
            campaignArr := tempCampaignArr;
            campaignArr[0] := camp;
          end Else begin
          //Append campaign to campaignArr
            SetLength(campaignArr, Length(campaignArr) + 1);
            campaignArr[High(campaignArr)] := camp;
          end;

        end;
      until (FindNext(searchRec) <> 0) or Terminated;

	//cmowla campaign fix
      //Load campaigns to game from campaignArr (which is now sorted like {TSK, TPR, ... (alphabetical order)}). //cmowla campaign fix
        For i := 0 to High(campaignArr) do begin
          camp := campaignArr[i];
          fOnAdd(camp);
          // Load progress after each loaded campaign to collect info about unlocked maps before showing the campaign in the list
          // Its an overkill, but not a huge one, since everything is done in async thread anyway
          //
          // Todo: refactor
          // atm we can't show menu before all of the camoaigns are loaded.
          // this is because we call 'SaveProgress' on some events, f.e. when show campaign map
          // and if all of the campaigns are not loaded yet (including their progress)
          // then on that save some of the campaign data will be lost
          fOnLoadProgress(camp.ShortName);
          fOnAddDone(Self);
        end;
    finally
      FindClose(searchRec);
    end;
  finally
    if not Terminated and Assigned(fOnComplete) then
      fOnComplete(Self);
  end;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 27 HD Animations Support @@@
*************************************************************************
..\src\res\KM_ResInterpolation.pas [2 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
implementation
uses
  KM_CommonClasses, KM_Resource, KM_CommonTypes, KM_Pics, KM_ResUnits, KM_GameSettings;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
implementation
uses
  KM_CommonClasses, KM_Resource, KM_CommonTypes, KM_Pics, KM_ResUnits, KM_GameSettings, KM_RenderPool; //cmowla Siege Unit HD Animations (added KM_RenderPool)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TKMResInterpolation.UnitAction(aUnit: TKMUnitType; aAct: TKMUnitActionType; aDir: TKMDirection; aStep: Integer;
  aStepFrac: Single): Integer;
var
  A: TKMAnimLoop;
  step, subStep: Integer;
begin
  A := gRes.Units[aUnit].UnitAnim[aAct, aDir];

  step := aStep mod Byte(A.Count) + 1;
  subStep := EnsureRange(Floor(INTERP_LEVEL*aStepFrac), 0, INTERP_LEVEL-1);

  Result := fUnitActions[aUnit, aAct, aDir, step, subStep];

  // While in development disable interpolation if the sprite is missing
  if not gGameSettings.GFX.InterpolatedAnimations
  or (Result <= 0) or (Result > gRes.Sprites[rxUnits].RXData.Count)
  or (gRes.Sprites[rxUnits].RXData.Size[Result].X = 0) then
    Result := A.Step[step] + 1;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TKMResInterpolation.UnitAction(aUnit: TKMUnitType; aAct: TKMUnitActionType; aDir: TKMDirection; aStep: Integer;
  aStepFrac: Single): Integer;
var
  A: TKMAnimLoop;
  step, subStep: Integer;
begin
//cmowla Siege Unit HD Animations (the entire IF statement below).
//We have to do essentially the same thing as what we did in "procedure TKMRenderPool.AddUnit(", as the game apparently treats HD animations as completely different than normal ones.  (Of course ... There are animation "folders" for normal and ones for HD.)
  //If HD animation option is turned on,
  If gGameSettings.GFX.InterpolatedAnimations Then begin
    Case aUnit of
      utCatapult: begin
        Case aAct of
          uaWalk: Result := catapultWalkIDs[TKMDirectionToInt[aDir] + 1][aStep Mod 19];
          uaDie: Result := catapultDieIDs[TKMDirectionToInt[aDir] + 1][aStep Mod 21];
          uaWork: begin
            If aStep > 29 Then aStep := 0;
            Result := catapultWorkIDs[TKMDirectionToInt[aDir] + 1][aStep];
          end;
          Else begin
            A := gRes.Units[aUnit].UnitAnim[aAct, aDir];
            step := aStep mod Byte(A.Count) + 1;
            subStep := EnsureRange(Floor(INTERP_LEVEL*aStepFrac), 0, INTERP_LEVEL-1);
            Result := fUnitActions[aUnit, aAct, aDir, step, subStep];
          end;
        end;
      end;
      utBallista: begin
        Case aAct of
          uaWalk: Result := ballistaWalkIDs[TKMDirectionToInt[aDir] + 1][aStep Mod 19];
          uaDie: Result := ballistaDieIDs[TKMDirectionToInt[aDir] + 1][aStep Mod 21];
          uaWork: begin
            If aStep > 29 Then aStep := 0;
            Result := ballistaWorkIDs[TKMDirectionToInt[aDir] + 1][aStep];
          end;
          Else begin
            A := gRes.Units[aUnit].UnitAnim[aAct, aDir];
            step := aStep mod Byte(A.Count) + 1;
            subStep := EnsureRange(Floor(INTERP_LEVEL*aStepFrac), 0, INTERP_LEVEL-1);
            Result := fUnitActions[aUnit, aAct, aDir, step, subStep];
          end;
        end;
      end;
      Else begin
        A := gRes.Units[aUnit].UnitAnim[aAct, aDir];
        step := aStep mod Byte(A.Count) + 1;
        subStep := EnsureRange(Floor(INTERP_LEVEL*aStepFrac), 0, INTERP_LEVEL-1);
        Result := fUnitActions[aUnit, aAct, aDir, step, subStep];
      end;
    end
  end Else begin
    A := gRes.Units[aUnit].UnitAnim[aAct, aDir];
    step := aStep mod Byte(A.Count) + 1;
    subStep := EnsureRange(Floor(INTERP_LEVEL*aStepFrac), 0, INTERP_LEVEL-1);
    Result := fUnitActions[aUnit, aAct, aDir, step, subStep];
  end;

  if not gGameSettings.GFX.InterpolatedAnimations
  or (Result <= 0) or (Result > gRes.Sprites[rxUnits].RXData.Count)
  or (gRes.Sprites[rxUnits].RXData.Size[Result].X = 0)
  or (aUnit in UNITS_ANIMALS)//cmowla Siege Unit HD Animations - Don't show HD animations for animals (for now.  (Todo: Make "custom arrays" for the animals uaWalk so that their HD animations can be included.)
  then Result := A.Step[step] + 1;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 28 - Map Editor Player Alliances Table Bug Fix (Fix by Sado)
*************************************************************************


=========================================================================
..\src\gui\pages_maped\mission\KM_GUIMapEdMissionAlliances.pas [2 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
PopUp_Alliances: TKMPopUpMenu;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
PopUp_Alliances: TKMPopUpPanel;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
constructor TKMMapEdMissionAlliances.Create(aParent: TKMPanel);
var
  I, K: Integer;
begin
  inherited Create;

  PopUp_Alliances := TKMPopUpMenu.Create(aParent.MasterParent, 0);
  PopUp_Alliances.Width := (TB_PANEL_A_L * 2) + (TB_CHB_A_L * 2) + (TB_CHB_A_W * MAX_HANDS);
  PopUp_Alliances.Height := (TB_PANEL_A_T * 2) + (TB_CHB_A_T * 2) + (TB_CHB_A_H * MAX_HANDS) + TB_CHB_A_H + 10;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
constructor TKMMapEdMissionAlliances.Create(aParent: TKMPanel);
var
	I, K, AlliancesWidth, AlliancesHeight: Integer;
begin
  inherited Create;
  AlliancesWidth := (TB_PANEL_A_L * 2) + (TB_CHB_A_L * 2) + (TB_CHB_A_W * MAX_HANDS) - 70;
  AlliancesHeight := (TB_PANEL_A_T * 2) + (TB_CHB_A_T * 2) + (TB_CHB_A_H * MAX_HANDS) + TB_CHB_A_H - 120;
  PopUp_Alliances := TKMPopUpPanel.Create(aParent.MasterParent, AlliancesWidth, AlliancesHeight);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 29 - Siege Workshop Rally Point
*************************************************************************


=========================================================================
..\src\game\gip\KM_GameInputProcess.pas [6 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
gicHouseTownHallMaxGold,            //Set TownHall MaxGold value
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    gicHouseTownHallMaxGold,            //Set TownHall MaxGold value
    gicHouseSiegeWorkshopRally,         //Set the rally point for the Siege Workshop //cmowla Siege Workshop - Rally Point
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    gicHouseTownHallMaxGold,
    gicHouseRemoveTrain,
    gicHouseWoodcuttersCutting];


  COMMAND_PACK_TYPES: array[TKMGameInputCommandType] of TKMGameInputCommandPackType = (
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    gicHouseTownHallMaxGold,
    gicHouseSiegeWorkshopRally, //cmowla Siege Workshop - Rally Point
    gicHouseRemoveTrain,
    gicHouseWoodcuttersCutting];


  COMMAND_PACK_TYPES: array[TKMGameInputCommandType] of TKMGameInputCommandPackType = (
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    gicpt_Int2,     // gicHouseTownHallMaxGold
    gicpt_Int2,     // gicHouseRemoveTrain
    gicpt_Int3,     // gicHouseWoodcuttersCutting
    //V.     Delivery ratios changes (and other game-global settings)
    gicpt_Int3,     // gicWareDistributionChange
    gicpt_AnsiStr1, // gicWareDistributions
    //VI.      Game changes
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    gicpt_Int2,     // gicHouseTownHallMaxGold
    gicpt_Int3,     // gicHouseSiegeWorkshoppRally //cmowla Siege Workshop - Rally Point
    gicpt_Int2,     // gicHouseRemoveTrain
    gicpt_Int3,     // gicHouseWoodcuttersCutting
    //V.     Delivery ratios changes (and other game-global settings)
    gicpt_Int3,     // gicWareDistributionChange
    gicpt_AnsiStr1, // gicWareDistributions
    //VI.      Game changes
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    if CommandType in [gicHouseRepairToggle, gicHouseDeliveryModeNext, gicHouseDeliveryModePrev, gicHouseWoodcuttersCutting, gicHouseTownHallMaxGold,
      gicHouseOrderProduct, gicHouseMarketFrom, gicHouseMarketTo, gicHouseBarracksRally, gicHouseTownHallRally,
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    if CommandType in [gicHouseRepairToggle, gicHouseDeliveryModeNext, gicHouseDeliveryModePrev, gicHouseWoodcuttersCutting, gicHouseTownHallMaxGold,
      gicHouseOrderProduct, gicHouseMarketFrom, gicHouseMarketTo, gicHouseBarracksRally, gicHouseTownHallRally, gicHouseSiegeWorkshopRally, //cmowla Siege Workshop - Rally Point
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      gicHouseTownHallMaxGold:   TKMHouseTownHall(srcHouse).GoldMaxCnt := EnsureRange(IntParams[1], 0, High(Word));
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      gicHouseTownHallMaxGold:   TKMHouseTownHall(srcHouse).GoldMaxCnt := EnsureRange(IntParams[1], 0, High(Word));
      gicHouseSiegeWorkshopRally: TKMHouseSiegeWorkshop(srcHouse).FlagPoint := KMPoint(IntParams[1], IntParams[2]); //cmowla Siege Workshop - Rally Point
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMGameInputProcess.CmdHouse(aCommandType: TKMGameInputCommandType; aHouse: TKMHouse; const aLoc: TKMPoint);
begin
  Assert((aCommandType = gicHouseBarracksRally) or (aCommandType = gicHouseTownHallRally) or (aCommandType = gicHouseWoodcuttersCutting));
  Assert((aHouse is TKMHouseBarracks) or (aHouse is TKMHouseTownHall) or (aHouse is TKMHouseWoodcutters));
  TakeCommand(MakeCommand(aCommandType, aHouse.UID, aLoc.X, aLoc.Y));
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMGameInputProcess.CmdHouse(aCommandType: TKMGameInputCommandType; aHouse: TKMHouse; const aLoc: TKMPoint);
begin
//cmowla Siege Workshop - Rally Point
  Assert(aCommandType in [gicHouseBarracksRally, gicHouseTownHallRally, gicHouseSiegeWorkshopRally, gicHouseWoodcuttersCutting]);
  Assert((aHouse is TKMHouseBarracks) or (aHouse is TKMHouseTownHall) or (aHouse.HouseType = htSiegeWorkshop) or (aHouse is TKMHouseWoodcutters));
  TakeCommand(MakeCommand(aCommandType, aHouse.UID, aLoc.X, aLoc.Y));
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\gui\KM_InterfaceGamePlay.pas [3 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      if gMySpectator.Selected is TKMHouseTownHall then
        gGame.GameInputProcess.CmdHouse(gicHouseTownHallRally, TKMHouse(gMySpectator.Selected), loc)
      else
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      if gMySpectator.Selected is TKMHouseTownHall then
        gGame.GameInputProcess.CmdHouse(gicHouseTownHallRally, TKMHouse(gMySpectator.Selected), loc)
      else
      if gMySpectator.Selected is TKMHouseSiegeWorkshop then  //cmowla Siege Workshop - Rally Point
        gGame.GameInputProcess.CmdHouse(gicHouseSiegeWorkshopRally, TKMHouse(gMySpectator.Selected), loc)
      else
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            or (gMySpectator.Selected is TKMHouseTownHall)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            or (gMySpectator.Selected is TKMHouseTownHall)
            or (gMySpectator.Selected is TKMHouseSiegeWorkshop)//cmowla Siege Workshop - Rally Point
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            if gMySpectator.Selected is TKMHouseTownHall then
              gGame.GameInputProcess.CmdHouse(gicHouseTownHallRally, TKMHouse(gMySpectator.Selected), P)
            else
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            if gMySpectator.Selected is TKMHouseTownHall then
              gGame.GameInputProcess.CmdHouse(gicHouseTownHallRally, TKMHouse(gMySpectator.Selected), P)
            else
            if gMySpectator.Selected is TKMHouseSiegeWorkshop then  //cmowla Siege Workshop - Rally Point
              gGame.GameInputProcess.CmdHouse(gicHouseSiegeWorkshopRally, TKMHouse(gMySpectator.Selected), P)
            else
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\gui\pages_maped\KM_GUIMapEdHouse.pas [5 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    procedure StoreSelectWare(Sender: TObject);

    procedure ShowCommonResources;
    procedure HideAllCommonResources;
  protected
    Panel_House: TKMPanel;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    procedure StoreSelectWare(Sender: TObject);

    procedure ShowCommonResources;
    procedure HideAllCommonResources;

  //cmowla Siege Workshop - Rally Point
    procedure Create_SiegeWorkshop;
    procedure SiegeWorkshopRefresh;
  protected
    Panel_HouseSiegeWorkshop: TKMPanel;
    Button_SiegeWorkshop_RallyPoint: TKMButtonFlat;

    Panel_House: TKMPanel;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  Create_TownHall;
  Create_Woodcutters;
end;


procedure TKMMapEdHouse.Create_Common(aParent: TKMPanel);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  Create_TownHall;
  Create_SiegeWorkshop;   //cmowla Siege Workshop - Rally Point
  Create_Woodcutters;
end;

    procedure TKMMapEdHouse.Create_SiegeWorkshop;
    begin
      Panel_HouseSiegeWorkshop := TKMPanel.Create(Panel_House,0,76,Panel_House.Width,400);
        Button_SiegeWorkshop_RallyPoint := TKMButtonFlat.Create(Panel_HouseSiegeWorkshop, 0, 8, Panel_House.Width, 22, 0);
        Button_SiegeWorkshop_RallyPoint.CapOffsetY := -11;
        Button_SiegeWorkshop_RallyPoint.Caption := gResTexts[TX_HOUSES_RALLY_POINT];
        Button_SiegeWorkshop_RallyPoint.Hint := Format(gResTexts[TX_MAPED_RALLY_POINT_HINT], [gRes.Houses[htSiegeWorkshop].HouseName]);
        Button_SiegeWorkshop_RallyPoint.OnClick := SetRallyPointClick;
    end;

    procedure TKMMapEdHouse.SiegeWorkshopRefresh;
    begin
      Button_SiegeWorkshop_RallyPoint.Down := (gCursor.Mode = cmMarkers) and (gCursor.Tag1 = MARKER_RALLY_POINT);
    end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMMapEdHouse.UpdateState;
begin
  if Visible then
    case fHouse.HouseType of
      htBarracks:    Button_Barracks_RallyPoint.Down := (gCursor.Mode = cmMarkers) and (gCursor.Tag1 = MARKER_RALLY_POINT);
      htTownHall:    Button_TownHall_RallyPoint.Down := (gCursor.Mode = cmMarkers) and (gCursor.Tag1 = MARKER_RALLY_POINT);
      htWoodcutters: Button_Woodcutters_CuttingPoint.Down := (gCursor.Mode = cmMarkers) and (gCursor.Tag1 = MARKER_RALLY_POINT);
    end;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMMapEdHouse.UpdateState;
begin
  if Visible then
    case fHouse.HouseType of
      htBarracks:    Button_Barracks_RallyPoint.Down := (gCursor.Mode = cmMarkers) and (gCursor.Tag1 = MARKER_RALLY_POINT);
      htTownHall:    Button_TownHall_RallyPoint.Down := (gCursor.Mode = cmMarkers) and (gCursor.Tag1 = MARKER_RALLY_POINT);
      htSiegeWorkshop: Button_TownHall_RallyPoint.Down := (gCursor.Mode = cmMarkers) and (gCursor.Tag1 = MARKER_RALLY_POINT); //cmowla Siege Workshop - Rally Point
      htWoodcutters: Button_Woodcutters_CuttingPoint.Down := (gCursor.Mode = cmMarkers) and (gCursor.Tag1 = MARKER_RALLY_POINT);
    end;
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




procedure TKMMapEdHouse.Show(aHouse: TKMHouse);

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    htTownHall:    begin
                      Panel_HouseTownHall.Show;
                      TownHallRefresh;
                    end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    htTownHall:    begin
                      Panel_HouseTownHall.Show;
                      TownHallRefresh;
                    end;
    htSiegeWorkshop: begin //cmowla Siege Workshop - Rally Point
                      Panel_House.Show;
                      Label_House_Input.Hide;
                      SiegeWorkshopRefresh;
                      Panel_HouseSiegeWorkshop.Show;
                     end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMMapEdHouse.SetRallyPointClick(Sender: TObject);
var
  btn: TKMButtonFlat;
begin
  if (Sender <> Button_Barracks_RallyPoint)
  and (Sender <> Button_TownHall_RallyPoint)
  and (Sender <> Button_Woodcutters_CuttingPoint) then
    Exit;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMMapEdHouse.SetRallyPointClick(Sender: TObject);
var
  btn: TKMButtonFlat;
begin
  if (Sender <> Button_Barracks_RallyPoint)
  and (Sender <> Button_TownHall_RallyPoint)
  and (Sender <> Button_SiegeWorkshop_RallyPoint) //cmowla Siege Workshop - Rally Point
  and (Sender <> Button_Woodcutters_CuttingPoint) then
    Exit;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\houses\KM_HouseBarracks.pas [2 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  // Barracks have 11 wares and Recruits
  TKMHouseBarracks = class(TKMHouseWFlagPoint)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//cmowla Siege Workshop - Rally Point
  TKMHouseSiegeWorkshop = class(TKMHouseWFlagPoint)
  public
    constructor Create(aUID: Integer; aHouseType: TKMHouseType; PosX, PosY: Integer; aOwner: TKMHandID; aBuildState: TKMHouseBuildState);
    constructor Load(LoadStream: TKMemoryStream); override;
    procedure Save(SaveStream: TKMemoryStream); override;
  end;

  // Barracks have 11 wares and Recruits
  TKMHouseBarracks = class(TKMHouseWFlagPoint)
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
{ TKMHouseBarracks }
constructor TKMHouseBarracks.Create(aUID: Integer; aHouseType: TKMHouseType; PosX, PosY: Integer; aOwner: TKMHandID; aBuildState: TKMHouseBuildState);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//cmowla Siege Workshop - Rally Point
    constructor TKMHouseSiegeWorkshop.Create(aUID: Integer; aHouseType: TKMHouseType; PosX, PosY: Integer; aOwner: TKMHandID; aBuildState: TKMHouseBuildState);
    begin
      inherited;
    end;

    constructor TKMHouseSiegeWorkshop.Load(LoadStream: TKMemoryStream);
    begin
      inherited;
      LoadStream.CheckMarker('HouseSiegeWorkshop');
    end;

    procedure TKMHouseSiegeWorkshop.Save(SaveStream: TKMemoryStream);
    begin
      inherited;
      SaveStream.PlaceMarker('HouseSiegeWorkshop');
    end;


{ TKMHouseBarracks }
constructor TKMHouseBarracks.Create(aUID: Integer; aHouseType: TKMHouseType; PosX, PosY: Integer; aOwner: TKMHandID; aBuildState: TKMHouseBuildState);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\houses\KM_HouseCollection.pas [2 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    htTownHall:      Result := TKMHouseTownHall.Create(uid, aHouseType,aPosX,aPosY, aOwner, aHBS);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    htTownHall:      Result := TKMHouseTownHall.Create(uid, aHouseType,aPosX,aPosY, aOwner, aHBS);
    htSiegeWorkshop:      Result := TKMHouseSiegeWorkshop.Create(uid, aHouseType,aPosX,aPosY, aOwner, aHBS); //cmowla Siege Workshop - Rally Point
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      htTownHall:      H := TKMHouseTownHall.Load(LoadStream);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      htTownHall:      H := TKMHouseTownHall.Load(LoadStream);
      htSiegeWorkshop: H := TKMHouseSiegeWorkshop.Load(LoadStream); //cmowla Siege Workshop - Rally Point
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\res\KM_ResHouses.pas [1 Item]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TKMHouseSpec.FlagPointTexId: Word;
begin
  case fHouseType of
    htBarracks:     Result := 249;
    htTownHall:     Result := 249;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
function TKMHouseSpec.FlagPointTexId: Word;
begin
  case fHouseType of
    htBarracks:     Result := 249;
    htTownHall:     Result := 249;
    htSiegeWorkshop: Result := 249; //cmowla Siege Workshop - Rally Point
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 30 - Advanced AI Support (Making Villages More Productive...The easy way.)
*************************************************************************


=========================================================================
..\src\ai\newAI\KM_CityManagement.pas [3 Items]

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  function RequiredSerfCount: Integer;
  var
    I, serfCount, idleCount: Integer;
  begin
    serfCount := gHands[fOwner].Stats.GetUnitQty(utSerf);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  function RequiredSerfCount: Integer;
  var
    I, serfCount, idleCount: Integer;
  begin
    serfCount := gHands[fOwner].Stats.GetUnitQty(utSerf);

  //cmowla Advanced AI Support - MAX_SERFS_ADVANCED_AI Serf Limit
    If serfCount >= MAX_SERFS_ADVANCED_AI Then begin
      Result := 0;
      Exit;
    end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
procedure TKMCityManagement.AfterMissionInit();
begin
  if SP_DEFAULT_ADVANCED_AI then
  begin
    fSetup.EnableAdvancedAI(True);
  end;

  // Find resources around Loc and change building policy
  gAIFields.Eye.ScanLoc();
  fPredictor.AfterMissionInit();
  fBuilder.AfterMissionInit();
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//cmowla Advanced AI Support - Give Food At Mission Start
Procedure Give_AAI_Players_65K_Starting_Food(aPlayer: TKMHandID);
var I: Integer; S: TKMHouseStore;
begin
  //Iterate through all Stores and add 65k loaves and sausages for aPlayer.
  for I := 0 to gHands[aPlayer].Houses.Count - 1 do
    with gHands[aPlayer] do
      if (Houses[I] <> nil)
        AND not Houses[I].IsDestroyed
        AND (Houses[I].HouseType = htStore)
        AND Houses[I].IsComplete then
      begin
        S := TKMHouseStore(Houses[I]);
        //Remove all previous sausage/bread from this storehouse
         S.WareTake(wtSausage, S.CheckWareIn(wtSausage) + S.CheckWareOut(wtSausage), False);
         S.WareTake(wtBread, S.CheckWareIn(wtBread) + S.CheckWareOut(wtBread), False);

        //Add desired amount of each.
         S.WareAddToEitherFromScript(wtSausage, STARTING_SAUSAGE_ADVANCED_AI);
         S.WareAddToEitherFromScript(wtBread, STARTING_BREAD_ADVANCED_AI);

        //Make this the actual initial amount (for game stats to not crash the game, due to starting with a different quantity).
         gHands[aPlayer].Stats.ChangeInitialWareAmount(wtSausage, STARTING_SAUSAGE_ADVANCED_AI);
         gHands[aPlayer].Stats.ChangeInitialWareAmount(wtBread, STARTING_BREAD_ADVANCED_AI);
      end;
end;


procedure TKMCityManagement.AfterMissionInit();
begin
  if SP_DEFAULT_ADVANCED_AI then
  begin
    fSetup.EnableAdvancedAI(True);
  end;

  // Find resources around Loc and change building policy
  gAIFields.Eye.ScanLoc();
  fPredictor.AfterMissionInit();
  fBuilder.AfterMissionInit();

  If gHands[fOwner].IsAdvancedAI Then Give_AAI_Players_65K_Starting_Food(fOwner); //cmowla Advanced AI Support - Give Food At Mission Start
end;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




*************************************************************************
* Part 31 - Siege Unit Balance Scripting Functions
*************************************************************************
//The Action script function should be run in Procedure OnMissionStart; Only!  (Otherwise replay breaks will occur!)


=========================================================================
..\src\scripting\KM_ScriptingActions.pas [2 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//* Version: 7000+
//* Stops playing any sound that was previously started by any of PlayWAV***, PlayOGG*** or PlaySound*** functions
//* aSoundIndex: value that was returned by either of those functions when the sound was started.
procedure TKMScriptActions.StopSound(aSoundIndex: Integer);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//cmowla Siege Unit Balanace
procedure TKMScriptActions.SiegeUnitSetSpecEx(siegeUnitType: TKMUnitType; specToChange: TKMSiegeUnitSpec; value: Integer);
var aGameTime, H, M, S: Integer; timeStr: String;
begin
  try
    aGameTime := gGameParams.Tick;
    H := aGameTime div 36000;
    M := (aGameTime div 600) mod 60;
    S := (aGameTime div 10) mod 60;
    timeStr := AnsiString(Format('%.2d:%.2d:%.2d', [H, M, S]));
    case siegeUnitType of
      utCatapult: begin
        case specToChange of
          suFireDelayVsUnits:
            If value >= 30
            Then begin
              CATAPULT_FIRE_DELAY_VS_UNITS := value;
              Log('suFireDelayVsUnits changed to ' + IntToStr(value) + ' ticks for CATAPULTS. [' + timeStr + '].');
            end
            Else LogIntParamWarn('Actions.SiegeUnitSetSpecEx: (suFireDelayVsUnits must be >= 30 ticks.  Current value is: ' + IntToStr(CATAPULT_FIRE_DELAY_VS_UNITS) + '.)', []);

          suFireDelayVsHouses:
            If value >= 30
            Then begin
             CATAPULT_FIRE_DELAY_VS_HOUSES := value;
             Log('suFireDelayVsHouses changed to ' + IntToStr(value) + ' ticks for CATAPULTS. [' + timeStr + '].');
            end
            Else LogIntParamWarn('Actions.SiegeUnitSetSpecEx: (suFireDelayVsHouses must be >= 30 ticks.  Current value (for CATAPULT) is: ' + IntToStr(CATAPULT_FIRE_DELAY_VS_HOUSES) + '.)', []);

          suEnemyUnitDamageProbability:
            If (value >= 0) Or (value <= 100)
            Then begin
              CATAPULT_DAMAGE_PROBABILITY := value;
              Log('suEnemyUnitDamageProbability changed to ' + IntToStr(value) + ' % for CATAPULTS. [' + timeStr + '].');
            end
            Else LogIntParamWarn('suEnemyUnitDamageProbability is a percentage between 0 and 100.  Current value (for CATAPULT) is: ' + IntToStr(CATAPULT_DAMAGE_PROBABILITY) + '.)', []);

          suGroupPotency:
            If (value >= 1) Or (value <= 100)
            Then begin
              CATAPULT_POTENCY := value;
              Log('suGroupPotency changed to ' + IntToStr(value) + ' % for CATAPULTS. [' + timeStr + '].');
            end
            Else LogIntParamWarn('suGroupPotency is a percentage between 1 and 100.  Current value (for CATAPULT) is: ' + IntToStr(CATAPULT_POTENCY) + '.)', []);
        end;
      end;
      utBallista: begin
        case specToChange of
          suFireDelayVsUnits:
            If value >= 30
            Then begin
              BALLISTA_FIRE_DELAY_VS_UNITS := value;
              Log('suFireDelayVsUnits changed to ' + IntToStr(value) + ' ticks for BALLISTAS. [' + timeStr + '].');
            end
            Else LogIntParamWarn('Actions.SiegeUnitSetSpecEx: (suFireDelayVsUnits must be >= 30 ticks.  Current value (for BALLISTA) is: ' + IntToStr(BALLISTA_FIRE_DELAY_VS_UNITS) + '.)', []);

          suFireDelayVsHouses:
            If value >= 30
            Then begin
             BALLISTA_FIRE_DELAY_VS_HOUSES := value;
             Log('suFireDelayVsHouses changed to ' + IntToStr(value) + ' ticks for BALLISTAS. [' + timeStr + '].');
            end
            Else LogIntParamWarn('Actions.SiegeUnitSetSpecEx: (suFireDelayVsHouses must be >= 30 ticks.  Current value (for BALLISTA) is: ' + IntToStr(BALLISTA_FIRE_DELAY_VS_HOUSES) + '.)', []);

          suEnemyUnitDamageProbability:
            If (value >= 0) Or (value <= 100)
            Then begin
              BALLISTA_POTENCY := value;
              Log('suEnemyUnitDamageProbability changed to ' + IntToStr(value) + ' % for BALLISTAS. [' + timeStr + '].');
            end
            Else LogIntParamWarn('suEnemyUnitDamageProbability is a percentage between 0 and 100.  Current value (for BALLISTA) is: ' + IntToStr(BALLISTA_POTENCY) + '.)', []);

          suGroupPotency: LogIntParamWarn('Actions.SiegeUnitSetSpecEx: (Ballista does not have a suGroupPotency property.)', []);
        end;
      end;
      Else LogIntParamWarn('Actions.SiegeUnitSetSpecEx: (Not a siege unit type!)', [])
    end;
  except
    gScriptEvents.ExceptionOutsideScript := True; //Don't blame script for this exception
    raise;
  end;
end;

//* Version: 7000+
//* Stops playing any sound that was previously started by any of PlayWAV***, PlayOGG*** or PlaySound*** functions
//* aSoundIndex: value that was returned by either of those functions when the sound was started.
procedure TKMScriptActions.StopSound(aSoundIndex: Integer);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    procedure StopSound(aSoundIndex: Integer);

    procedure RemoveRoad(X, Y: Integer);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    procedure SiegeUnitSetSpecEx(siegeUnitType: TKMUnitType; specToChange: TKMSiegeUnitSpec; value: Integer); //cmowla Siege Unit Balanace
    procedure StopSound(aSoundIndex: Integer);
    procedure RemoveRoad(X, Y: Integer);
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\scripting\KM_ScriptingStates.pas [2 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function PlayerWareDistributionEx(aHand: Integer; aWareType: TKMWareType; aHouseType: TKMHouseType): Integer;

    function StatAIDefencePositionsCount(aHand: Byte): Integer;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    function PlayerWareDistributionEx(aHand: Integer; aWareType: TKMWareType; aHouseType: TKMHouseType): Integer;
    function SiegeUnitSpecsEx(siegeUnitType: TKMUnitType): AnsiString; //cmowla Siege Unit Balanace

    function StatAIDefencePositionsCount(aHand: Byte): Integer;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//* Version: 5165
//* Returns an array with IDs for all the units of the specified player
//* Result: Array of unit IDs
function TKMScriptStates.PlayerGetAllUnits(aHand: Byte): TIntegerArray;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//cmowla Siege Unit Balanace
function TKMScriptStates.SiegeUnitSpecsEx(siegeUnitType: TKMUnitType): AnsiString;
begin
  try
  case siegeUnitType of
    utCatapult: Result :=
      '[CATAPULT specs]:  FireDelayVsUnits (ticks): ' + IntToStr(CATAPULT_FIRE_DELAY_VS_UNITS) + '|' +
      'FireDelayVsHouses (ticks): ' + IntToStr(CATAPULT_FIRE_DELAY_VS_HOUSES) + '|' +
      'EnemyUnitDamageProbability: ' + IntToStr(CATAPULT_DAMAGE_PROBABILITY) + '|' +
      'suGroupPotency: ' + IntToStr(CATAPULT_POTENCY);

    utBallista: Result :=
      '[BALLISTA specs]:  FireDelayVsUnits (ticks): ' + IntToStr(BALLISTA_FIRE_DELAY_VS_UNITS) + '|' +
      'FireDelayVsHouses (ticks): ' + IntToStr(BALLISTA_FIRE_DELAY_VS_HOUSES) + '|' +
      'EnemyUnitDamageProbability: ' + IntToStr(BALLISTA_POTENCY);

    else begin
      Result := '';
      LogIntParamWarn('States.SiegeUnitSpecsEx: (Not a siege unit type!)', [])
    end;
  end;
  except
    gScriptEvents.ExceptionOutsideScript := True; //Don't blame script for this exception
    raise;
  end;
end;



//* Version: 5165
//* Returns an array with IDs for all the units of the specified player
//* Result: Array of unit IDs
function TKMScriptStates.PlayerGetAllUnits(aHand: Byte): TIntegerArray;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\scripting\KM_Scripting.pas [5 Items]


[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
'utWaterflower, utWaterleaf, utDuck)');
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      'utWaterflower, utWaterleaf, utDuck)');

    Sender.AddTypeS('TKMSiegeUnitSpec','(suFireDelayVsUnits, suFireDelayVsHouses, suEnemyUnitDamageProbability, suGroupPotency)'); //cmowla Siege Unit Balanace
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    RegisterMethodCheck(c, 'function  PlayerWareDistributionEx(aHand: Integer; aWareType: TKMWareType; aHouseType: TKMHouseType): Integer');
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    RegisterMethodCheck(c, 'function  PlayerWareDistributionEx(aHand: Integer; aWareType: TKMWareType; aHouseType: TKMHouseType): Integer');
    RegisterMethodCheck(c, 'function  SiegeUnitSpecsEx(siegeUnitType: TKMUnitType): AnsiString'); //cmowla Siege Unit Balanace
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    RegisterMethodCheck(c, 'function  PlayWAVLooped(aHand: ShortInt; aFileName: AnsiString; aVolume: Single): Integer');
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    RegisterMethodCheck(c, 'function  PlayWAVLooped(aHand: ShortInt; aFileName: AnsiString; aVolume: Single): Integer');
    RegisterMethodCheck(c, 'procedure  SiegeUnitSetSpecEx(siegeUnitType: TKMUnitType; specToChange: TKMSiegeUnitSpec; value: Integer)'); //cmowla Siege Unit Balanace
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      RegisterMethod(@TKMScriptStates.WarriorInFight, 'WarriorInFight');
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      RegisterMethod(@TKMScriptStates.WarriorInFight, 'WarriorInFight');
      RegisterMethod(@TKMScriptStates.SiegeUnitSpecsEx, 'SiegeUnitSpecsEx'); //cmowla Siege Unit Balanace
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -



[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      RegisterMethod(@TKMScriptActions.PlayWAVLooped, 'PlayWAVLooped');
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      RegisterMethod(@TKMScriptActions.PlayWAVLooped, 'PlayWAVLooped');
      RegisterMethod(@TKMScriptActions.SiegeUnitSetSpecEx, 'SiegeUnitSetSpecEx'); //cmowla Siege Unit Balanace
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




=========================================================================
..\src\common\KM_Defaults.pas [2 Items]

[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
TKMUnitTypeSet = set of TKMUnitType;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  TKMUnitTypeSet = set of TKMUnitType;

  TKMSiegeUnitSpec = (suFireDelayVsUnits, suFireDelayVsHouses, suEnemyUnitDamageProbability, suGroupPotency);  //cmowla Siege Unit Balanace
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -




[Old Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
NET_PROTOCOL_REVISON := AnsiString('r' + IntToStr(NET_PROTOCOL_REVISION_NUM));
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

[New Code]
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  NET_PROTOCOL_REVISON := AnsiString('r' + IntToStr(NET_PROTOCOL_REVISION_NUM));

//cmowla Siege Unit Balanace
  CATAPULT_FIRE_DELAY_VS_UNITS := 65; //In ticks (30 = minimum)
  BALLISTA_FIRE_DELAY_VS_UNITS := 65; //In ticks (30 = minimum)

  CATAPULT_FIRE_DELAY_VS_HOUSES := 50; //In ticks (30 = minimum)
  BALLISTA_FIRE_DELAY_VS_HOUSES := 50; //In ticks (30 = minimum)

//This is NOT a percentage (it's a factor).
//The more catapults there are in a group, the more noticable the change is.  (The greater the value, the more the potency.)
//(45 - 55 seems to be a reasonable base range to consider.)
  CATAPULT_POTENCY := 45;
  CATAPULT_DAMAGE_PROBABILITY := 50; //Percent of the time a catapult will cause at least SOME damage to enemy unit (1 or 2 HP).

//The percentage of the time a ballista bolt kills a unit it reaches.  (Otherwise, no damage is done.)
  BALLISTA_POTENCY := 80;
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -



(And remove all CONSTANTS which have the same names as the above in this same module.)