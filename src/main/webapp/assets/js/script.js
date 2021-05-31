(function($) {
	$(function() {
		var puzzleData = [
			 	{
					clue: "Es uno de los sintomas del covid-19 \n\
                                               se ve afectado el poder comer normal",
					answer: "perdidadelgusto",
					position: 1,
					orientation: "across",
					startx: 4,
					starty: 6
				},
			 	{
					clue: "Se dio una pandemia grobal debido a:",
					answer: "covid-19",
					position: 3,
					orientation: "across",
					startx: 8,
					starty: 4
				},
				{
					clue: "Es una vacuna de origen Aleman / Estadounidense",
					answer: "pfizer",
					position: 8,
					orientation: "across",
					startx: 1,
					starty: 9
				},
                                {
					clue: "Tiempo recomdendable de aislamiento de una \n\
                                               persona, escribe el numero de dias en letras",
					answer: "catorce",
					position: 2,
					orientation: "across",
					startx: 7,
					starty: 8
				},
                                {
					clue: "A las personas que no presentan sintomas \n\
                                               al tener sintomas se les conoce como:",
					answer: "asintomatico",
					position: 4,
					orientation: "across",
					startx: 5,
					starty: 11
				},
				{
					clue: "Lugar de origen del COVID-19",
					answer: "china",
					position: 1,
					orientation: "down",
					startx: 8,
					starty: 4
				},
                                {
					clue: "Termino para describir aislamineto de personas,\n\
                                               como metodo para limitar el riesgo de que se \n\
                                               extienda una enfermedad",
					answer: "cuarentena",
					position: 5,
					orientation: "down",
					startx: 5,
					starty: 2
				},
				{
					clue: "Es uno de los grupos de riesgo por COVID-19",
					answer: "adultosmayores",
					position: 6,
					orientation: "down",
					startx: 18,
					starty: 1
				}
			] 
	
		$('#puzzle-wrapper').crossword(puzzleData);
		
	})
	
})(jQuery)


