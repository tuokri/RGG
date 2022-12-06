class RGGHUD extends ROHUD
    config(Mutator_RGG_HUD);

event PostBeginPlay()
{
    super.PostBeginPlay();

    // TODO: fix log spam from this.
    HUDWidgetList.RemoveItem(CamoIndicatorWidget);
    CamoIndicatorWidget.Destroy();
    CamoIndicatorWidget=None;
}

DefaultProperties
{
    DefaultWeaponWidget=class'RGGHUDWidgetWeapon'
}
