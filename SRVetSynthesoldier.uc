class SRVetSynthesoldier extends SRVeterancyTypes
	abstract;
	
static function AddCustomStats( ClientPerkRepLink Other )
{
	Other.AddCustomValue(Class'SynthPerkProg');
}

var array<int> progressArray;

//Perk Progression (Max Lv20?) | TODO: Find something for GetDoubleScaling...
static function int GetPerkProgressInt( ClientPerkRepLink StatOther, out int FinalInt, byte CurLevel, byte ReqNum )
{
	if (CurLevel < 11)
	{
		FinalInt = default.progressArray[CurLevel];
	}
	else
	{
		FinalInt = default.progressArray[10] + GetDoubleScaling(CurLevel,10000); // 
	}
	return Min(StatOther.GetCustomValueInt(Class'SynthPerkProg'),FinalInt);
}

//===========================================
// SYNTHESOLDIER PERK FEATURES
//===========================================

//*********************************
//*** Increasing Weapon Damage  ***
//*********************************
static function int AddDamage(KFPlayerReplicationInfo KFPRI, KFMonster Injured, KFPawn DamageTaker, int InDamage, class<DamageType> DmgType)
{
	if( class<KFWeaponDamageType>(DamTypeSynthPrimary) != none || class<KFWeaponDamageType>(DamTypeSynthSecondary) != none )
	{
		// Starts with 0% increase in Synthesoldier Damage, increases by 10% every level, up to +200% at Lv20)
		return float(InDamage) * (1.0 + (0.10 * float(Min(KFPRI.ClientVeteranSkillLevel, 20))));
	}

	return InDamage;
}

//*********************************
//*** Increasing Melee AtkSpd   ***
//*********************************

//TODO: Increasing Melee Attack speed

//*********************************
//***   Increasing Fire Rate    ***
//*********************************

//TODO: Increasing Weapon Fire Rate

//*********************************
//***  Increasing Move Speed    ***
//*********************************

//TODO: Increasing Movement Speed

//*********************************
//***   Increasing Melee MS     ***
//*********************************

//TODO: Increasing Melee Movement Speed

//*********************************
//***   Increasing Armor STR    ***
//*********************************

//TODO: Increasing Armour Strength

//===========================================
// SYNTHESOLDIER PERK FEATURES ENDS
//===========================================

/***
 * SYNTHESOLDIER SPAWN WITH WEAPON
 */

static function AddDefaultInventory(KFPlayerReplicationInfo KFPRI, Pawn P)
{
	// If playing Synthesoldier, Give Primary Weapon and Body Armor
	if ( KFPRI.ClientVeteranSkillLevel >= 0 )
	{
		KFHumanPawn(P).CreateInventoryVeterancy("Synthesoldier.SynthesoldierPrimary", GetCostScaling(KFPRI, class'SynthesoldierPrimaryPickup'));
		P.ShieldStrength=100;
	}

} 
 
//Damage Progression is for testing purposes only.
defaultproperties
{
	progressArray(0) =  1000
	progressArray(1) =  2500
	progressArray(2) =  4500
	progressArray(3) =  7000
	progressArray(4) = 10000
	progressArray(5) = 13500
	progressArray(6) = 17000
	progressArray(7) = 22000
	progressArray(8) = 27500
	progressArray(9) = 33500
	progressArray(10)= 40000
	
	VeterancyName="Synthesoldier"
	
	//Borrowed Guardian's Icons for Testing Purposes only
	OnHUDIcon=Texture'GuardianPerkIcons.Perks.GuardianPerkRed'
    OnHUDGoldIcon=Texture'GuardianPerkIcons.Perks.GuardianPerkGold'
	//TODO OnHUDIcon
	//TODO OnHUDGoldIcon
	//TODO? OnHUDEliteIcon
	//TODO? OnHUDEliteGoldIcon
	
	Requirements(0)="Deal %x Damage with Synthesoldier Weapons"
	
	//TODO SRLevelEffets(0-10)
	
	PerkIndex=51
}