With declaration_adherent;

package gestion_pile is

Type T_CelluleAdherents;
Type  T_PteurPileAdherents is access T_CelluleAdherents;
Type T_CelluleAdherents is record
	Adherent : declaration_adherent.T_Adherent;
	suiv : T_PteurPileAdherents;
end record;

Procedure saisie_mot (s : out declaration_adherent.mot);
Procedure ajout_adherent (InfoAdherent : out declaration_adherent.T_Adherent);

end gestion_pile;