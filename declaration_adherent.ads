Package declaration_adherent is

N : constant integer := 3;
P : constant integer := 4;

subtype mot is string(1..20);
Type T_Activite is (Aqua, Fitness, AquaEtFitness);

Type T_Adherent is record
	Nom : mot := (others=>' ');
	Prenom : mot := (others=>' ');
	DateNaissance : T_Date := (1,1,1);
	NbSeances : positive := 0;
	TypeContrat : T_Activite;
	-- PlaningSemaine1 : ;
	-- PlaningSemaine2 : ;
end record;

-- Type PlaningAdherent is record
-- end record;

end declaration_adherent;