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

Procedure deja_inscrit (infos : declaration_adherent.T_Adherent ; Pteur : T_PteurPileAdherents ; inscrit : out boolean ; meme_contrat : out boolean) is
begin
	if Pteur = null then inscrit := false ; meme_contrat := false;
	else if Pteur.adherent.nom=infos.nom and then Pteur.adherent.prenom=infos.prenom then
			inscrit := true;
			if declaration_adherent.T_Activite'image(Pteur.adherent.Typecontrat)=declaration_adherent.T_Activite'image(infos.Typecontrat) then
			meme_contrat:=true;
			else meme_contrat:=false;
			end if;
		else deja_inscrit(infos,Pteur.suiv,inscrit,meme_contrat);
		end if;
	end if;
end deja_inscrit;

Procedure modification_contrat (infos : declaration_adherent.T_Adherent ; Pteur : in out T_PteurPileAdherents) is
begin
	if Pteur /= null then
		if Pteur.adherent.nom=infos.nom and then Pteur.adherent.prenom=infos.prenom then
		Pteur.adherent.Typecontrat:=infos.Typecontrat;
		else modification_contrat(infos,Pteur.suiv);
		end if;
	end if;
end modification_contrat;


Procedure ajout_adherent (Pteur : in out T_PteurPileAdherents) is
	s : string(1..14);
	act : declaration_adherent.T_Activite;
	k : integer;
	correct : boolean := false;
	date_adherent : dates.T_Date;
	InfoAdherent : declaration_adherent.T_Adherent;
	present_pile,contrat_identique : boolean := false;
	confirmation : character;
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
				when constraint_error=>put("Erreur, recommencer");
				new_line;
				when data_error=>put("Erreur, recommencer");
				new_line;
		end;
	end loop;
	InfoAdherent.TypeContrat:=Act;
	InfoAdherent.DateDerniereAdhesion:=dates.date_jour;
	deja_inscrit(InfoAdherent,Pteur,present_pile,contrat_identique);
	if not present_pile then  -- vérification que l'inscrit n'est pas déjà présent dans la pile
		Pteur := new T_CelluleAdherents'(InfoAdherent,Pteur);
		new_line;
		put ("Enregistrement effectué");
		new_line;
	else 
		new_line;
		put("Personne déjà inscrite");
		new_line;
		if contrat_identique=true then 
			put ("Contrat identique au précédent, pas de modification");
			new_line;
		else put ("Contrat différent du précédent, modifier ? (o/n) ");
		loop
			get(confirmation); skip_line;
			case confirmation is
				when 'o'|'O'=>
					put("Modification du contrat ");
					modification_contrat(InfoAdherent,Pteur);
					new_line;
					exit;
				when 'n'|'N'=>
					put("Contrat non modifié");
					new_line;
					exit;
				when others => put ("Erreur dans la saisie, recommencer");
					new_line;
			end case;
		end loop;
		end if;
	end if;
end ajout_adherent;

end gestion_pile;
