class RGGNorthPawn extends RONorthPawn;

`include(RGG\Classes\RGGPawn_Common.uci)

DefaultProperties
{
    TunicMesh=SkeletalMesh'RGG_Assets.Mesh.S_Yakuza_Suit_White'

    FieldgearMesh=None

    HeadAndArmsMesh=SkeletalMesh'CHR_VN_VN_Heads.Mesh.VN_Head1_Mesh'
    HeadAndArmsMICTemplate=MaterialInstanceConstant'CHR_VN_VN_Heads.Materials.M_VN_Head_01_Long_INST'

    HeadgearMesh=None

    bCanCamouflage=False
    bSingleHandedSprinting=True

    PawnHandlerClass=class'RGGPawnHandler'
}
