class RGGPlayerReplicatonInfo extends ROPlayerReplicationInfo;

simulated function ClientInitialize(Controller C)
{
    super.ClientInitialize(C);

    PawnHandlerClass = class'RGGPawnHandler';
}

DefaultProperties
{
    PawnHandlerClass=class'RGGPawnHandler'
}
