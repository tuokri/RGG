class RGGSouthPawn extends ROSouthPawn;

`include(RGG\Classes\RGGPawn_Common.uci)

DefaultProperties
{
    TunicMesh=SkeletalMesh'RGG_Assets.Mesh.S_Yakuza_Suit_Black'

    FieldgearMesh=None

    HeadAndArmsMesh=SkeletalMesh'CHR_VN_ARVN_Heads.Mesh.ARVN_Head6_Mesh'
    HeadAndArmsMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN_Heads.Materials.M_ARVN_Head_06_Long_INST'

    HeadgearMesh=None

    bCanCamouflage=False
    bSingleHandedSprinting=True

    PawnHandlerClass=class'RGGPawnHandler'
}
