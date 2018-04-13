with ada.text_io;
use ada.text_io;

Package body gestion_pile is

Procedure saisie_mot (s : out declaration_adherent.mot) is
	k : integer;
begin
	loop
		begin
		get_line(s,k);
		exit;
		exception
			when constraint_error=>skip_line; put("Erreur, recommencer");
			new_line;
			when data_error=>skip_line; put("Erreur, recommencer");new_line;
		end;
	end loop;
end saisie_mot;


Procedure ajout_adherent (Pteur : in out T_PteurPileAdherents) is
	s : string(1..14);
	act : declaration_adherent.T_Activite;
	k : integer;
	correct : boolean := false;
	date_adherent : dates.T_Date;
	InfoAdherent : declaration_adherent.T_Adherent;
begin
	new_line;
	put ("== Procedure d'inscription=="); new_line; new_line;
	put ("Saisie prénom : ");
	saisie_mot(InfoAdherent.prenom);
	new_line;
	put ("Saisie nom : ");
	saisie_mot(InfoAdherent.nom);
	new_line;

	put ("Saisie date de naissance (JJ/MM/AAAA) : "); new_line;

	loop
		dates.saisie_date(date_adherent,correct);
		exit when correct=true;
		new_line;
		put ("Erreur, recommencer la saisie de la date de naissance");
		new_line;
	end loop;

	new_line;
	put("Saisir votre activité, 'Fitness', 'Aqua', 'AquaEtFitness' : ");
	loop
		begin
			get_line(s,k);
			act:=declaration_adherent.T_Activite'value(s(1..k));
			exit;
			exception
				when constraint_error=>skip_line; put("Erreur, recommencer");
				new_line;
				when data_error=>skip_line; put("Erreur, recommencer");
				new_line;
		end;
	end loop;
	InfoAdherent.TypeContrat:=Act;
	Pteur := new T_CelluleAdherents'(InfoAdherent,Pteur);
	new_line;
	put ("Enregistrement effectué");
	new_line;

end ajout_adherent;

end gestion_pile;
