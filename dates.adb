With ada.text_io, ada.integer_text_io;
Use ada.text_io, ada.integer_text_io;

package body dates is 
	
	Function verification_date_bisextile (d : T_Date) return boolean is
	begin
		if ((d.annee mod 4=0) and (d.annee mod 100/=0)) or (d.annee mod 400=0) then
			put("Annee bisextile"); --un peu de verbose pour faire plaisir à Annie
			new_line;
			if d.mois = 2 and then d.jour>28 then
				return false;
			else return true;
			end if;
		else return true;
		end if;
	end verification_date_bisextile;

 	Procedure saisie_date (d : out T_Date ; fait : out boolean) is
 	begin
 		new_line;
 		put ("Saisir jour : ");
 		loop
 			begin
 			get(d.jour);
 			skip_line;
 			exit;
 			exception
 				when data_error=> skip_line; put ("Erreur, recommencer"); new_line;
 				when constraint_error=> skip_line; put ("Erreur, recommencer"); new_line;
 			 	end;
 		end loop;

 		new_line;
 		put ("Saisir mois : ");
 		loop
 			begin
 			get(d.mois);
 			skip_line;
 			exit;
 			exception
 				when data_error=> skip_line; put ("Erreur, recommencer"); new_line;
 				when constraint_error=> skip_line; put ("Erreur, recommencer"); new_line;
 			end;
 		end loop;

 		new_line;
 		put("Saisir annee : ");
 		loop
 			begin
 			get(d.annee);
 			skip_line;
 			exit;
 			exception
 				when data_error=> skip_line; put ("Erreur, recommencer"); new_line;
 				when constraint_error=> skip_line; put ("Erreur, recommencer"); new_line;
 			end;
 		end loop;
 		if verification_date_bisextile(d) then
 			new_line;
 			put("Date correcte"); new_line;
 			fait := true;
 		else new_line;
 			put("Date incorrecte"); new_line;
 			fait := false;
 		end if;
 	end saisie_date;
      
end dates;

