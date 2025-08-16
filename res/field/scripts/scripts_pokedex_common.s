#include "macros/scrcmd.inc"
#include "res/text/bank/pokedex_common.h"


    CommonScriptEntry PokedexCommon_CheckRowan
    CommonScriptEntry PokedexCommon_CheckPC
    CommonScriptEntry PokedexCommon_CheckOak
    CommonScriptEntry PokedexCommon_CheckNationalDex
    ScriptEntryEnd

DefCommonScript PokedexCommon_CheckRowan:
    BufferPlayerName 0
    Message PokedexCommon_Text_RowanShowMeYourPokedex
    ShowYesNoMenu VAR_RESULT
    GoToIfEq VAR_RESULT, MENU_NO, PokedexCommon_CheckRowanDecline
    GoTo PokedexCommon_CheckRowanAccept
    End

PokedexCommon_CheckRowanDecline:
    Message PokedexCommon_Text_RowanAfraidToShowMe
    WaitABXPadPress
    CloseMessage
    ReleaseAll
    ReturnCommonScript
    End

PokedexCommon_CheckRowanAccept:
    Call PokedexCommon_RateLocalDex
    CloseMessage
    ReleaseAll
    ReturnCommonScript
    End

DefCommonScript PokedexCommon_CheckOak:
    BufferPlayerName 0
    GetPlayerGender VAR_RESULT
    CallIfEq VAR_RESULT, GENDER_MALE, PokedexCommon_OakPromptMessageMale
    CallIfEq VAR_RESULT, GENDER_FEMALE, PokedexCommon_OakPromptMessageFemale
    ShowYesNoMenu VAR_RESULT
    GoToIfEq VAR_RESULT, MENU_NO, PokedexCommon_CheckOakDecline
    GoTo PokedexCommon_Internal_CheckNationalDex
    End

PokedexCommon_OakPromptMessageMale:
    Message PokedexCommon_Text_OakShowMeYourPokedex_Male
    Return

PokedexCommon_OakPromptMessageFemale:
    Message PokedexCommon_Text_OakShowMeYourPokedex_Female
    Return

PokedexCommon_CheckOakDecline:
    Message PokedexCommon_Text_OakComeSeeMe
    WaitABXPadPress
    CloseMessage
    ReleaseAll
    ReturnCommonScript
    End

DefCommonScript PokedexCommon_CheckNationalDex:
PokedexCommon_Internal_CheckNationalDex:
    Call PokedexCommon_RateNationalDex
    CloseMessage
    ReleaseAll
    ReturnCommonScript
    End

DefCommonScript PokedexCommon_CheckPC:
    Call PokedexCommon_CheckPCNationalOrLocal
    ReturnCommonScript
    End

PokedexCommon_CheckPCNationalOrLocal:
    GetNationalDexEnabled VAR_RESULT
    GoToIfEq VAR_RESULT, FALSE, PokedexCommon_CheckPCLocalDex
    GoToIfEq VAR_RESULT, TRUE, PokedexCommon_CheckPCNationalDex
    End

PokedexCommon_CheckPCLocalDex:
    Message PokedexCommon_Text_AccessedProfessorRowansPC
    GoTo PokedexCommon_RateLocalDex

PokedexCommon_CheckPCNationalDex:
    Message PokedexCommon_Text_AccessedProfessorOaksPC
    GoTo PokedexCommon_RateNationalDex

PokedexCommon_RateLocalDex:
    GoToIfUnset FLAG_FIRST_ARRIVAL_ETERNA_CITY, PokedexCommon_JustRateLocalDex
    CheckLocalDexCompleted VAR_RESULT
    CallIfEq VAR_RESULT, TRUE, PokedexCommon_LocalDexCompleted
PokedexCommon_JustRateLocalDex:
    PokedexSeenLocalCount VAR_0x8004
    BufferNumber 0, VAR_0x8004
    Message PokedexCommon_Text_PokemonSpottedInSinnoh
    LoadPokedexRating FALSE, VAR_RESULT
    BufferPlayerName 0
    MessageVar VAR_RESULT
    WaitABPress
    Return

PokedexCommon_LocalDexCompleted:
    SetFlag FLAG_COMPLETE_LOCAL_DEX_RATING
    Return

PokedexCommon_RateNationalDex:
    PokedexCaughtNationalCount VAR_0x8004
    GetPlayerGender VAR_0x8005
    BufferNumber 0, VAR_0x8004
    Message PokedexCommon_Text_PokemonCaughtSoFar
    LoadPokedexRating TRUE, VAR_RESULT
    BufferPlayerName 0
    MessageVar VAR_RESULT
    WaitABPress
    Return

    .balign 4, 0
