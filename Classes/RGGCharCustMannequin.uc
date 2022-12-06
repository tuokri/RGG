class RGGCharCustMannequin extends ROCharCustMannequin
    notplaceable;

event PostBeginPlay()
{
    super.PostBeginPlay();

    PawnHandlerClass = class'RGGPawnHAndler';
}

function AttachPreviewWeapon(byte TeamIndex, byte ArmyIndex)
{

}

DefaultProperties
{
    PawnHandlerClass=class'RGGPawnHAndler'

    WeaponMeshes.Empty
    WeaponMeshes(0)=(WeaponMesh=SkeletalMesh'RGG_Assets.Mesh.Katana_3rd',RelativeLocation=(X=0,Y=0,Z=0),WeaponType=0)
    WeaponMeshes(1)=(WeaponMesh=SkeletalMesh'RGG_Assets.Mesh.Katana_3rd',RelativeLocation=(X=0,Y=0,Z=0),WeaponType=0)
    WeaponMeshes(2)=(WeaponMesh=SkeletalMesh'RGG_Assets.Mesh.Katana_3rd',RelativeLocation=(X=0,Y=0,Z=0),WeaponType=0)
    WeaponMeshes(3)=(WeaponMesh=SkeletalMesh'RGG_Assets.Mesh.Katana_3rd',RelativeLocation=(X=0,Y=0,Z=0),WeaponType=0)
    WeaponMeshes(4)=(WeaponMesh=SkeletalMesh'RGG_Assets.Mesh.Katana_3rd',RelativeLocation=(X=0,Y=0,Z=0),WeaponType=0)
    WeaponMeshes(5)=(WeaponMesh=SkeletalMesh'RGG_Assets.Mesh.Katana_3rd',RelativeLocation=(X=0,Y=0,Z=0),WeaponType=0)
}
