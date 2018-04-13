with ada.text_io;
use ada.text_io;

Package body gestion_pile is

Procedure saisie_mot (s : out declaration_adherent.mot) is
	k : integer;
begin
	loop
		begin
		put ("Saisie prénom : ");
		get_line(s,k);
		exit;
		exception
			when constraint_error=>skip_line; put("Erreur, recommencer");
			new_line;
			when data_error=>skip_line; put("Erreur, recommencer");new_line;
		end;
	end loop;
end saisie_mot;


Procedure ajout_adherent (InfoAdherent : out declaration_adherent.T_Adherent) is
	s : string(1..14);
	act : declaration_adherent.T_Activite;
	k : integer;
begin
	new_line;
	put ("== Procedure d'inscription=="); new_line; new_line;
	put ("Saisie prénom : ");
	saisie_mot(InfoAdherent.prenom);
	new_line;
	put ("Saisie nom : ");
	saisie_mot(InfoAdherent.nom);
	new_line;
	put ("Saisie date de naissance (JJ/MM/AAAA) : ");
	loop
		begin
			get(InfoAdherent.DateNaissance.jour); 
			get(InfoAdherent.DateNaissance.mois); 
			get(InfoAdherent.DateNaissance.annee); 
			skip_line;
			exit;
			exception
				when constraint_error=>skip_line; put("Erreur, recommencer");
				new_line;
				when data_error=>skip_line; put("Erreur, recommencer");
				new_line;
		end;
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
end ajout_adherent;



end gestion_pile;