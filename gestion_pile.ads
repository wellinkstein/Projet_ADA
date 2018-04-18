With declaration_adherent, dates;

package gestion_pile is

Type T_CelluleAdherents;
Type  T_PteurPileAdherents is access T_CelluleAdherents;
Type T_CelluleAdherents is record
	Adherent : declaration_adherent.T_Adherent;
	suiv : T_PteurPileAdherents;
end record;

Procedure saisie_mot (s : out declaration_adherent.mot);
Procedure deja_inscrit (infos : declaration_adherent.T_Adherent ; Pteur : T_PteurPileAdherents ; inscrit : out boolean ; meme_contrat : out boolean);
Procedure modification_contrat (infos : declaration_adherent.T_Adherent ; Pteur : in out T_PteurPileAdherents);
Procedure ajout_adherent (Pteur : in out T_PteurPileAdherents);
end gestion_pile;
