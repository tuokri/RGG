class RGGGameInfoDomination extends ROGameInfoTerritories;

static event class<GameInfo> SetGameType(string MapName, string Options, string Portal)
{
    local string ThisMapPrefix;

    ReplaceText(MapName, "UEDPIE", "");
    ThisMapPrefix = Left(MapName, InStr(MapName, "-"));

    if (ThisMapPrefix ~= "RGDO")
    {
        return class'RGGGameInfoDomination';
    }
    /*
    else if (ThisMapPrefix ~= "RGTE")
    {
        return class'';
    }
    else if (ThisMapPrefix ~= "RGSU")
    {
        return class'';
    }
    else if (ThisMapPrefix ~= "RGSK")
    {
        return class'';
    }
    */

    return super.SetGameType(MapName, Options, Portal);
}

/*
function class<Pawn> GetPlayerClass(Controller C)
{
    local ROPlayerReplicationInfo ROPRI;
    local class<Pawn> PawnClass;

    ROPRI = ROPlayerReplicationInfo(C.PlayerReplicationInfo);

    if ( ROPRI != none )
    {
        if ( ROPRI.RoleInfo != none )
        {
            if ( ROPRI.Team.TeamIndex == `AXIS_TEAM_INDEX )
            {
                PawnClass = class<Pawn>(DynamicLoadObject("RGG.RGGNorthPawn", class'Class'));
                return PawnClass;
            }
            else if ( ROPRI.Team.TeamIndex == `ALLIES_TEAM_INDEX )
            {
                PawnClass = class<Pawn>(DynamicLoadObject("RGG.RGGSouthPawn", class'Class'));
                return PawnClass;
            }
            else
            {
                `warn("Invalid team index:" @ ROPRI.Team.TeamIndex);
            }
        }
        else
        {
            `warn("Player's Role Info is none");
        }
    }

    return DefaultPawnClass;
}
*/

DefaultProperties
{
    PlayerControllerClass=class'RGGPlayerController'
    PlayerReplicationInfoClass=class'RGGPlayerReplicatonInfo'
    GameReplicationInfoClass=class'RGGGameReplicationInfo'
    PawnHandlerClass=class'RGGPawnHandler'
    TeamInfoClass=class'RGGTeamInfo'
    HUDType=class'RGGHUD'

    NorthRoleContentClasses=(LevelContentClasses=("RGG.RGGNorthPawn"))
    SouthRoleContentClasses=(LevelContentClasses=("RGG.RGGSouthPawn"))
}
