#include "macros/scrcmd.inc"
#include "res/text/bank/unk_0383.h"


    ExternalScriptEntry PokedexRating_CheckRowan
    ExternalScriptEntry PokedexRating_CheckPC
    ExternalScriptEntry PokedexRating_CheckOak
    ExternalScriptEntry PokedexRating_CheckNationalDex
    ScriptEntryEnd

ExternalScriptLabel PokedexRating_CheckRowan:
    BufferPlayerName 0
    Message 0
    ShowYesNoMenu VAR_RESULT
    GoToIfEq VAR_RESULT, MENU_NO, _0031
    GoTo _003E
    End

_0031:
    Message 2
    WaitABXPadPress
    CloseMessage
    ReleaseAll
    ReturnCommonScript
    End

_003E:
    Call _00E8
    CloseMessage
    ReleaseAll
    ReturnCommonScript
    End

ExternalScriptLabel PokedexRating_CheckOak:
    BufferPlayerName 0
    GetPlayerGender VAR_RESULT
    CallIfEq VAR_RESULT, GENDER_MALE, _0086
    CallIfEq VAR_RESULT, GENDER_FEMALE, _008B
    ShowYesNoMenu VAR_RESULT
    GoToIfEq VAR_RESULT, MENU_NO, _0090
    GoTo PokedexRating_CheckNationalDex_Local
    End

_0086:
    Message 18
    Return

_008B:
    Message 19
    Return

_0090:
    Message 21
    WaitABXPadPress
    CloseMessage
    ReleaseAll
    ReturnCommonScript
    End

ExternalScriptLabel PokedexRating_CheckNationalDex:
PokedexRating_CheckNationalDex_Local:
    Call _0126
    CloseMessage
    ReleaseAll
    ReturnCommonScript
    End

ExternalScriptLabel PokedexRating_CheckPC:
    Call _00B5
    ReturnCommonScript
    End

_00B5:
    GetNationalDexEnabled VAR_RESULT
    GoToIfEq VAR_RESULT, 0, _00D6
    GoToIfEq VAR_RESULT, 1, _00DF
    End

_00D6:
    Message 43
    GoTo _00E8

_00DF:
    Message 44
    GoTo _0126

_00E8:
    GoToIfUnset FLAG_UNK_0x09BA, _0104
    CheckLocalDexCompleted VAR_RESULT
    CallIfEq VAR_RESULT, 1, _0120
_0104:
    GetLocalDexSeenCount VAR_0x8004
    BufferNumber 0, VAR_0x8004
    Message 1
    ScrCmd_123 0, VAR_RESULT
    BufferPlayerName 0
    MessageVar VAR_RESULT
    WaitABPress
    Return

_0120:
    SetFlag FLAG_UNK_0x0110
    Return

_0126:
    GetNationalDexCaughtCount VAR_0x8004
    GetPlayerGender VAR_0x8005
    BufferNumber 0, VAR_0x8004
    Message 20
    ScrCmd_123 1, VAR_RESULT
    BufferPlayerName 0
    MessageVar VAR_RESULT
    WaitABPress
    Return

    .balign 4, 0
