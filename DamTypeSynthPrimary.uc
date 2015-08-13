class DamTypeSynthPrimary extends SynthesoldierDamageProj
	abstract;
	
static function AwardDamage(KFSteamStatsAndAchievements KFStatsAndAchievements, int Amount) 
{
   if( SRStatsBase(KFStatsAndAchievements)!=None && SRStatsBase(KFStatsAndAchievements).Rep!=None )
   SRStatsBase(KFStatsAndAchievements).Rep.ProgressCustomValue(Class'SynthPerkProg',Amount);
}

//TODO I need to finish this later 
defaultproperties
{
	HeadShotDamageMult=1.00;
	WeaponClass=Class'SynthPerk.SynthPrimaryWeap'
}