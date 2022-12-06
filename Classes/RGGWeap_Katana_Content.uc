class RGGWeap_Katana_Content extends RGGWeap_Katana;

DefaultProperties
{
	ArmsAnimSet=AnimSet'RGG_Assets.Animation.WP_KatanaHands'

	// Weapon SkeletalMesh
	Begin Object Name=FirstPersonMesh
		DepthPriorityGroup=SDPG_Foreground
		SkeletalMesh=SkeletalMesh'RGG_Assets.Mesh.Katana_1st'
		PhysicsAsset=None
		AnimSets(0)=AnimSet'RGG_Assets.Animation.WP_KatanaHands'
		Animations=AnimTree'RGG_Assets.Animation.JP_Katana_Tree'
		Scale=1.0
		FOV=70
	End Object

	// Pickup staticmesh
	Begin Object Name=PickupMesh
		SkeletalMesh=SkeletalMesh'RGG_Assets.Mesh.Katana_3rd'
		// PhysicsAsset=PhysicsAsset'ZM_WP_RS_3rd_Master.Phy.Katana_3rd_Physics'
		CollideActors=true
		BlockActors=true
		BlockZeroExtent=true
		BlockNonZeroExtent=true//false
		BlockRigidBody=true
		bHasPhysicsAssetInstance=false
		bUpdateKinematicBonesFromAnimation=false
		PhysicsWeight=1.0
		RBChannel=RBCC_GameplayPhysics
		RBCollideWithChannels=(Default=TRUE,GameplayPhysics=TRUE,EffectPhysics=TRUE)
		bSkipAllUpdateWhenPhysicsAsleep=TRUE
		bSyncActorLocationToRootRigidBody=true
	End Object

	AttachmentClass=class'RGGWeapAttach_Katana'
}
