With dates;
Package declaration_adherent is

N : constant integer := 3;
P : constant integer := 4;

subtype mot is string(1..20);
   type T_Activite is (Aqua, Fitness, AquaEtFitness);
   


Type T_Adherent is record
	Nom : mot := (others=>' ');
	Prenom : mot := (others=>' ');
	DateNaissance : dates.T_Date := (1,1,1);
	DateDerniereAdhesion : dates.T_Date := (1,1,1);
	NbSeances : integer := 0;
   Typecontrat : T_Activite;
   --Benjamin
	--PlaningSemaine1 : T_planning; de sem_j_cren.ads  
	-- PlaningSemaine2 : T_planning;
      
end record;

--Benjamin T_Tabadherents is array(integer range <>)of T_Adherent;


-- Type PlaningAdherent is record
-- end record;

end declaration_adherent;
