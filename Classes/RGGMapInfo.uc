class RGGMapInfo extends ROMapInfo;

function InitRolesForGametype(class<GameInfo> GameTypeClass, int MaxPlayers, bool bReverseRoles)
{
    if (bInitializedRoles)
    {
        return;
    }

    bInitializedRoles = true;
}

/*
function PreLoadSharedContentForGameType()
{
    local RORoleInfoClasses NorthPawnContentClasses;
    local RORoleInfoClasses SouthPawnContentClasses;
    local ROGameReplicationInfo ROGRI;
    // local int i;

    ROGRI = ROGameReplicationInfo(class'WorldInfo'.static.GetWorldInfo().GRI);

    NorthPawnContentClasses = class'RGGGameInfoDomination'.default.NorthRoleContentClasses;
    SouthPawnContentClasses = class'RGGGameInfoDomination'.default.SouthRoleContentClasses;

    SharedContentReferences.Remove(0, SharedContentReferences.Length);
    class'WorldInfo'.static.GetWorldInfo().ForceGarbageCollection(TRUE);

    // SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_Maxim_ActualContent", class'Class')));
    // SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_QuadMaxims_ActualContent", class'Class')));

    if (NorthernTeamLeader.RoleInfo != none)
    {
        NorthernTeamLeader.RoleInfo.PreLoadContent(NorthPawnContentClasses.LevelContentClasses, ROGRI.RoleInfoItemsIdx);
    }

    if (SouthernTeamLeader.RoleInfo != none)
    {
        SouthernTeamLeader.RoleInfo.PreLoadContent(SouthPawnContentClasses.LevelContentClasses, ROGRI.RoleInfoItemsIdx);
    }
}
*/

function int GetNorthernNation()
{
    return `AXIS_TEAM_INDEX;
}

function int GetSouthernNation()
{
    return `ALLIES_TEAM_INDEX;
}

static function int GetNationForArmy(byte ArmyIndex)
{
    if (ArmyIndex >= 1)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

function int GetNumArmiesForTeam(byte TeamIndex)
{
    return 1;
}

DefaultProperties
{
    DefendingTeam=DT_None
    DefendingTeam16=DT_None
    DefendingTeam32=DT_None
    DefendingTeam64=DT_None

       SouthernForce=SFOR_USArmy
    NorthernForce=NFOR_NVA

    NorthernRoles.Empty
    NorthernRoles(0)=(RoleInfoClass=class'RGGRoleInfoNorthernSwordsman',Count=255)

    SouthernRoles.Empty
    SouthernRoles[0]=(RoleInfoClass=class'RGGRoleInfoSouthernSwordsman',Count=255)
}
