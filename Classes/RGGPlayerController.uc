class RGGPlayerController extends ROPlayerController
    config(Mutator_RGG_Game);

function InitialiseCCMs()
{
    local ROCharacterPreviewActor ROCPA, CPABoth;
    local RGGCharCustMannequin TempCCM;

    if( WorldInfo.NetMode == NM_DedicatedServer )
        return;

    if( ROCCC == none )
    {
        ROCCC = Spawn(class'ROCharCustController');

        if( ROCCC != none )
            ROCCC.ROPCRef = self;
    }

    // Iterate through all the worlds character customization mannequins (should be 2!).
    foreach WorldInfo.DynamicActors(class'ROCharacterPreviewActor', ROCPA)
    {
        if( ROCPA.OwningTeam == EOT_Both )
        {
            CPABoth = ROCPA;
        }
        else if( AllCCMs[ROCPA.OwningTeam] == none )
        {
            AllCCMs[ROCPA.OwningTeam] = Spawn(class'RGGCharCustMannequin', self,, ROCPA.Location, ROCPA.Rotation);
        }
    }

    // If any actors were missing, create a default one
    if( AllCCMs[0] == none || AllCCMs[1] == none )
    {
        if( CPABoth != none )
            TempCCM = Spawn(class'RGGCharCustMannequin', self,, CPABoth.Location, CPABoth.Rotation);
        else
        {
            TempCCM = Spawn(class'RGGCharCustMannequin', self, , vect(0,0,100));
            `warn("Couldn't find an ROCharacterPreviewActor, the level designer has not added one to the map! Creating a default one"@TempCCM);
        }

        TempCCM.SetOwningTeam(EOT_Both);

        if( AllCCMs[0] == none )
            AllCCMs[0] = TempCCM;

        if( AllCCMs[1] == none )
            AllCCMs[1] = TempCCM;
    }
}

exec function Camera(name NewMode)
{
    ServerCamera(NewMode);
}

reliable server function ServerCamera(name NewMode)
{
    if (NewMode == '1st')
    {
        NewMode = 'FirstPerson';
    }
    else if (NewMode == '3rd')
    {
        NewMode = 'ThirdPerson';
    }
    else if (NewMode == 'free')
    {
        NewMode = 'FreeCam';
    }
    else if (NewMode == 'fixed')
    {
        NewMode = 'Fixed';
    }

    SetCameraMode(NewMode);

    if (PlayerCamera != None)
    {
        `rgglog("CameraStyle=" $ PlayerCamera.CameraStyle);
    }
}

function vector MakeVector(float X, float Y, float Z)
{
    local vector V;

    V.X = X;
    V.Y = Y;
    V.Z = Z;

    return V;
}

simulated exec function SetScopePosition(float X, float Y, float Z)
{
    ROSniperWeapon(Pawn.Weapon).ScopePosition = MakeVector(X, Y, Z);
}

exec function SetScopeZ(float NewScopeZ)
{
    ROSniperWeapon(Pawn.Weapon).ScopeLenseMIC.SetScalarParameterValue('v_position', NewScopeZ);
}

simulated exec function SetShoulderedPosition(float X, float Y, float Z)
{
    ROWeapon(Pawn.Weapon).ShoulderedPosition = MakeVector(X, Y, Z);
}

simulated exec function SetSightPitch(int RangeIndex, int NewSightPitch)
{
    ROWeapon(Pawn.Weapon).SightRanges[RangeIndex].SightPitch = NewSightPitch;
    ROWeapon(Pawn.Weapon).SightIndexUpdated();
}

simulated exec function SetSightSlideOffset(int RangeIndex, float NewSightSlideOffset)
{
    ROWeapon(Pawn.Weapon).SightRanges[RangeIndex].SightSlideOffset = NewSightSlideOffset;
    ROWeapon(Pawn.Weapon).SightIndexUpdated();
}

simulated exec function SetSightPositionOffset(int RangeIndex, float NewSightPositionOffset)
{
    ROWeapon(Pawn.Weapon).SightRanges[RangeIndex].SightPositionOffset = NewSightPositionOffset;
    ROWeapon(Pawn.Weapon).SightIndexUpdated();
}

simulated exec function SetAddedPitch(int RangeIndex, int NewAddedPitch)
{
    ROWeapon(Pawn.Weapon).SightRanges[RangeIndex].AddedPitch = NewAddedPitch;
    ROWeapon(Pawn.Weapon).SightIndexUpdated();
}

exec function SetPlayerViewOffset(float X, float Y, float Z)
{
    ROWeapon(Pawn.Weapon).PlayerViewOffset = MakeVector(X, Y, Z);
}

exec function SetIronsightPosX(float NewX)
{
    ROWeapon(Pawn.Weapon).IronSightPosition.X = NewX;
    ROWeapon(Pawn.Weapon).PlayerViewOffset.X = NewX;
}

// Helper function for working out a nice ironsight position when changing the weapon zoom FoV
exec function SetIronsightPosY(float NewY)
{
    ROWeapon(Pawn.Weapon).IronSightPosition.Y = NewY;
    ROWeapon(Pawn.Weapon).PlayerViewOffset.Y = NewY;
}

// Helper function for working out a nice ironsight position when changing the weapon zoom FoV
exec function SetIronsightPosZ(float NewZ)
{
    ROWeapon(Pawn.Weapon).IronSightPosition.Z = NewZ;
    ROWeapon(Pawn.Weapon).PlayerViewOffset.Z = NewZ;
}

exec function SetISFocusDepth(float NewDepth)
{
    ROWeapon(Pawn.Weapon).ISFocusDepth = NewDepth;
}

exec function SetISFocusBlendRadius(float NewRadius)
{
    ROWeapon(Pawn.Weapon).ISFocusBlendRadius = NewRadius;
}

exec function SetSightRot(int SightRot)
{
    ROWeapon(Pawn.Weapon).SightRotController.SetSkelControlStrength( 1.0f , 0.0f );
    ROWeapon(Pawn.Weapon).SightRotController.BoneRotation.Pitch = SightRot * -1;
}

exec function SetSightSlide(float SlideLoc)
{
    ROWeapon(Pawn.Weapon).SightSlideController.SetSkelControlStrength( 1.0f , 0.0f );
    ROWeapon(Pawn.Weapon).SightSlideController.BoneTranslation.X = SlideLoc;
}

exec function SetSightZ(float NewZ)
{
    ROWeapon(Pawn.Weapon).IronSightPosition.Z = NewZ;
    ROWeapon(Pawn.Weapon).PlayerViewOffset.Z = NewZ;
}

DefaultProperties
{
    // CharacterSceneTemplate=RGGUISceneCharacter''
}
